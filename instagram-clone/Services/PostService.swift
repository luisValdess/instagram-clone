//
//  PostService.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/5/23.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postCollection = FirebaseConstants.PostsCollection
    private static let usersCollection = FirebaseConstants.UsersCollection
    
    static func fetchFeedPost() async throws -> [Post] {
        let snapshot = try await postCollection.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUid = post.ownerId
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        
        return posts
    }
    
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        
        let snapshot = try await postCollection.whereField("ownerId", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}

// MARK: Likes
extension PostService {
    static func likePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let  _ = try await postCollection.document(post.id).collection("post-likes").document(uid).setData([:])
        async let  _ = try await postCollection.document(post.id).updateData(["likes": post.likes + 1])
        async let  _ = try await usersCollection.document(uid).collection("users-likes").document(post.id).setData([:])
    }
    
    static func unlikePost(_ post: Post) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        async let  _ = try await postCollection.document(post.id).collection("post-likes").document(uid).delete()
        async let  _ = try await postCollection.document(post.id).updateData(["likes": post.likes - 1])
        async let  _ = try await usersCollection.document(uid).collection("users-likes").document(post.id).delete()
    }
    
    static func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let uid = Auth.auth().currentUser?.uid else { return false }
        
        let snapshot = try await usersCollection.document(uid).collection("users-likes").document(post.id).getDocument()
        return snapshot.exists
    }
}


