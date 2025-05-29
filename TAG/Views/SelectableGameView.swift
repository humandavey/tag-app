//
//  SelectableGameView.swift
//  TAG
//
//  Created by Davey Adams on 5/26/25.
//

import SwiftUI

struct SelectableGameView: View {
    @State private var showJoinAlert = false
    @State private var showCreateAlert = false
    
    @State private var joinAlertText = ""
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Text("Your Games")
            .font(.title)
            .bold()
            .foregroundStyle(colorScheme == ColorScheme.dark ? .white : Color(hex: "2a2a2a"))
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
            Button {
                showJoinAlert = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.blue)
                        .frame(height: 100)
                    VStack {
                        Image(systemName: "person.2.badge.plus.fill")
                            .font(.system(size: 32))
                        Text("Join a game")
                            .multilineTextAlignment(.center)
                    }
                    .tint(colorScheme == ColorScheme.dark ? .white : Color(hex: "2a2a2a"))
                }
            }.alert("Enter Join Code", isPresented: $showJoinAlert) {
                TextField("Enter join code", text: $joinAlertText)
                Button("Cancel") {
                    
                }
                Button("Join") {
                    
                }
            }
            Button {
                showCreateAlert = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.green)
                        .frame(height: 100)
                    VStack {
                        Image(systemName: "plus")
                            .font(.system(size: 32))
                        Text("Create a game")
                            .multilineTextAlignment(.center)
                    }
                    .tint(colorScheme == ColorScheme.dark ? .white : Color(hex: "2a2a2a"))
                }
            }.alert("Create Game", isPresented: $showCreateAlert) {
                Button("Cancel") {
                    
                }
                Button("Create") {
                    
                }
            }
        }.padding()
    }
}

struct GameCard: View {
    @State var groupName: String
    @State var symbol: String
    @State var color: Color
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button {
            print("tapped \(groupName)")
        } label: {
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
                .foregroundStyle(colorScheme == ColorScheme.dark ? .white : Color(hex: "2a2a2a"))
            }
        }
        .buttonStyle(PlainButtonStyle())
        .tint(colorScheme == ColorScheme.dark ? .white : Color(hex: "2a2a2a"))
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
