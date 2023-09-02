//
//  FirstView.swift
//  Cosmetics
//
//  Created by Елена Крылова on 03.08.2023.
//

import SwiftUI
import CoreData

// Первый экран
struct FirstView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var isNavigating: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    Text("Welcome to the makeup app")
                        .foregroundColor(.black)
                        .bold()
                        .font(.largeTitle)
                        .baselineOffset(0)
                        .multilineTextAlignment(.center)
                    Text("Are you ready to be beautiful?")
                        .foregroundColor(.black)
                        .bold()
                        .font(.title)
                        .baselineOffset(100)
                    Text("login or register")
                        .foregroundColor(.black)
                    TextField("Email", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        if !username.isEmpty && !password.isEmpty {
                            isShowingAlert = true
//                            NavigationLink(<#LocalizedStringKey#>, destination: SecondView())
                        } else {
                            isShowingAlert = false
                        }
                    }){
                        Text("Enter")
                            .foregroundColor(.black)
                            .padding()
                            .background(Color.indigo)
                            .cornerRadius(10)
                    }
                    NavigationLink(destination: RegistrationView()) {
                        Text("Registration")
                            .foregroundColor(.black)
                    }
//                    NavigationLink("", destination: (), isActive: $isNavigating)
                }
                .padding()
            }
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}


