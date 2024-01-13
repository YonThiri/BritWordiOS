//
//  PhoneticsExampleView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 13/01/2024.
//

import SwiftUI

struct PhoneticsExampleView: View {
<<<<<<< HEAD
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            // MARK: - EXAMPLE TITLE
            Text("Example")
                .font(descriptionText)
                .foregroundStyle(grayColor)
            
            
            // MARK: - EXAMPLE WORDS
            VStack(alignment: .leading) {
                ForEach(1..<3, id: \.self) { example in
                    
                    HStack(spacing: 15) {
                        
                        Text("\(example) .")
                            
                        Text("\"cat\"")
                        
                        Text("/kæt/ ")
                            .font(bodyText)
                        
                        Spacer()
                        
                        // MARK: - SOUND BUTTON
                        Button(action: {
                            
                        }, label: {
                            Image("speaker")
                                .renderingMode(.template)
                                .foregroundStyle(phoneticsColor)
                        })
                        .buttonStyle(tapBounceButtonStyle())
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(phoneticsBgColor)
                        )
                        
                    }
                    .font(descriptionText)
                    .foregroundStyle(blackColor)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(whiteColor)
            )
            
            Spacer()
            
            // MARK: - BACK & NEXT BUTTONS
            HStack {
                
                // MARK: - BACK
                Button(action: {
                    
                }, label: {
                    Text("Back")
                        .font(subTitle)
                        .foregroundStyle(phoneticsColor)
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .buttonStyle(tapBounceButtonStyle())
                
                // MARK: - NEXT
                Button(action: {
                    
                }, label: {
                    ButtonView(
                        color: phoneticsColor,
                        buttonTitle: "Next")
                })
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .buttonStyle(tapBounceButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)

=======
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
>>>>>>> 4a42fd8cb645f2c87fa23c3968db331fe7d00a92
    }
}

#Preview {
    PhoneticsExampleView()
}
