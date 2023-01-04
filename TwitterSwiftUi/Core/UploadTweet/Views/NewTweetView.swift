//
//  NewTweetView.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/03.
//

import SwiftUI

struct NewTweetView: View {
    // @State = 타입추론 어노테이션
    @State private var caption = ""
    
    // @Environment = 환경 변수, \. = Key path expression * 키에대한 프로퍼티 참조
    @Environment(\.presentationMode) var presentationMode
    
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
                    print("Tweet")
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
                Circle()
                    .frame(width: 64, height: 64)
                
                TextArea("뭐든 적으세요", text: $caption)
            }
            .padding()
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
