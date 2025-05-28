//
//  ChatView.swift
//  TAG
//
//  Created by Davey Adams on 5/23/25.
//

import PhotosUI
import SwiftUI

struct ChatView: View {
    @State private var messageContent = ""
    @FocusState private var showKeyboard: Bool
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            ScrollView() {
                Message(author: "davey", content: "hey there guys", picture: "laptopcomputer")
                Message(author: "davey", content: "hey there guys", picture: "laptopcomputer")
                Message(author: "gurt", content: "yo", picture: "laptopcomputer", left: true)
            }.onTapGesture {
                showKeyboard = false
            }
            
            HStack {
                PhotosPicker(selection: $pickerItem, matching: .images) {
                    Image(systemName: "camera.fill")
                        .padding(7)
                        .tint(.white)
                        .background(.blue)
                        .clipShape(.circle)
                }
                
                TextField("Message...", text: $messageContent)
                    .focused($showKeyboard)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 14)
                        .stroke(showKeyboard ? Color.blue : Color.gray, lineWidth: 1)
                    )
                
                Button {
                    
                } label: {
                    Image(systemName: "paperplane.fill")
                        .padding(7)
                        .tint(.white)
                        .background(.blue)
                        .clipShape(.circle)
                }
            }.padding()
        }
    }
}

struct Message: View {
    @State var author: String
    @State var content: String
    @State var picture: String
    @State var left = false;
    
    var body: some View {
        if left {
            HStack {
                VStack {
                    Image(systemName: picture).imageScale(.large)
                }
                
                VStack(alignment: .leading) {
                    Text(author).font(.caption)
                    VStack(alignment: .leading) {
                        Text(content)
                    }
                    .padding(8)
                    .background(.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(.white)
                }
                
                Spacer(minLength: 75)
            }
            .padding([.horizontal, .top], 8)
        } else {
            HStack {
                Spacer(minLength: 75)
                
                VStack(alignment: .trailing) {
                    Text(author).font(.caption)
                    VStack(alignment: .leading) {
                        Text(content)
                    }
                    .padding(5)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .foregroundStyle(.white)
                }
                
                VStack {
                    Image(systemName: picture).imageScale(.large)
                }
            }
            .padding([.horizontal, .top], 8)
        }
    }
}

#Preview {
    ChatView()
}
