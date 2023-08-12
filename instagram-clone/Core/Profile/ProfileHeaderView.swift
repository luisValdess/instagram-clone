//
//  ProfileHeaderView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/11/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    let user: User
    
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
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundColor(.black)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray, lineWidth: 1)
                    }
            }
            
            Divider()
            
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MockUsers[0])
    }
}
