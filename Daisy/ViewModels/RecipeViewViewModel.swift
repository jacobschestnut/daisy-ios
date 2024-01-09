//
//  RecipeViewViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/15/23.
//

import Foundation

class RecipeViewViewModel: ObservableObject {
    @Published var ingredients: [Ingredient] = []

    init() {}

    func sortIngredients(ingredients: [Ingredient]) {
        let sortedIngredients = ingredients.sorted { $0.amount > $1.amount }
        let groupedIngredients = Dictionary(grouping: sortedIngredients, by: { $0.type })

        let sortedSpirits = groupedIngredients["spirit"] ?? []
        let sortedJuices = groupedIngredients["juice"] ?? []
        let sortedSugars = groupedIngredients["sugar"] ?? []
        let sortedBitters = groupedIngredients["bitters"] ?? []
        let sortedMisc = groupedIngredients["misc"] ?? []

        self.ingredients = sortedSpirits + sortedJuices + sortedSugars + sortedBitters + sortedMisc
    }
}
