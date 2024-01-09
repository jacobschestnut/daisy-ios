//
//  RegisterView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.239, green: 0.231, blue: 0.235)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    HeaderView()
                    VStack {
                        Form {
                            if !viewModel.errorMessage.isEmpty {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(Color.red)
                            }
                            
                            TextField("Username", text: $viewModel.username)
                                .autocapitalization(.none)
                                .autocorrectionDisabled()
                            TextField("Email Address", text: $viewModel.email)
                                .autocapitalization(.none)
                                .autocorrectionDisabled()
                            SecureField("Password", text: $viewModel.password)
                            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                            DaisyButton(
                                title: "Create Account",
                                background: .blue
                            ) {
                                viewModel.register()
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }

                }
            }
        }
    }

}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
