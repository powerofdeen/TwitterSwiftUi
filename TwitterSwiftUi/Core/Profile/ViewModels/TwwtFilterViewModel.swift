//
//  TwwtFilterViewModel.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/02.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Replies"
        case .likes: return "Likes"
        }
    }
}
