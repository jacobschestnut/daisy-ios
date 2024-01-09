//
//  EntryFormViewViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/21/23.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class EntryFormViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var description = ""
    @Published var location = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    private var originalRecipe: Recipe?

    init(recipe: Recipe?) {
        populateFields(recipe: recipe)
    }
    
    func save() {
        guard canSave else{
            return
        }
        
        //get current user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        //create model
        let newId = UUID().uuidString
        let newEntry = Entry(
            id: newId,
            userId: uId,
            name: name,
            description: description,
            location: location,
            date: date.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970
        )
        
        //save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("entries")
            .document(newId)
            .setData(newEntry.asDictionary())
        
        print("New Entry Created", newEntry)
    }
    
    var canSave: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        guard !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

//        guard let originalRecipe = originalRecipe else {
//            return true // If originalRecipe is nil, treat it as a new recipe
//        }
//
//        guard originalRecipe.name != name || originalRecipe.description != description else {
//            return false // No changes in the recipe content
//        }

        return true // Changes in the recipe content are detected
    }

    func populateFields(recipe: Recipe?) {
        originalRecipe = recipe
        if let recipe = recipe {
            name = recipe.name
            description = recipe.description
        } else {
            name = ""
            description = ""
        }
    }
}

