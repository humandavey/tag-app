//
//  ContentView.swift
//  TAG
//
//  Created by Davey Adams on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSidebar = false
    @State private var showProfileView = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                GameView()
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading) {
                            Button(action: {
                                showSidebar.toggle()
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
            
            SidebarView(isShowing: $showSidebar)
        }
        .sheet(isPresented: $showProfileView) {
            ProfileView()
                .presentationDetents([.fraction(0.3), .fraction(0.9)])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    ContentView()
}
