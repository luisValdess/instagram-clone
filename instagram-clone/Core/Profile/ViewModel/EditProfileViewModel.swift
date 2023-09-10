//
//  EditProfileViewModel.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 9/2/23.
//

import SwiftUI
import PhotosUI
import Firebase

@MainActor
class EditProfileViewModel: ObservableObject {
    
    @Published var user: User
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    @Published var profileImage: Image?
    
    @Published var fullname = ""
    @Published var bio = ""
    
    private var uiImage: UIImage?
    
    init(user: User) {
        self.user = user
        
        if let fullname = user.fullname {
            self.fullname = fullname
        }
        
        if let bio = user.bio {
            self.bio = bio
        }
    }
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }
    
    func updateUserData() async throws {
        // update profile image if change
        
        var data = [String: Any]()
        
        if let uiImage = uiImage {
            let imageURL = try? await ImageUploader.uploadImage(image: uiImage)
            data["profileImageURL"] = imageURL
        }
        
        //update name if change
        if !fullname.isEmpty && user.fullname != fullname {
            data["fullname"] = fullname
        }
        
        //update bio if change
        if !bio.isEmpty && user.bio != bio {
            data["bio"] = bio
        }
        
        if !data.isEmpty {
            try await FirebaseConstants.UsersCollection.document(user.id).updateData(data)
        }
    }
}
