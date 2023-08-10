//
//  CurrentProfileView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/9/23.
//

import SwiftUI

struct CurrentProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                // Header
                VStack(spacing: 10) {
                    
                    // Pic and Stats
                    HStack {
                        Image("profile")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .clipShape(Circle())
                        
                        Spacer()
                        
                        HStack {
                            UserStatView(value: 45, title: "Posts")
                            
                            UserStatView(value: 132, title: "Followers")
                            
                            UserStatView(value: 150, title: "Following")
                        }
                    }
                    .padding(.horizontal)
                    
                    // Name and Bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("maus__hous")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Text("Visual artist and ilustrator")
                            .font(.footnote)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    // Action Button
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 360, height: 32)
                            .foregroundColor(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6)
                                    .stroke(.gray, lineWidth: 1)
                            }
                    }
                    
                    Divider()
                    
                }
                
                // Post Grid View
                
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(0...15, id: \.self) { index in
                        Image("1")
                            .resizable()
                            .scaledToFill()
                    }
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .tint(.black)
                    }
                    
                }
            }
        }
    }
}

struct CurrentProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentProfileView()
    }
}
