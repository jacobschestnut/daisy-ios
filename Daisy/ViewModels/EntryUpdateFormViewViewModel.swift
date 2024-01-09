//
//  EntryUpdateFormViewViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 1/4/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class EntryUpdateFormViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var description = ""
    @Published var location = ""
    @Published var date = Date()
    @Published var showAlert = false
    
    private var originalEntry: Entry?

    init(entry: Entry?) {
        populateFields(entry: entry)
    }
    
    func update(entry: Entry?) {
        guard canUpdate else {
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        if let existingEntry = entry {
            let updatedEntry = Entry(
                id: existingEntry.id,
                userId: userId,
                name: name,
                description: description,
                location: location,
                date: date.timeIntervalSince1970,
                createdDate: existingEntry.createdDate
            )
            
            db.collection("users")
                .document(userId)
                .collection("entries")
                .document(existingEntry.id)
                .setData(updatedEntry.asDictionary()) { error in
                if let error = error {
                    print("Error updating entry: \(error.localizedDescription)")
                } else {
                    print("Entry updated successfully")
                }
            }
        }
    }

    
    var canUpdate: Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        guard !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        return true // Changes in the recipe content are detected
    }

    func populateFields(entry: Entry?) {
        originalEntry = entry
        if let entry = entry {
            name = entry.name
            description = entry.description
            location = entry.location
            date = Date(timeIntervalSince1970: entry.date)
        }
    }
}
