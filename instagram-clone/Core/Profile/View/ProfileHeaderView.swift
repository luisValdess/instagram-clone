//
//  ProfileHeaderView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/11/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    
    @State private var showEditProfile = false
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Pic and Stats
            HStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                
                Spacer()
                
                HStack {
                    UserStatView(value: 45, title: "Posts")
                    
                    UserStatView(value: 132, title: "Followers")
                    
                    UserStatView(value: 150, title: "Following")
                }
            }
            .padding(.horizontal)
            
            // Name and Bio
            VStack(alignment: .leading, spacing: 4) {
                Text("maus__hous")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text("Visual artist and ilustrator")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Action Button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    print("follow")
                }
            } label: {
                Text(user.isCurrentUser ? "Edit Profile" : "Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(user.isCurrentUser ? .white : .blue)
                    .foregroundColor(user.isCurrentUser ? .black : .white)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(user.isCurrentUser ? .gray : .clear, lineWidth: 1)
                    }
            }
            
            Divider()
            
        }
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MockUsers[0])
    }
}
