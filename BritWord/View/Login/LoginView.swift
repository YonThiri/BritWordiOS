//
//  LoginView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 12/01/2024.
//

import SwiftUI

struct LoginView: View {
    
    // MARK: - PROPERTIES
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var showHomeView : Bool = false
    
    var body: some View {
        
        
        if (showHomeView) {
            HomeView()
        }
        else{
            ZStack {
                
                backgroundColor
                
                VStack {
                    
                    HStack(spacing: 15) {
                        
                        Text("Welcome Back \nTo ")
                            .font(loginTitle)
                        +
                        Text("BritWord")
                            .font(britTitle)
                            .foregroundColor(Color.accentColor)
                            
                        
                        Image("login")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 250)
                    }
                    .foregroundStyle(blackColor)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack (alignment: .trailing) {
                        IconTextFieldView(
                            imageName: "email",
                            placeholder: "Email",
                            isPassword: false,
                            text: $emailTextField)
                        
                        IconTextFieldView(
                            imageName: "password",
                            placeholder: "Password",
                            isPassword: true,
                            text: $passwordTextField)
                        
                        Button(action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .font(bodyText)
                                .foregroundStyle(grayColor)
                        })
                        .buttonStyle(tapBounceButtonStyle())
                    }
                    
                    Button(action: {
                        
                        withAnimation(.spring) {
                            
                            showHomeView.toggle()
                        }
                        
                    }, label: {
                        ButtonView(color: Color.accentColor, buttonTitle: "Login")
                    })
                    .buttonStyle(tapBounceButtonStyle())
                    
                }
                .padding(20)
                
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    LoginView()
}

