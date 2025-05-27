//
//  ProfileView.swift
//  TAG
//
//  Created by Davey Adams on 5/23/25.
//

import SwiftUI

struct ProfileView: View {
    @State var usernameText = "@humandavey"
    
    var body: some View {
        VStack() {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            Text("@humandavey").padding([.bottom], 20)
            
            Divider()
            
            ScrollView {
                OptionButton(title: "Profile", symbol: "person") {
                    Text("gurt: yo")
                }
                OptionButton(title: "Notifications", symbol: "iphone.badge.exclamationmark") {
                    Text("gurt: yo")
                }
                OptionButton(title: "Preferences", symbol: "gear") {
                    Text("gurt: yo")
                }
                OptionButton(title: "Privacy & Security", symbol: "lock") {
                    Text("gurt: yo")
                }
                OptionButton(title: "About", symbol: "info.circle") {
                    Text("gurt: yo")
                }
            }
            
            Spacer()
        }.padding([.top], 50)
    }
}

struct OptionButton<Content: View>: View {
    @State var title: String
    @State var symbol: String
    @State var content: () -> Content
    @State var expanded = false
    
    var body: some View {
        Button {
            withAnimation {
                expanded.toggle()
            }
        } label: {
            Image(systemName: symbol)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .rotationEffect(.degrees(expanded ? 90 : 0))
        }
        .padding()
        .tint(.black)
        
        if expanded {
            content().padding([.leading, .trailing, .bottom])
        }
    }
}

#Preview {
    ProfileView()
}
