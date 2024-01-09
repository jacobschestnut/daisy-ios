//
//  CocktailView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import SwiftUI

struct RecipeView: View {
    @StateObject var viewModel = RecipeViewViewModel()
    let recipe: Recipe
    
    var sortedI: [Ingredient] = []
    
    var body: some View {
        ScrollView {
            AsyncImage(url: URL(string: recipe.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(recipe.name)
                    .font(.title)
                
                Text(recipe.description)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                Divider()
                
                ForEach(viewModel.ingredients, id: \.self) { ingredient in
                    HStack {
                        HStack {
                            Text(String(format: "%.2f", ingredient.amount))
                            Text(ingredient.unit)
                        }
                        Text(ingredient.name)
                    }
                }
            
                Spacer()
            }
            .padding()
            .onAppear {
                viewModel.sortIngredients(ingredients: recipe.ingredients)
            }
        }
        .padding()
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        return RecipeView(recipe: Recipe(id: "", name: "Old Fashioned", description: "A classic bourbon cocktail.", ingredients: [Ingredient(name: "Bourbon", amount: 2, unit: "oz.", type: "test"), Ingredient(name: "Angostura Bitters", amount: 2, unit: "dash", type: "test")], imageURL: "https://assets.epicurious.com/photos/5e41a6d175661800087cc87c/16:9/w_4619,h_2598,c_limit/OldFashioned_HERO_020520_619.jpg"))
    }
}
