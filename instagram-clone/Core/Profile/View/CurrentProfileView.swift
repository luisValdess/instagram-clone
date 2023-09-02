//
//  CurrentProfileView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/9/23.
//

import SwiftUI

struct CurrentProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MockPost.filter { $0.user?.username == user.username}
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // Header
                ProfileHeaderView(user: user)
                
                // Post Grid View
                PostGridView(posts: posts)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    }
                    
                }
            }
        }
    }
}

struct CurrentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentProfileView(user: User.MockUsers[0])
    }
}
