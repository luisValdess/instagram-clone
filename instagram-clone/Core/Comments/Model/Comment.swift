//
//  Comment.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/9/23.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Comment: Identifiable, Codable {
    
    @DocumentID var commentId: String?
    let postOwnerId: String
    let commentText: String
    let postId: String
    let timestamp: Timestamp
    let commentOwnerId: String
    
    var user: User?
    
    var id: String {
        return commentId ?? NSUUID().uuidString
    }
    
}
