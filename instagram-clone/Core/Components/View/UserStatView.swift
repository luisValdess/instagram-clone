//
//  UserStatView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/7/23.
//

import SwiftUI

struct UserStatView: View {
    
    let value: Int
    let title: String
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Text("\(title)")
                .font(.footnote)
        }
        .opacity(value == 0 ? 0.5 : 1.0)
        .frame(width: 76)
    }
}

struct UserStatView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatView(value: 100, title: "Followers")
    }
}
