//
//  SearchedView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/20/23.
//
import SwiftUI

struct MainSearchView: View {
    @StateObject var viewModel = MainSearchViewViewModel()
    @Binding var searchText: String
    @Environment(\.isSearching) private var isSearching
    var recipes: [Recipe]
    
    var body: some View {
        VStack { // Adjust your view hierarchy accordingly
            switch (isSearching, searchText.isEmpty) {
            case (true, false):
                List(searchResults) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        CocktailListItemView(recipe: recipe)
                    }
                }
            case (true, true):
                Text("Recent Searches")
                // ADD SOME SORT OF RECENT SEARCHES LIST
            default:
                //Currently listing all entries in db
//                List(viewModel.entries) { entry in
//                    CocktailCardView(entry: entry)
//                        .listRowSeparator(.hidden)
//                }
                List {
                    Section(header: Text("New from Friends:"))
                    {
                        ForEach(viewModel.entries) {entry in CocktailCardView(entry: entry)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listRowInsets(.none)
                .listStyle(PlainListStyle())
                .frame( maxWidth: .infinity)
            }
        }
        .onAppear {
            viewModel.fetchAllEntries()
        }
    }
    
    var searchResults: [Recipe] {
        return recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
}
