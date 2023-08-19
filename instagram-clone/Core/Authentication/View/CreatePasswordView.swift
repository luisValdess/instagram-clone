//
//  CreatePasswordView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/9/23.
//

import SwiftUI

struct CreatePasswordView: View {
    
    @State private var password = ""
    @State private var password2 = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 12) {
            Text("Add your Password")
                .font(.title2)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            Text("Your password must be at least 6 characters in length")
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            TextField("Password", text: $password)
                .textInputAutocapitalization(.never)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            TextField("Password", text: $password)
                .textInputAutocapitalization(.never)
                .modifier(IGTextFieldModifier())
            
            NavigationLink(destination: {
                CompleteSignUpView()
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

struct CreatePasswordView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePasswordView()
    }
}
