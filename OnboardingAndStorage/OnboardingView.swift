//
//  OnboardingView.swift
//  OnboardingAndStorage
//
//  Created by Atul Tiwari on 27/09/25.
//

import SwiftUI

//MARK: Main Screen
struct OnboardingView: View {

    @State var onBoardingState: Int = 0
    @State var nameTextField: String = ""
    @State var age: Double = 50
    @State var gender: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ZStack {
            // content

            ZStack {
                switch onBoardingState {
                case 0:
                    welcomeSection
                case 1:
                    addNameSection
                case 2:
                    addAgeSection
                case 3:
                    addGenderSection
                default:
                    RoundedRectangle(cornerRadius: 10)
                        .background(.white)
                }
            }.ignoresSafeArea()

            // Button
            VStack {
                Spacer()
                bottomButton
            }
            .padding()
        }
        .alert("Alert!", isPresented: $showAlert, presenting: alertTitle) { title in
            Button("OK", role: .cancel) { }
        } message: { title in
            Text("Alert for: \(title)")
        }
    }
}

#Preview {
    OnboardingView().background(.blue)
}

//MARK: Components
extension OnboardingView {

    //bottom button
    private var bottomButton: some View {
        Text(
            onBoardingState == 0
                ? "Sign up" : onBoardingState == 3 ? "Finish" : "Next"
        )
        .font(.headline)
        .foregroundStyle(.white)
        .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(.red)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            //do something
            handleNextButtonPressed()
        }
    }

    //welcome
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(.white)

            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            Text(
                "This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI technique."
            )
            .fontWeight(.medium)
            .foregroundStyle(.white)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(30)
    }

    //name section
    private var addNameSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's Your Name.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            TextField("Enter your Name", text: $nameTextField)
                .font(.headline)
                .frame(height: 50)
                .padding(.horizontal, 20)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Spacer()
            Spacer()
        }
        .padding(30)
    }

    //age section
    private var addAgeSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's Your Age.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)

            Slider(value: $age, in: 18...100, step: 1)
                .accentColor(.white)
            Spacer()
            Spacer()
        }
        .padding(30)
    }

    //gender section
    private var addGenderSection: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("What's Your Gender.")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Picker(selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")

            } label: {
                Text("Select Gender")
                    .font(.title)
                    .foregroundStyle(.white)
            }
            .pickerStyle(WheelPickerStyle())

            Spacer()
            Spacer()
        }
        .padding(30)
    }

}

//MARK: Functions

extension OnboardingView {
    func handleNextButtonPressed() {
        
        //check inputs
        switch onBoardingState {
        case 1:
            guard nameTextField.count >= 4 else {
                showAlert(title: "Your name must be at least 4 characters long 😒")
                return
            }
        default:
            break
        }
        
        if onBoardingState == 3 {
            //sign in
        } else {
            withAnimation(.spring()) {
                onBoardingState += 1
            }
        }
    }
    
    
    func showAlert(title:String){
        alertTitle = title
        showAlert.toggle()
    }
}
