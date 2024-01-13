//
//  IconTextFieldView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 12/01/2024.
//

import SwiftUI

struct IconTextFieldView: View {
    
    // MARK: - PROPERTIES
    var imageName: String
    var placeholder: String
    var isPassword : Bool
    @Binding var text: String
    
    @State private var isPasswordVisible : Bool = false

    var body: some View {
        HStack {
            Image(imageName)
                .foregroundColor(grayColor)
                .padding(.leading, 8)

            // FOR PASSWORD TEXT FIELD
            if (isPassword) {
                
                HStack {
                    if (isPasswordVisible) {
                        TextField("",
                                  text: $text,
                                  prompt: Text(placeholder).foregroundColor(grayColor))
                        .font(subTitle)
                        
                    }
                    else{
                        
                        SecureField("", text: $text, prompt:
                                        Text(placeholder).foregroundColor(grayColor))
                            .font(subTitle)
                            .textInputAutocapitalization(.never)
                            .keyboardType(.asciiCapable) // This avoids suggestions bar on the keyboard.
                            .autocorrectionDisabled(true)
                    }
                }
                .overlay(alignment: .trailing) {
                    Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                        .padding()
                        .onTapGesture {
                            isPasswordVisible.toggle()
                        }
                }
                    
                    
            }
            // FOR EMAIL TEXT FIELD
            else{
                
                TextField("",
                          text: $text,
                          prompt: Text(placeholder).foregroundColor(grayColor))
                .font(subTitle)
            }
        }
        .foregroundStyle(Color.accentColor)
        .frame(height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(textFieldColor, lineWidth: 1)
        )
        .padding(.bottom, 15)
    }
}
