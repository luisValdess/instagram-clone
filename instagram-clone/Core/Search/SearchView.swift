//
//  SearchView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/8/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(0...10, id: \.self) { user in
                        
                        HStack {
                            Image("profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("maus__hous")
                                    .fontWeight(.semibold)
                                
                                Text("Lucia")
                            }
                            .font(.footnote)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
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
