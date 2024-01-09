//
//  CocktailListItemView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import SwiftUI

struct CocktailListItemView: View {
    var recipe: Recipe
    
    var body: some View {
        HStack {
            Text(recipe.name)
            
            Spacer()
        }
    }
}

//struct CocktailListItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        CocktailListItemView(recipe: Recipe(id: 1, name: "Test Cocktail", description: "Test Desc."))
//    }
//}
