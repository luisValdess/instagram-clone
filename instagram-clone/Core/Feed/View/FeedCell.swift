//
//  FeedCell.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/7/23.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    
    @ObservedObject var viewModel : FeedCellViewModel
    
    private var post: Post {
        return viewModel.post
    }
    
    private var didLike: Bool {
        return post.didLike ?? false
    }
    
    init(post: Post) {
        self.viewModel = FeedCellViewModel(post: post)
    }
    
    var body: some View {
        VStack {
            
            // Image + Username
            HStack {
                if let user = post.user {
                    CircularProfileImageView(user: user, size: .xSmall)
                    
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post Image
            KFImage(URL(string: post.imageUrl ))
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // Actions Buttons
            HStack(spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundColor(didLike ? .red : .black)
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
            if post.likes > 0 {
                Text("\(post.likes) likes")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment:  .leading)
                    .padding(.leading, 10)
                    .padding(.top, 1)
            }
            
            HStack {
                Text("\(post.user?.username ?? "") ").fontWeight(.semibold) +
                Text("\(post.caption)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            
            Text("2h ago")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.leading, 10)
                .foregroundColor(.gray)
                .padding(.top, 1)
        }
    }
    
    private func handleLikeTapped() {
        Task {
            if didLike {
                try await viewModel.unlike()
            } else {
                try await viewModel.like()
            }
        }
    }
}


struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell(post: Post.MockPost[0])
    }
}
