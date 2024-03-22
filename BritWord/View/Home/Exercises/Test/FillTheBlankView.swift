//
//  TestView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 14/01/2024.
//

import SwiftUI

struct FillTheBlankView: View {
    
    // MARK: - PROPERTIES
    @State private var question : String = ""
    @State private var answer : String = ""
    @State private var questionAndAnswer : String = ""
    @State private var inputAnswer = ""
    @State private var isButtonDisabled : [Bool] = []
    @State private var selectedIndex : [Int] = []
    
    @State private var testListsIndex : Int = 0
    @State private var questionListsIndex = 0
    @State private var showResultSheet : Bool = false
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack {
                
                // MARK: - PROGRESS VIEW
                LearningProgressView(color: testColor)
                
                Text("Fill in the blank.")
                    .font(subTitle)
                    .foregroundStyle(testColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: - SOUND PLAYER
                SoundPlayerView(
                    color: testColor,
                    isShowSeekBar: false)//: SOUND PLAYER
                
                // MARK: - QUESTION AND ANSWER
                VStack(alignment: .trailing) {
                    
                    // MARK: - QUESTION TEXT
                    HStack {
                        
                        Text(splitFirstPart())
                            .foregroundColor(blackColor)
                        
                        +
                        
                        Text(inputAnswer.isEmpty ? "_____" : inputAnswer)
                            
                            .foregroundColor(inputAnswer.isEmpty ? blackColor : testColor)
                        
                        +
                        
                        Text(splitSecondPart())
                            .foregroundColor(blackColor)
                        
                    }//: QUESTION TEXT
                    .font(subTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)
                    
                    // MARK: - DELETE
                    Button {
                        
                        if !inputAnswer.isEmpty && !selectedIndex.isEmpty {
                            
                            inputAnswer.removeLast()
                            
                            isButtonDisabled[selectedIndex[selectedIndex.count - 1]] = false
                            selectedIndex.removeLast()
                            
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
                                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                            inputAnswer += String(Array(answer)[arrayIndex])
                                            isButtonDisabled[arrayIndex] = true
                                            selectedIndex.append(arrayIndex)
                                            
                                            if answer.count == selectedIndex.count {
                                                showResultSheet.toggle()
                                            }
                                            
                                        } label: {
                                            
                                            Text("\(String(Array(answer)[arrayIndex]))")
                                                .font(subTitle)
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 50)
                                                .background(testColor)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        }
                                        .buttonStyle(tapBounceButtonStyle())
                                        .disabled(isButtonDisabled[arrayIndex])
                                        .opacity(isButtonDisabled[arrayIndex] ? 0.5 : 1)
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
            .padding(.top, 60)
        }
        .onAppear {
            
            testListsIndex = generateRandomNumber(min: 0, max: testLists.testLists.count - 1)
            
            questionListsIndex = generateRandomNumber(min: 0, max: testLists.testLists[testListsIndex].questionLists.count - 1)
            
            question = testLists.testLists[testListsIndex].questionLists[questionListsIndex].question
            
            answer = testLists.testLists[testListsIndex].questionLists[questionListsIndex].answer
            
            isButtonDisabled = Array(repeating: false, count: answer.count)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showResultSheet, content: {
            ResultSheetView()
                .presentationDetents([.height(150)])
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled()
        })
        
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
