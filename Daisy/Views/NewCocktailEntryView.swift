//
//  NewCocktailView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import SwiftUI

struct NewCocktailEntryView: View {
    @Environment(\.presentationMode) var presentationMode
    // Using same view model as Cocktail List View. Change in future?
    @StateObject var viewModel = CocktailListViewViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            EntrySearchView(searchText: $searchText, recipes: viewModel.recipes)
                .searchable(text: $searchText, prompt: "Find a cocktail...")
                .navigationBarTitle("New Entry", displayMode: .inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
        } detail: {
            Text("Select a cocktail")
        }
        .onAppear {
            viewModel.fetchRecipes()
        }
    }
}

struct NewCocktailEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NewCocktailEntryView()
    }
}
