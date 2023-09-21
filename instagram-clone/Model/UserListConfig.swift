//
//  UserListConfig.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/20/23.
//

import Foundation

enum UserListConfig : Hashable {
    case followers(uid: String)
    case following(uid: String)
    case likes(postId: String)
    case explore
    
    var navigationTitle: String {
        switch self {
        case .followers: return "Followers"
        case .following: return "Following"
        case .likes: return "Likes"
        case .explore: return "Explore"
        }
    }
}
