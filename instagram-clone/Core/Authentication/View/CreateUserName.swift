//
//  CreateUserName.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/9/23.
//

import SwiftUI

struct CreateUserName: View {
    
    @State private var username = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your Username")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Text("You'll use this username to sign in to your account")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Username", text: $username)
                .textInputAutocapitalization(.never)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            NavigationLink(destination: {
                CreatePasswordView()
                    .navigationBarBackButtonHidden()
            }, label: {
                Text("Next")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(.blue)
                    .cornerRadius(8)
            })
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct CreateUserName_Previews: PreviewProvider {
    static var previews: some View {
        CreateUserName()
    }
}
