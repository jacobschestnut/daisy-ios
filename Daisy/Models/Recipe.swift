//
//  Recipe.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/15/23.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: String
    var name: String
    var description: String
    var ingredients: [Ingredient]
    var imageURL: String
}
