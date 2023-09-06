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
}


extension Post {
    static  var MockPost: [Post] = [
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.1", likes: 123, imageUrl: "6", timestamp: Timestamp(), user: User.MockUsers[0]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.2", likes: 234, imageUrl: "7", timestamp: Timestamp(), user: User.MockUsers[1]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.3", likes: 567, imageUrl: "8", timestamp: Timestamp(), user: User.MockUsers[2]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.4", likes: 8910, imageUrl: "9", timestamp: Timestamp(), user: User.MockUsers[3]),
        .init(id: NSUUID().uuidString, ownerId: NSUUID().uuidString, caption: "Text caption no.5", likes: 810, imageUrl: "10", timestamp: Timestamp(), user: User.MockUsers[3]),
    ]
}
