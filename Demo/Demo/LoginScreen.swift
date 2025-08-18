//
//  LoginScreen.swift
//  Demo
//
//  Created by Andrea Torres on 14/04/25.
//

import SwiftUI

struct LoginScreen: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isVisible = false
    
    var body: some View {
        
        VStack (spacing: 16){
            
            
            TextField("Username", text: $username)
                .frame(height: 50)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            ZStack (alignment: .trailing){
                Group{
                    if isVisible {
                        
                        TextField("Password", text: $password)
                            .autocorrectionDisabled(true)
                    }else{
                        SecureField("Password", text: $password)
                        
                    }
                    
                    
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    isVisible.toggle()
                }) {
                    Image(systemName: isVisible ? "eye.slash" : "eye")
                }
            }
            Button(action: {
            }) {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Button(action: {
            }) {
                Text("Sign up")
            }
            
        }
        .padding()
    }
}

#Preview {
    LoginScreen()
}
