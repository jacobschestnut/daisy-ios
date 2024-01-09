//
//  NewCocktailViewViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/15/23.
//

import Foundation

class NewCocktailEntryViewViewModel: ObservableObject {
    @Published var id = ""
    @Published var name = ""
    @Published var description = ""
    var recipe: Recipe? // Variable to hold the recipe
    
    init() {
        // Fetch existing recipe if it exists
        recipe = findCocktail()
        if let existingRecipe = recipe {
            id = existingRecipe.id
            name = existingRecipe.name
            description = existingRecipe.description
        }
    }
    
    func findCocktail() -> Recipe? {
        // Logic to find the cocktail item, returns a Cocktail object if found, otherwise nil
        // For the sake of example, a hardcoded check is used here
        let foundCocktail = true // Replace this with your actual search logic
        
        if foundCocktail {
            return Recipe(id: "", name: "Existing Recipe", description: "Description of existing recipe", ingredients: [], imageURL: "")
        } else {
            return nil
        }
    }
}
