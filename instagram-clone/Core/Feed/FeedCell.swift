//
//  FeedCell.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/7/23.
//

import SwiftUI

struct FeedCell: View {
    
    let post: Post
    
    var body: some View {
        VStack {
            
            // Image + Username
            HStack {
                if let user = post.user {
                    Image(user.profileUserURL ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post Image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // Actions Buttons
            HStack(spacing: 16) {
                Button {
                    print("Like a post")
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    print("Comment a post")
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                }

                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .tint(.black)
            
            //Likes Label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment:  .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text("\(post.caption)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            
            Text("\(post.timestamp)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.leading, 10)
                .foregroundColor(.gray)
                .padding(.top, 1)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MockPost[0])
    }
}
