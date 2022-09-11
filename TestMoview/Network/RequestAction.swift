//
//  RequestAction.swift
//  Heartland Splenda
//
//  Created by Edgar Gerardo Flores Lopez on 18/09/20.
//  Copyright © 2020 Edgar Gerardo Flores Lopez. All rights reserved.
//

import Foundation

class RequestAction {
    
    var path: String
    var method: Method!
    var body: Encodable?
    
    init(endpoint: Endpoint, body: Encodable? = nil) {
        path = endpoint.rawValue
        self.method = endpoint.method
        self.body = body
    }
    
    func getBodyInData() -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        if let encodableBody = body {
            return encodableBody.toJSONData()
        }
        
        return nil
    }
}

extension Encodable {
    func toJSONData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    var dictionary: [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else { return [:] }
        
        guard let dataSerialized = try? JSONSerialization.jsonObject(with: data, options: .allowFragments),
            let dictionary =  dataSerialized as? [String: Any] else {
                return [:]
        }
        
        return dictionary
    }
}

enum Method: String {
    case GET
    case POST
    case PUT
    case DELETE
    
    var rawValue: String {
        switch self {
        case .GET: return "GET"
        case .POST: return "POST"
        case .PUT: return "PUT"
        case .DELETE: return "DELETE"
        }
    }
}

//MODIFICAR
enum Endpoint {
    case gettoken
    case authenticate
    case moviewpopular
    case toprated
    case tvontheair
    case tvairingtoday


    
    var method: Method {
        switch self {
        case .gettoken: return .GET
        case .authenticate: return .POST
        case .moviewpopular: return .GET
        case .toprated: return .GET
        case .tvontheair: return .GET
        case .tvairingtoday: return .GET
        }
    }
     
    var rawValue: String {
        switch self {
        case .gettoken: return "authentication/token/new"
        case .authenticate: return "authentication/token/validate_with_login"
        case .moviewpopular: return "movie/popular"
        case .toprated: return "movie/top_rated"
        case .tvontheair: return "tv/on_the_air"
        case .tvairingtoday: return "tv/airing_today"
            
        }
    }
}

