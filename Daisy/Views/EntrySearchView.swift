//
//  EntrySearchView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/21/23.
//

import SwiftUI

struct EntrySearchView: View {
    @Binding var searchText: String
    var recipes: [Recipe]
    
    var body: some View {
        NavigationView {
            if !searchText.isEmpty {
                List(searchResults) { recipe in
                    NavigationLink(destination: EntryFormView(recipe: recipe)) {
                        CocktailListItemView(recipe: recipe)
                    }
                }
            } else {
                
                VStack {
                    Text("or")
                    
                    NavigationLink(destination: EntryFormView()) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.green)
                            Text("Enter Details")
                                .foregroundColor(.white)
                                .bold()
                        }
                        .frame(width: 150, height: 50)
                        .padding()
                    }
                    Spacer()
                }
            }
            Spacer()
        }
    }
    
    var searchResults: [Recipe] {
        return recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}
