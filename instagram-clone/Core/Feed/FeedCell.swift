//
//  FeedCell.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/7/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack {
            
            // Image + Username
            HStack {
                Image("profile")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("maus__hous")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post Image
            Image("2")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            // Actions Buttons
            HStack(spacing: 16) {
                Button {
                    print("Like a post")
                } label: {
                    Image(systemName: "heart")
                }
                
                Button {
                    print("Comment a post")
                } label: {
                    Image(systemName: "bubble.right")
                }
                
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                }

                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .tint(.black)
            
            //Likes Label
            Text("48 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment:  .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack {
                Text("maus__hous ").fontWeight(.semibold) +
                Text("This is a caption.")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            
            Text("6h ago")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.footnote)
                .padding(.leading, 10)
                .foregroundColor(.gray)
                .padding(.top, 1)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
