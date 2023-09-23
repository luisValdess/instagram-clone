//
//  UserListViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/23/23.
//

import Foundation

@MainActor
class UserListViewModel : ObservableObject {
    
    @Published var users = [User]()
   
    func fetchUsers(forConfig config: UserListConfig) async {
        do {
            self.users = try await UserService.fetchUsers(forConfig: config)
        } catch {
            print("DEBUG: Failed to fetch users with error \(error.localizedDescription)")
        }
    }
}
