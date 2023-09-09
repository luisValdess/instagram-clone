//
//  CommentsView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/9/23.
//

import SwiftUI

struct CommentsView: View {
    
    @State private var commentText = ""
    
    @StateObject var viewModel : CommentsViewModel
    
    init(post: Post) {
        _viewModel = StateObject(wrappedValue: CommentsViewModel(post: post))
    }
    
    var body: some View {
        VStack {  
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            
            Divider()
            
            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(0...15, id: \.self) { comment in
                        CommentsCell()
                    }
                }
            }
            .padding(.top)
            
            Divider()
            
            HStack(spacing: 12) {
                CircularProfileImageView(user: User.MockUsers[0], size: .xSmall)
                
                ZStack(alignment: .trailing) {
                    TextField("Add a comment...", text: $commentText, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        }
                    
                    Button {
                        Task { try await viewModel.uploadComment(commentText: commentText)}
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)

                }
            }
            .padding()
        }
    }
}

struct CommentsView_Previews: PreviewProvider {
    static var previews: some View {
        CommentsView(post: Post.MockPost[0])
    }
}
