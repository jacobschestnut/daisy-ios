//
//  CocktailListViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/15/23.
//
import FirebaseFirestore
import Foundation

class CocktailListViewViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []

    private var db = Firestore.firestore()

    func fetchRecipes() {
        db.collection("recipes").getDocuments { [self] snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                var recipesData: [Recipe] = []

                for document in snapshot!.documents {
                    let data = document.data()
                    let recipeId = document.documentID
                    if let name = data["name"] as? String,
                       let imageURL = data["imageURL"] as? String,
                       let description = data["description"] as? String {
                        self.db.collection("recipes").document(recipeId).collection("ingredients").getDocuments { snapshot, error in
                            if let error = error {
                                print("Error getting ingredients: \(error)")
                            } else {
                                var ingredientsData: [Ingredient] = []

                                for ingredientDocument in snapshot!.documents {
                                    let ingredientData = ingredientDocument.data()
                                    if let ingredientName = ingredientData["name"] as? String,
                                       let amount = ingredientData["amount"] as? Double,
                                       let type = ingredientData["type"] as? String,
                                       let unit = ingredientData["unit"] as? String {
                                        let ingredient = Ingredient(name: ingredientName, amount: amount, unit: unit, type: type)
                                        ingredientsData.append(ingredient)
                                    }
                                }

                                let recipe = Recipe(id: recipeId, name: name, description: description, ingredients: ingredientsData, imageURL: imageURL)
                                
                                recipesData.append(recipe)
                                
                                DispatchQueue.main.async {
                                    self.recipes = recipesData
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

