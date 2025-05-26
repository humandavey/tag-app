//
//  ProfileView.swift
//  TAG
//
//  Created by Davey Adams on 5/23/25.
//

import SwiftUI

struct ProfileView: View {
    @Binding var currentDetent: PresentationDetent
    @State var usernameText = "@humandavey"
    
    var body: some View {
        VStack() {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            
            Text("@humandavey")
            
            if currentDetent == PresentationDetent.fraction(0.9) {
                TextField("Username", text: $usernameText)
            }
            
            Spacer()
        }.padding([.top], 50)
    }
}

#Preview {
    ProfileView(currentDetent: .constant(PresentationDetent.fraction(0.9)))
}
