//
//  NewTweetView.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/03.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    let feedViewModel: FeedViewModel
    // @State = 타입추론 어노테이션
    @State private var caption = ""
    
    // @Environment = 환경 변수, \. = Key path expression * 키에대한 프로퍼티 참조
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                }
                
                Spacer()
                
                Button {
                    viewModel.uploadTweet(withCaption: caption)
                } label: {
                    Text("Tweet")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(Color(.white))
                        .clipShape(Capsule())
                }
            }
            .padding()
            
            HStack(alignment: .top) {
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(width: 64, height: 64)
                } else {
                    Circle()
                        .frame(width: 64, height: 64)
                }
                
                TextArea("뭐든 적으세요", text: $caption)
            }
            .padding()
        }
        .onReceive(viewModel.$didUploadTweet) { success in
            if success {
                feedViewModel.fetchTweets()
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

//struct NewTweetView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewTweetView()
//    }
//}
