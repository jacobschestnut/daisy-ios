//
//  ProfileDetailsView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 1/4/24.
//

import SwiftUI

struct ProfileDetailsView: View {
    @StateObject var viewModel = ProfileDetailsViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Spacer()
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack {
                        Text(user.username)
                            .padding()
                        Text("Location")
                            .padding()
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                            .padding()
                    }
                    .padding()
                    
                    Spacer()
                    
                    Button("Log Out") {
                        viewModel.logout()
                    }
                    .tint(.red)
                    .padding()
                } else {
                    Text("Loading...")
                }
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

struct ProfileDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileDetailsView()
    }
}
