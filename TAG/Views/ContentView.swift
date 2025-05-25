//
//  ContentView.swift
//  TAG
//
//  Created by Davey Adams on 5/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSidebar = false
    
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
                                
                            }, label: {
                                Image(systemName: "person.fill")
                                    .tint(.black)
                            })
                        }
                    }
            }
            
            SidebarView(isShowing: $showSidebar)
        }
    }
}

#Preview {
    ContentView()
}
