//
//  ProfileView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/7/23.
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MockPost.filter { $0.user?.username == user.username}
    }
    
    var body: some View {
        
        ScrollView {
            
            // Header
            ProfileHeaderView(user: user)
            
            // Post Grid View
            PostGridView(posts: posts)
            
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MockUsers[3])
    }
}
