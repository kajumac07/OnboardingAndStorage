//
//  OnboardingView.swift
//  OnboardingAndStorage
//
//  Created by Atul Tiwari on 27/09/25.
//

import SwiftUI

struct OnboardingView: View {

    @State var onBoardingState: Int = 0

    var body: some View {
        ZStack {
            // content
            
            ZStack {
                
            }
            
            // Button
            VStack {
                Spacer()
                bottomButton
            }
            .padding()
        }
    }
}

#Preview {
    OnboardingView()
}


//MARK: Components
extension OnboardingView {
    private var bottomButton: some View {
        Text("SignIn")
            .font(.headline)
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.red)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onTapGesture {
                //do something
            }
    }

}
