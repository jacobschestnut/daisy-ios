//
//  User.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/15/23.
//

import Foundation

struct User: Codable {
    let id: String
    let username: String
    let email: String
    let joined: TimeInterval
}
