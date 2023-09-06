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
        self.posts = try await PostService.fetchFeedPost()
    }
}

