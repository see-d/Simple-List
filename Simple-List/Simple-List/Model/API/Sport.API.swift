//
//  Sport.API.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import Foundation

extension Feature.API {
    struct Sport: Decodable {
        let id: String
        let title:String
        let events:[Event]
        
        enum CodingKeys: String, CodingKey, CaseIterable {
            case id = "i"
            case title = "d"
            case events = "e"
        }
    }
}

extension Feature.API.Sport {
    static var tennisFixture = Feature.API.Sport(id:"TEN" ,title: "Tennis", events: [])
    static var f1Fixture = Feature.API.Sport(id:"F1" ,title: "F1", events: [])
    
}
