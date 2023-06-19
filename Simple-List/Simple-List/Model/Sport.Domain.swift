//
//  Sport.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import Foundation

struct Feature {
    struct API {}
    struct Domain {}
}

extension Feature.Domain {
    struct Sport {
        let title:String
        let events:[Event]
    }
}

extension Feature.Domain.Sport {
    static var tennisFixture = Feature.Domain.Sport(title: "Tennis", events: [])
    static var f1Fixture = Feature.Domain.Sport(title: "F1", events: [])
    
}
