//
//  Sports.API.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import Foundation

extension Feature.API {
    enum Sports {
        case fetch
    }
}

extension Feature.API.Sports : API {
    var scheme: String {
        return "https"
    }
    var host: String {
        return "618d3aa7fe09aa001744060a.mockapi.io"
    }
    
    var path: String {
        return "/api"
    }
    
    var endpoint: String {
        return "/sports"
    }
    
    var method: String {
        return "GET"
    }
}
