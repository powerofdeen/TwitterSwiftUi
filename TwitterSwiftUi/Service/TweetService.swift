//
//  TweetService.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/10.
//

import Firebase

struct TweetService {
    
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        
        Firestore.firestore().collection("tweets")
            .document().setData(data) { error in
                if let error = error {
                    print("DEBUG: Failed to upload tweet with error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                completion(true)
            }
    }
    
    func fetchTweets(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let twwets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(twwets)
            }
    }
    
    func fetchTweets(forUid uid: String, completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments { snapshot, _ in
                guard let documents = snapshot?.documents else { return }
                let twwets = documents.compactMap({ try? $0.data(as: Tweet.self) })
                completion(twwets.sorted(by: { $0.timestamp.dateValue() > $1.timestamp.dateValue() }))
            }
    }
    
    func likeTweet() {
        print("DEBUG: Like tweet here..")
    }
}
