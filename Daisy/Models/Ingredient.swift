//
//  Ingredient.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/17/23.
//

import Foundation

struct Ingredient: Codable, Hashable {
    var name: String
    var amount: Double
    var unit: String
    var type: String
}
