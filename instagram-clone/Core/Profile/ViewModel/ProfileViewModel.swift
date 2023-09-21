//
//  ProfileViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/10/23.
//

import Foundation

@MainActor
class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
    }
    
    func fetchUserStats() {
        Task {
            self.user.stats = try await UserService.fetchUserStats(uid: user.id)
        }
    }
    
}

extension  ProfileViewModel {
    func follow() {
        Task {
            try await UserService.follow(uid: user.id)
            user.isFollowed = true
        }
    }
    
    func unfollow() {
        Task {
            try await UserService.unfollow(uid: user.id)
            user.isFollowed = false
        }
    }
    
    func checkUserIsFollowed() {
        Task {
            self.user.isFollowed = try await UserService.checkIfUserIsFollowed(uid: user.id)
        }
    }
}
