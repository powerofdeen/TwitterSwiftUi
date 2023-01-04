//
//  CustomInputField.swift
//  TwitterSwiftUi
//
//  Created by powerofdeen on 2023/01/04.
//

import SwiftUI

struct CustomInputField: View {
    let ImageName: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: ImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                TextField(placeholderText, text: $text)
            }
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(ImageName: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
