//
//  RegistrationView.swift
//  Cosmetics
//
//  Created by Елена Крылова on 13.08.2023.
//

import SwiftUI

struct User {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
}

class UserManager: ObservableObject {
    @Published var users: [User] = []
    
    func registerUser(user: User) {
        users.append(user)
    }
}

struct RegistrationView: View {
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isRegistered: Bool = false
    @State private var isErrorAlertPresented: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                HStack{
                    VStack(spacing: 30){
                        Text("Pesonal information")
                        TextField("Name", text: $firstName)
                        TextField("Surname", text: $lastName)
                        Text("Contact Information")
                        SecureField("Emale", text: $email)
                        SecureField("Password", text: $password)
                        Button(action: {
                            if password == confirmPassword {
//                                let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password)
//                                userManager.registerUser(user: newUser)
                                isRegistered = true
                            } else {
                                isErrorAlertPresented = true
                                errorMessage = "password does not match"
                                isRegistered = false
                            }
                        }) {
                            Text("Register")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                        .padding()
                        .background(Color.indigo)
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        
                        if isRegistered {
                            NavigationLink(destination: RegistrationSuccessView()) {
                                Text("Registration Succesful")
                                    .foregroundColor(.white)
                                    .padding()
                                    .background(Color.indigo)
                                    .cornerRadius(10)
                            }
                        }
                    }
                }
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .alert(isPresented: $isErrorAlertPresented) {
                    Alert(title: Text("Error"),
                          message: Text(errorMessage),
                          dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }
}
struct RegistrationSuccessView: View {
    var body: some View {
        Text("Congratulations! Registration was successful.")
            .font(.largeTitle)
            .foregroundColor(.green)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

