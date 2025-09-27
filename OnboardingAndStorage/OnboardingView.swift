//
//  OnboardingView.swift
//  OnboardingAndStorage
//
//  Created by Atul Tiwari on 27/09/25.
//

import SwiftUI

//MARK: Main Screen
struct OnboardingView: View {

    @State var onBoardingState: Int = 3
    @State var nameTextField:  String = ""
    @State var age:Double = 50
    @State var gender: String = ""

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
    }
}

#Preview {
    OnboardingView()
}

//MARK: Components
extension OnboardingView {

    //bottom button
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

    //welcome
    private var welcomeSection: some View {
        VStack(spacing: 40) {
            Spacer()
            Image(systemName: "heart.text.square.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .foregroundStyle(.red)

            Text("Find your match")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.red)

            Text(
                "This is the #1 app for finding your match online! In this tutorial we are practicing using AppStorage and other SwiftUI technique."
            )
            .fontWeight(.medium)
            .foregroundStyle(.red)
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
                .foregroundStyle(.red)
            
            TextField("Enter your Name", text: $nameTextField)
                .font(.headline)
                .frame(height: 50)
                .padding(.horizontal,20)
                .background(.gray).opacity(0.3)
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
                .foregroundStyle(.red)
            
            Text("\(String(format: "%.0f", age))")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .foregroundStyle(.red)
            
            Slider(value: $age, in: 18...100,step: 1)
                .accentColor(.red)
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
                .foregroundStyle(.red)
            Picker(selection: $gender) {
                Text("Male").tag("Male")
                Text("Female").tag("Female")
                
            } label: {
                Text("Select Gender")
                    .font(.title)
                    .foregroundStyle(.red)
            }
            .pickerStyle(WheelPickerStyle())

            Spacer()
            Spacer()
        }
        .padding(30)
    }

}
