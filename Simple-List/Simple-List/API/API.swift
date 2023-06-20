//
//  API.swift
//  Simple-List
//
//  Created by Corey Duncan on 19/6/23.
//

import Foundation

protocol API {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var endpoint: String { get }
    var method: String { get }
}

extension API {
    private static var userAgent: String {
        "ios"
    }
    
    private static var version: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    func urlRequest(query:[URLQueryItem] = []) throws -> URLRequest {
        guard let url = Self.makeComponents(self, queryItems: query).url else {
            throw NSError(domain: "\(self.path)", code: 400)
        }
        
        var urlRequest = URLRequest(url: url)
        
        urlRequest.setValue("application/json", forHTTPHeaderField: "content-type")
        urlRequest.setValue(TimeZone.current.identifier, forHTTPHeaderField: "X-Timezone")

        urlRequest.setValue(Locale.current.regionCode, forHTTPHeaderField: "Country")
        urlRequest.setValue(Self.version, forHTTPHeaderField: "Version")
        urlRequest.setValue(Self.userAgent, forHTTPHeaderField: "Source")
        
        urlRequest.httpMethod = self.method
        
        return urlRequest
    }
    
    private static func makeComponents(_ api: any API, queryItems:[URLQueryItem]) -> URLComponents {
        var components = URLComponents()
        components.scheme = api.scheme
        components.host = api.host
        components.path = api.path+api.endpoint
        
        if queryItems.count > 0 {
            components.queryItems = queryItems
        }
    
        return components
    }
}
