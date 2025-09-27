//
//  ProfileView.swift
//  OnboardingAndStorage
//
//  Created by Atul Tiwari on 27/09/25.
//

import SwiftUI

struct ProfileView: View {
    
    // App Storage
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        ZStack {
            
            // Background Gradient
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
            
            VStack(spacing: 30) {
                Spacer()
                // Profile Icon
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.white)
                    .shadow(radius: 10)
                
                // User Info Card
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Label(currentUserName ?? "Your Name", systemImage: "person.fill")
                    }
                    HStack {
                        Label("\(currentUserAge ?? 0) years old", systemImage: "calendar")
                    }
                    HStack {
                        Label(currentUserGender ?? "Unknown", systemImage: "heart.fill")
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(.white.opacity(0.9))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 5)
                .padding(.horizontal)
                
                Spacer()
                
                // Sign Out Button
                Button(action: {
                    signOut()
                }) {
                    Text("Sign Out")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            LinearGradient(colors: [.red, .orange],
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(radius: 5)
                }
                .padding(.horizontal)
                
            }
            .padding()
        }
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        currentUserSignedIn = false
    }
}

#Preview {
    ProfileView()
}
