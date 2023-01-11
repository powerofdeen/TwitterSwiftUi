//
//  Tweet.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/10.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    
    var user: User?
}
