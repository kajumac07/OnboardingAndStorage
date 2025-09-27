import SwiftUI

struct IntroView: View {
    
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 15/255, green: 32/255, blue: 39/255),   // #0F2027
                    Color(red: 32/255, green: 58/255, blue: 67/255),   // #203A43
                    Color(red: 44/255, green: 83/255, blue: 100/255)   // #2C5364
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            
            
             //if user signed in -> Profile View
             //else -> Onboarding View
            
            
            if currentUserSignedIn {
                Text("Profile View")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            } else {
                OnboardingView()
            }
        }
    }
}

#Preview {
    IntroView()
}
