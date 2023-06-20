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
        let id: String
        let title: String
        let events: [Event]
        
        init(id: String, title: String, events: [Event]) {
            self.id = id
            self.title = title
            self.events = events
        }
        
        init(with response:Feature.API.Sport) {
            id = response.id
            title = response.title
            events = response.events.compactMap{ Feature.Domain.Sport.Event(with: $0) }
        }
    }
}

extension Feature.Domain.Sport {
    static var tennisFixture = Feature.Domain.Sport(id:"TEN" ,title: "Tennis", events: [])
    static var f1Fixture = Feature.Domain.Sport(id:"F1" ,title: "F1", events: [])
    
}
