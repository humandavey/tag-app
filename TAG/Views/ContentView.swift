//
//  ContentView.swift
//  TAG
//
//  Created by Davey Adams on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSelectableGamesView = false
    @State private var showProfileView = false
    @State private var signedIn = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if signedIn {
            ZStack {
                NavigationStack {
                    GameView()
                        .toolbar {
                            ToolbarItem(placement: .topBarLeading) {
                                Button(action: {
                                    showSelectableGamesView.toggle()
                                }, label: {
                                    Text("The Woodlands TAG")
                                        .font(.title2)
                                        .tint(colorScheme == ColorScheme.dark ? .white : Color(hex: "2a2a2a"))
                                        .bold()
                                })
                            }
                            ToolbarItem(placement: .topBarTrailing) {
                                Button(action: {
                                    showProfileView.toggle()
                                }, label: {
                                    Image(systemName: "person.fill")
                                        .tint(colorScheme == ColorScheme.dark ? .white : Color(hex: "2a2a2a"))
                                })
                            }
                        }
                }
            }
            .sheet(isPresented: $showProfileView) {
                ProfileView()
                    .presentationDetents([.fraction(0.9)])
                    .presentationDragIndicator(.visible)
            }
            .sheet(isPresented: $showSelectableGamesView) {
                SelectableGameView()
                    .presentationDetents([.fraction(0.9)])
                    .presentationDragIndicator(.visible)
            }
        } else {
            OnboardingView(signedIn: $signedIn)
        }
    }
}

#Preview {
    ContentView()
}
