//
//  FeedView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/7/23.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 32) {
                    ForEach(0...10, id: \.self) { post in
                        FeedCell()
                    }
                }
                .padding(.top, 8)
            }
            .navigationTitle("Feed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram-logo")
                        .resizable()
                        .frame(width: 100, height: 32)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
