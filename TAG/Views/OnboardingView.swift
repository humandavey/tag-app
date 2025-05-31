import SwiftUI

struct OnboardingView: View {
    @Binding var signedIn: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color(hex: "#B2E6EC")
                Spacer()
                Color(hex: "#4A4A4A")
            }
            .ignoresSafeArea()
            
            VStack {
                Text("TAG")
                    .font(.largeTitle)
                    .foregroundColor(Color(hex: "#2A2A2A"))
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(hex: "#B2E6EC"))

                Image("OnboardingAsset")
                    .resizable()
                    .scaledToFit()

                VStack {
                    Button {
                        signedIn = true
                    } label: {
                        Text("Log In")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(32)
                    }

                    Button {
                        
                    } label: {
                        Text("Sign Up")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(32)
                    }
                }
                .padding()
                .background(Color(hex: "#4A4A4A"))
            }
        }
    }
}

#Preview {
    OnboardingView(signedIn: .constant(false))
}
