//
//  ContentView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import SwiftUI
import CoreData

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    @State private var isPresenting = false
    @State private var selectedItem = 1
    @State private var oldSelectedItem = 1
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView(selection: $selectedItem) {
            //Add option to create diary entry or cocktail recipe
                CocktailListView()
                    .tabItem {
                        Label("", systemImage: "house")
                    }
                    .tag(1)
                
                Text("")
                    .tabItem {
                        Label("", systemImage: "plus")
                    }
                    .tag(2)
                
                ProfileView(userId: viewModel.currentUserId)
                    .tabItem {
                        Label("", systemImage: "person.circle")
                    }
                    .tag(3)
            }
            .onChange(of: selectedItem) { newSelectedItem in
                if newSelectedItem == 2 {
                    isPresenting = true
                    selectedItem = oldSelectedItem
                } else if !isPresenting {
                    oldSelectedItem = newSelectedItem
                }
            }
            .sheet(isPresented: $isPresenting) {
                NewCocktailEntryView()
            }
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
