//
//  RegistrationView.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/04.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.didAuthenticateUser {
                ProfilePhotoSelectorView()
            } else {
                registrationView
            }
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(AuthViewModel())
    }
}

extension RegistrationView {
    var registrationView: some View {
        VStack {
            AuthHeaderView(title1: "Get stared.", title2: "Create your account")
            
            VStack(spacing: 40) {
                CustomInputField(ImageName: "envelope", placeholderText: "Email", text: $email)
                
                CustomInputField(ImageName: "person", placeholderText: "Username", text: $username)
                
                CustomInputField(ImageName: "person", placeholderText: "Full Name", text: $fullname)
                
                CustomInputField(ImageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding(32)
            
            Button {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            Spacer()
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                        .font(.footnote)
                    
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)

        }
        .ignoresSafeArea()
    }
}
