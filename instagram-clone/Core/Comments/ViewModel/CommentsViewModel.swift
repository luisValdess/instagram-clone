//
//  CommentsViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/9/23.
//

import Firebase

@MainActor
class CommentsViewModel: ObservableObject {
    
    @Published var comments = [Comment]()
    
    private let post: Post
    private let service: CommentService
    
    init(post: Post) {
        self.post = post
        self.service = CommentService(postId: post.id)
        
        Task { try await fetchComments() }
    }
    
    func uploadComment(commentText: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let comment = Comment(postOwnerId: post.ownerId,
                              commentText: commentText,
                              postId: post.id,
                              timestamp: Timestamp(),
                              commentOwnerId: uid)
        
        self.comments.insert(comment, at: 0)
        try await service.uploadComment(comment)
        try await fetchComments()
    }
    
    func fetchComments() async throws {
        self.comments = try await service.fetchComments()
        try await fetchUserDataForComments()
    }
    
    private func fetchUserDataForComments() async throws {
        for i in 0..<comments.count {
            let comment = comments[i]
            let user = try await UserService.fetchUser(withUid: comment.commentOwnerId)
            comments[i].user = user
        }
    }
}
