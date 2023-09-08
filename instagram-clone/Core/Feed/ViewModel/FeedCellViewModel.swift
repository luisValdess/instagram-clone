//
//  FeedCellViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/7/23.
//

import Foundation

class FeedCellViewModel: ObservableObject {
    
    @Published var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    func like() async throws {
        post.didLike = true
        post.likes += 1
    }
    
    func unlike() async throws {
        post.didLike = false
        post.likes -= 1
    }
}
