//
//  ProfileDetailsViewViewModel.swift
//  Daisy
//
//  Created by Jacob Chestnut on 1/4/24.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

import Foundation

class ProfileDetailsViewViewModel: ObservableObject {
    
    @Published var user: User? = nil
    
    func fetchUser() {
            guard let userId = Auth.auth().currentUser?.uid else {
                print("No user ID found.")
                return
            }
            
            let db = Firestore.firestore()
            db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
                if let error = error {
                    print("Error fetching user:", error.localizedDescription)
                    return
                }
                
                guard let data = snapshot?.data() else {
                    print("No data found for user.")
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(
                        id: data["id"] as? String ?? "",
                        username: data["username"] as? String ?? "",
                        email: data["email"] as? String ?? "",
                        joined: data["joined"] as? TimeInterval ?? 0
                    )
                }
            }
        }
    
    init() {
        
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
