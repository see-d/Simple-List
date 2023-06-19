//
//  ViewModel.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import Foundation

final class SportsViewModel {
    let sports:[Feature.Domain.Sport]
    private var visibleSections:[Int] = []
    
    init(sports: [Feature.Domain.Sport]) {
        self.sports = sports
    }
    
    func title(for section:Int) -> String? {
        guard sports.indices.contains(section) else { return nil }
        return sports[section].title
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
}
