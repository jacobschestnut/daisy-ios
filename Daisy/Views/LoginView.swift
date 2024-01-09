//
//  LoginView.swift
//  Daisy
//
//  Created by Jacob Chestnut on 12/14/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
var body: some View {
        NavigationView {
            ZStack {
                Color(red: 1.00, green: 0.56, blue: 0.45)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    HeaderView()
                    
                    VStack {
                        Form {
                            if !viewModel.errorMessage.isEmpty {
                                Text(viewModel.errorMessage)
                                    .foregroundColor(Color.red)
                            }
                            
                            TextField("Email Address", text: $viewModel.email)
                                .autocapitalization(.none)
                                .autocorrectionDisabled()
                            SecureField("Password", text: $viewModel.password)
                            DaisyButton(
                                title: "Log In",
                                background: .green
                            ) {
                                viewModel.login()
                            }
                        }
                        .scrollContentBackground(.hidden)
                    }
                    VStack {
                        Text("Don't have an account?")
                        NavigationLink("Register", destination: RegisterView())
                    }.padding(.bottom, 60)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
