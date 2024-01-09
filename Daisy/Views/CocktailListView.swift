//
//  CocktailListView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import SwiftUI

struct CocktailListView: View {
    @StateObject var viewModel = CocktailListViewViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            MainSearchView(searchText: $searchText, recipes: viewModel.recipes)
                .searchable(text: $searchText, prompt: "Find a cocktail...")
                .navigationBarTitle("Search", displayMode: .inline)
        } detail: {
            Text("Select a cocktail")
        }
        .onAppear {
            viewModel.fetchRecipes()
        }
    }
}

struct CocktailListView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailListView()
    }
}
