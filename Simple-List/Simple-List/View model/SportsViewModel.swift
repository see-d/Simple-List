//
//  ViewModel.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import Foundation

final class SportsViewModel: NSObject {
    @objc dynamic private(set) var onStateChanged:Int = 0
    
    private(set) var state:State = .initial {
        didSet {
            onStateChanged += 1
        }
    }
    
    enum State {
        case initial
        case loading
        case success([Feature.Domain.Sport])
        case failure(Error)
    }
    
    private var visibleSections:[Int] = []
    
    func title(for section:Int) -> String? {
        switch state {
        case .success(let sports):
            guard sports.indices.contains(section) else { return nil }
            return sports[section].title
        default:
            return nil
        }
    }
    
    func toggleEvents(for section: Int) -> Bool {
        if visibleSections.contains(section) {
            visibleSections.removeAll(where: { $0 == section} )
            return false
        } else {
            visibleSections.append(section)
            return true
        }
    }
    
    func shouldShowEvents(for section:Int) -> Int {
        return visibleSections.contains(section) ? 0 : 1
    }
    
    func fetchSports() {
        state = .loading
        do {
            let request = try Feature.API.Sports.fetch.urlRequest(query: [])
            APIService.make(request: request) { [weak self] (response:[Feature.API.Sport]?, error:Error?) in
                DispatchQueue.main.async {
                    guard let self else { return }
                    guard let response else {
                        let error = error ?? NSError(domain: "sports.viewmodel", code: 400)
                        self.state = .failure(error)
                        return
                    }
                    let result = response.compactMap{ Feature.Domain.Sport(with: $0) }
                    self.state = .success(result)
                }
            }
        } catch {
            print("reqeust error:\(error.localizedDescription)")
        }
        
    }
}
