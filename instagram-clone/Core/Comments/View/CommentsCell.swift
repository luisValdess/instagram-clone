//
//  CommentsCell.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/9/23.
//

import SwiftUI

struct CommentsCell: View {
    
    private var user: User {
        return User.MockUsers[0]
    }
    
    var body: some View {
        HStack {
            CircularProfileImageView(user: user, size: .xSmall)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user.username)
                        .fontWeight(.semibold)
                    
                    Text("6d")
                        .foregroundColor(.gray)
                }
                
                Text("How's the back of my car look?")
            }
            .font(.caption)
            
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct CommentsCell_Previews: PreviewProvider {
    static var previews: some View {
        CommentsCell()
    }
}
