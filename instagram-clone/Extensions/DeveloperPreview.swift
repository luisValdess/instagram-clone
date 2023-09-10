//
//  DeveloperPreview.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/9/23.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let comment = Comment(postOwnerId: "123", commentText: "Test comment for now", postId: "323", timestamp: Timestamp(), commentOwnerId: "1111")
}
