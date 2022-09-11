//
//  Authorize.swift
//  Heartland Splenda
//
//  Created by Edgar Gerardo Flores Lopez on 21/09/20.
//  Copyright © 2020 Edgar Gerardo Flores Lopez. All rights reserved.
//

import Foundation

struct AuthorizeMapper: Decodable {
    let success: Bool
    let statuscode: Int?
    let statusmessage: String?
    let requesttoken: String?

    private enum CodingKeys: String, CodingKey {
        case statuscode = "status_code"
        case statusmessage = "status_message"
        case requesttoken = "request_token"
        case success
    }
  }

