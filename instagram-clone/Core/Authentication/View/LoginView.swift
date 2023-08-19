//
//  LoginView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/8/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                
                //Logo Image
                Image("instagram-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                //Text Field
                VStack {
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .modifier(IGTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(IGTextFieldModifier())
                    
                    Button {
                        print("Forgot password")
                    } label: {
                        Text("Forgot Password?")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Button {
                        print("Login")
                    } label: {
                        Text("Login")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 44)
                            .background(.blue)
                            .cornerRadius(8)
                    }
                    .padding(.vertical)
                    
                    HStack {
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2) - 40 , height: 0.5)
                        
                        Text("OR")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Rectangle()
                            .frame(width: (UIScreen.main.bounds.width / 2) - 40 , height: 0.5)
                    }
                    .foregroundColor(.gray)
                    
                    HStack {
                        Image("facebook-logo")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Continue with Facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 8)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                }
                .font(.footnote)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
