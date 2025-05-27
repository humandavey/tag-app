//
//  SelectableGameView.swift
//  TAG
//
//  Created by Davey Adams on 5/26/25.
//

import SwiftUI

struct SelectableGameView: View {
    var body: some View {
        Text("Your Games")
            .font(.title)
            .bold()
            .padding([.top], 20)
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                GameCard(groupName: "some group", symbol: "person.fill", color: .green)
                GameCard(groupName: "tech bros", symbol: "laptopcomputer", color: .purple)
                GameCard(groupName: "goon squad", symbol: "tree.fill", color: .blue)
            }
        }
        .padding([.horizontal, .bottom], 20)
        
        Divider()
        
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.blue)
                    .frame(height: 100)
                VStack {
                    Image(systemName: "person.2.badge.plus.fill")
                        .font(.system(size: 32))
                    Text("Join a group")
                        .multilineTextAlignment(.center)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.green)
                    .frame(height: 100)
                VStack {
                    Image(systemName: "plus")
                        .font(.system(size: 32))
                    Text("Create a group")
                        .multilineTextAlignment(.center)
                }
            }
        }.padding()
    }
}

struct GameCard: View {
    @State var groupName: String
    @State var symbol: String
    @State var color: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(color)
                .frame(height: 100)
            VStack {
                Image(systemName: symbol)
                    .font(.system(size: 32))
                Text(groupName)
                    .multilineTextAlignment(.center)
            }
        }
        .contextMenu() {
            Button(role: .destructive) {
                
            } label: {
                Label("Leave", systemImage: "trash")
            }
        }
    }
}

#Preview {
    SelectableGameView()
}
