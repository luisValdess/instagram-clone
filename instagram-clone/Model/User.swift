//
//  User.swift
//  instagram-clone
//
//  Created by Luis Miguel Valdes Napoles on 8/9/23.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileUserURL: String?
    var fullname: String?
    var bio: String?
    let email: String
}

extension User {
    static var MockUsers: [User] = [
        .init(id: NSUUID().uuidString, username: "EL PEPE",profileUserURL: "2", fullname: "Pepe", bio: "La bio de PEPE", email: "pepe@gmail.com"),
        .init(id: NSUUID().uuidString, username: "LA LOLA",profileUserURL: "3", fullname: nil, bio: "La bio de LOLA", email: "lola@gmail.com"),
        .init(id: NSUUID().uuidString, username: "EL COCO",profileUserURL: "4", fullname: "Coco", bio: "La bio de COCO", email: "coco@gmail.com"),
        .init(id: NSUUID().uuidString, username: "EL NENE",profileUserURL: "5", fullname: "Nene", bio: "La bio de NENE", email: "nene@gmail.com"),
    ]
}
