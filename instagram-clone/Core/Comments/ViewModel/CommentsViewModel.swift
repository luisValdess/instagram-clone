//
//  CommentsViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/9/23.
//

import Firebase

class CommentsViewModel: ObservableObject {
    
    @Published var comments = [Comment]()
    
    private let post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = Comment(postOwnerId: post.ownerId,
                              commentText: commentText,
                              postId: post.id,
                              timestamp: Timestamp(),
                              commentOwnerId: uid)
        
        try await CommentService.uploadComment(comment, postId: post.id)
    }
}
