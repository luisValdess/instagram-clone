//
//  CommentService.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/9/23.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct CommentService {
    
    static func uploadComment(_ comment: Comment, postId: String) async throws {
        guard let commentData = try? Firestore.Encoder().encode(comment) else { return }
        try await Firestore
            .firestore()
            .collection("posts")
            .document(postId)
            .collection("post-comments")
            .addDocument(data: commentData)
    }
    
}
