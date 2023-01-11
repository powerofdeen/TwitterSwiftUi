//
//  User.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/06.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    var isCurrentUser: Bool { return  Auth.auth().currentUser?.uid == id}
}
