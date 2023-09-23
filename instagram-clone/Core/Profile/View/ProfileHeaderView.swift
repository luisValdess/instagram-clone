//
//  ProfileHeaderView.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/11/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @State private var showEditProfile = false
    
    private var user: User {
        return viewModel.user
    }
    
    private var isFollowed: Bool {
        return user.isFollowed ?? false
    }
    
    private var stats: UserStats {
        return user.stats ?? .init(followingCount: 0, followersCount: 0, postsCount: 0)
    }
    
    private var buttonTitle: String {
        if user.isCurrentUser {
            return "Edit Profile"
        } else {
            return isFollowed ? "Following" : "Follow"
        }
    }
    
    private var buttonBackground: Color {
        if user.isCurrentUser || isFollowed {
            return .white
        } else {
            return Color(.systemBlue)
        }
    }
    
    private var buttonForegroundColor: Color {
        if user.isCurrentUser || isFollowed {
            return .black
        } else {
            return .white
        }
    }
    
    private var buttonBorderColor: Color {
        if user.isCurrentUser || isFollowed {
            return .gray
        } else {
            return .clear
        }
    }
    
    init(user: User) {
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(spacing: 10) {
            
            // Pic and Stats
            HStack {
                CircularProfileImageView(user: user, size: .large)
                
                Spacer()
                
                HStack {
                    UserStatView(value: stats.postsCount, title: "Posts")
                    
                    NavigationLink(value: UserListConfig.followers(uid: user.id)) {
                        UserStatView(value: stats.followersCount, title: "Followers")
                    }
                    
                    NavigationLink(value: UserListConfig.following(uid: user.id)) {
                        UserStatView(value: stats.followingCount, title: "Following")
                    }
                    
                }
            }
            .padding(.horizontal)
            
            // Name and Bio
            VStack(alignment: .leading, spacing: 4) {
                Text(user.fullname ?? "")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Text(user.bio ?? "")
                    .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            // Action Button
            Button {
                if user.isCurrentUser {
                    showEditProfile.toggle()
                } else {
                    handleFollowTapped()
                }
            } label: {
                Text(buttonTitle)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(buttonBackground)
                    .foregroundColor(buttonForegroundColor)
                    .cornerRadius(6)
                    .overlay {
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(buttonBorderColor, lineWidth: 1)
                    }
            }
            
            Divider()
            
        }
        .navigationDestination(for: UserListConfig.self, destination: { config in
            UsersListView(config: config)
        })
        .onAppear(perform: {
            viewModel.checkUserIsFollowed()
            viewModel.fetchUserStats()
        })
        .fullScreenCover(isPresented: $showEditProfile) {
            EditProfileView(user: user)
        }
    }
    
    func handleFollowTapped() {
        if isFollowed {
            viewModel.unfollow()
        } else {
            viewModel.follow()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(user: User.MockUsers[0])
    }
}
