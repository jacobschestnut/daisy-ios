//
//  DiaryViewViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/27/23.
//

import FirebaseFirestore
import Foundation

/// View model for DiaryView that lists individual diary entries
class DiaryViewViewModel: ObservableObject {
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete diary entry item
    /// - Parameter id: Entry ID to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("entries")
            .document(id)
            .delete()
    }
}
