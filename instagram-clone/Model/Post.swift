//
//  Post.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/10/23.
//

import Foundation
import Firebase

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerId: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    
    var user: User?
    
    var didLike: Bool? = false
}


extension Post {
    
    static let MockImageUrl = "https://firebasestorage.googleapis.com:443/v0/b/instagram-clone-9.appspot.com/o/profile_images%2F2A545977-6447-40E9-9253-F7D1DCED4F4F?alt=media&token=2de03897-c605-4e35-981b-666ee842fa8a"
    
    static  var MockPost: [Post] = [
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.1", likes: 123, imageUrl: MockImageUrl, timestamp: Timestamp(), user: User.MockUsers[0]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.2", likes: 234, imageUrl: "7", timestamp: Timestamp(), user: User.MockUsers[1]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.3", likes: 567, imageUrl: "8", timestamp: Timestamp(), user: User.MockUsers[2]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.4", likes: 8910, imageUrl: "9", timestamp: Timestamp(), user: User.MockUsers[3]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.5", likes: 810, imageUrl: "10", timestamp: Timestamp(), user: User.MockUsers[3]),
    ]
}
