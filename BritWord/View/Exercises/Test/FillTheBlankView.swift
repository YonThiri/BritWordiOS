//
//  TestView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 14/01/2024.
//

import SwiftUI

struct FillTheBlankView: View {
    
    // MARK: - PROPERTIES
    var question = "I have _____ apples."
    var answer = "strawberri"
    @State private var questionAndAnswer : String = ""
    @State private var inputAnswer = ""
    
    
    var body: some View {
        
        VStack {
            
            // MARK: - PROGRESS VIEW
            LearningProgressView(color: vocabularyColor)
            
            Text("Fill in the blank.")
                .font(descriptionText)
                .foregroundStyle(vocabularyColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - SOUND PLAYER
            SoundPlayerView(
                color: vocabularyColor,
                isShowSeekBar: false)//: SOUND PLAYER
            
            // MARK: - QUESTION AND ANSWER
            VStack(alignment: .trailing) {
                
                // MARK: - QUESTION TEXT
                HStack {
                    
                    Text(splitFirstPart())
                    
                    +
                    
                    Text(inputAnswer.isEmpty ? "_____" : inputAnswer)
                        .font(subTitle)
                        .foregroundColor(inputAnswer.isEmpty ? blackColor : Color.red)
                    
                    +
                    
                    Text(splitSecondPart())
                }//: QUESTION TEXT
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
                
                // MARK: - DELETE
                Button {
                    
                    if !inputAnswer.isEmpty {
                        inputAnswer.removeLast()
                    }
                    
                    
                } label: {
                    Image(systemName: "delete.left.fill")
                        .imageScale(.large)
                        .foregroundStyle(wrongColor)
                }//: DELETE
                .buttonStyle(tapBounceButtonStyle())
                
                // MARK: - FILL THE BLANK TEXT
                VStack {
                    ForEach(Array(answer).indices, id: \.self) { index in
                        HStack {
                            ForEach(0..<3 , id: \.self) { columnIndex in
                                
                                let arrayIndex = index * 3 + columnIndex
                                if arrayIndex < Array(answer).count {
                                    
                                    Button {
                                        
                                        inputAnswer += String(Array(answer)[arrayIndex])
                                        
                                    } label: {
                                        
                                        Text("\(String(Array(answer)[arrayIndex]))")
                                            .font(subTitle)
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 45)
                                            .background(vocabularyColor)
                                            .clipShape(RoundedRectangle(cornerRadius: 15))
                                    }
                                    .buttonStyle(tapBounceButtonStyle())
                                }
                            }
                        }
                    }
                }//: FILL THE BLANK TEXT
                .padding(.top, 20)
            }//: QUESTION AND ANSWER
            
            Spacer()
        }
        .padding()
        
    }
    
    // MARK: - SPLIT FIRST PART BEFORE "_____"
    func splitFirstPart() -> String{
        
        let parts = question.components(separatedBy: "_____")
        let beforePlaceholder = parts.first ?? ""
        
        return beforePlaceholder
    }
    
    // MARK: - SPLIT SECOND PART AFTER "_____"
    func splitSecondPart() -> String {
        
        let parts = question.components(separatedBy: "_____")
        let afterPlaceholder = parts.last ?? ""
        
        return afterPlaceholder
    }
}

#Preview {
    FillTheBlankView()
}
