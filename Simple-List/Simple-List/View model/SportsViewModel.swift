//
//  ViewModel.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import Foundation

struct SportsViewModel {
    private(set) var sports:[Feature.Domain.Sport] = []
    
    func title(for section:Int) -> String? {
        guard sports.indices.contains(section) else { return nil }
        return sports[section].title
    }
}
