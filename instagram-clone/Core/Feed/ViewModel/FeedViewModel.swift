//
//  FeedViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/5/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    @MainActor
    func fetchPosts() async throws {
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
        
        for i in 0..<posts.count {
            let post = posts[i]
            let ownerUid = post.ownerId
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            self.posts[i].user = postUser
        }
    }
}

