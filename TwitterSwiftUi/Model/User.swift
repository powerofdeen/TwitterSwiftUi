//
//  User.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/06.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
}
