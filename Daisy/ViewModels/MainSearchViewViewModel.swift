//
//  SearchedViewViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/20/23.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class MainSearchViewViewModel: ObservableObject {
    
    @Published var entries: [Entry] = []
    
    func fetchAllEntries() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { userSnapshot, userError in
            if let userError = userError {
                print("Error getting user documents: \(userError)")
            } else {
                var entriesData: [Entry] = []
                for userDocument in userSnapshot!.documents {
                    let userId = userDocument.documentID
                    
                    let entriesRef = db.collection("users/\(userId)/entries")
                    entriesRef.getDocuments { entrySnapshot, entryError in
                        
                        if let entryError = entryError {
                            print("Error getting entry documents for user \(userId): \(entryError)")
                        } else {
                            for document in entrySnapshot!.documents {
                                let entryId = document.documentID
                                let entryData = document.data()
                                if let entryName = entryData["name"] as? String,
                                   let createdDate = entryData["createdDate"] as? TimeInterval,
                                   let date = entryData["date"] as? TimeInterval,
                                   let description = entryData["description"] as? String,
                                   let location = entryData["location"] as? String {
                                    let entry = Entry(id: entryId, userId: userId, name: entryName, description: description, location: location, date: date, createdDate: createdDate)
                                    entriesData.append(entry)
                                    DispatchQueue.main.async {
                                        self.entries = entriesData
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

