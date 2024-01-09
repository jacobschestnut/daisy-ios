//
//  Entry.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/26/23.
//

import Foundation
import SwiftUI

struct Entry: Codable, Identifiable {
    var id: String
    var userId: String
    var name: String
    var description: String
    var location: String
    var date: TimeInterval
    var createdDate: TimeInterval
}
