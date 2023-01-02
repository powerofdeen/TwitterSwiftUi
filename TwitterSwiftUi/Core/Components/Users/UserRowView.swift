//
//  UserRowView.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/02.
//

import SwiftUI

struct UserRowView: View {
    var body: some View {
        HStack(spacing: 12) {
            Circle()
                .frame(width: 48, height: 48)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("조커")
                    .font(.subheadline).bold()
                    .foregroundColor(.black)
                
                Text("옥수수녹차")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView()
    }
}
