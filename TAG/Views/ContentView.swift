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
    @State private var currentProfileDetent = PresentationDetent.fraction(0.3)
    
    var body: some View {
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
                                    .tint(.black)
                                    .bold()
                            })
                        }
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                showProfileView.toggle()
                            }, label: {
                                Image(systemName: "person.fill")
                                    .tint(.black)
                            })
                        }
                    }
            }
        }
        .sheet(isPresented: $showProfileView) {
            ProfileView(currentDetent: $currentProfileDetent)
                .presentationDetents([.fraction(0.3), .fraction(0.9)], selection: $currentProfileDetent)
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showSelectableGamesView) {
            SelectableGameView()
                .presentationDetents([.fraction(0.9)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    ContentView()
}
