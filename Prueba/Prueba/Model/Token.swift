//
//  User.swift
//  Heartland Splenda
//
//  Created by Edgar Gerardo Flores Lopez on 18/09/20.
//  Copyright © 2020 Edgar Gerardo Flores Lopez. All rights reserved.
//

import Foundation

struct Token: Decodable {
    let success: Bool
    let requesttoken: String?
    let expireat: String?

private enum CodingKeys: String, CodingKey {
    case success
    case requesttoken = "request_token"
    case expireat = "expires_at"
}
}

