//
//  SearchView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/8/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    @StateObject var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            UsersListView(config: .explore)
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
