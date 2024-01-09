//
//  CocktailCardView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 1/8/24.
//
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

struct CocktailCardView: View {
    let entry: Entry
    @State private var username: String = "Loading..."

    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.gray)
            .frame(height: 100)
            .overlay(alignment: .topTrailing, content: {
                Text(username)
                    .font(.footnote)
                    .padding()
            })
            .overlay(alignment: .leading) {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    
                    VStack(alignment: .leading) {
                        Text(entry.name)
                            .bold()
                        Text(entry.location)
                            .font(.footnote)
                        Image(systemName: "star.fill")
                    }
                    .padding()
                }
                .padding()
            }
            .onAppear {
                getUsernameFromId(userId: entry.userId)
            }
            .foregroundColor(.white)
    }

    func getUsernameFromId(userId: String) {
        let db = Firestore.firestore()

        db.collection("users").document(userId).getDocument { snapshot, error in
            if let error = error {
                print("Error getting document: \(error)")
                self.username = "Default Username"
            } else {
                self.username = snapshot?.data()?["username"] as? String ?? "Default Username"
            }
        }
    }
}


struct CocktailCardView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailCardView(entry: Entry(id: "test", userId: "Hp1aJazMyOOFBw5Td3ltCE6n6aX2", name: "Our Color Green", description: "test", location: "Bastion", date: 1212, createdDate: 1212))
    }
}
