//
//  TestView.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 14/01/2024.
//

import SwiftUI

struct FillTheBlankView: View {
    
    // MARK: - PROPERTIES
    @State private var questionAndAnswer : String = ""
    @State private var inputAnswer = ""
    @State private var isButtonDisabled : [Bool] = [false]
    @State private var selectedIndex : [Int] = []
    @State private var showResultSheet : Bool = false
    
    @StateObject var testVm = TestViewModel()
    
    @State private var resultIcon : String = ""
    @State private var resultText : String = ""
    @State private var resultColor : Color = .clear
    
    var pathFromFirebase = "Sounds/Test/"
    @StateObject var audioPlayer = AudioPlayer() // Initialize AudioPlayer
    @State var progress : Int = 1
    
    var body: some View {
        
        ZStack {
            
            backgroundColor
            
            VStack {
                
                // MARK: - PROGRESS VIEW
                LearningProgressView(color: testColor, progressCount: progress, totalQuestion: totalQuestion)
                
                Text("Fill in the blank.")
                    .font(subTitle)
                    .foregroundStyle(testColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: - SOUND PLAYER
                SoundPlayerView(
                    color: testColor, soundName: testVm.soundName, pathFromFirebase: pathFromFirebase, audioPlayer: audioPlayer)//: SOUND PLAYER
                
                // MARK: - QUESTION AND ANSWER
                VStack(alignment: .trailing) {
                    
                    // MARK: - QUESTION TEXT
                    HStack {
                        
                        // First Part of question
                        Text(splitFirstPart())
                            .foregroundColor(blackColor)
                        
                        +
                        
                        // Input Answer
                        Text(inputAnswer.isEmpty ? "_____" : inputAnswer)
                            .foregroundColor(inputAnswer.isEmpty ? blackColor : testColor)
                        
                        +
                        
                        // Second Part of question
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
                        ForEach(Array(testVm.answer).indices, id: \.self) { index in
                            HStack {
                                ForEach(0..<3 , id: \.self) { columnIndex in
                                    
                                    let arrayIndex = index * 3 + columnIndex
                                    
                                    if arrayIndex < Array(testVm.answer).count {
                                        
                                        Button {
                                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                            inputAnswer += String(Array(testVm.answer)[arrayIndex])
                                            isButtonDisabled[arrayIndex] = true
                                            selectedIndex.append(arrayIndex)
                                            
                                            if testVm.answer.count == selectedIndex.count {
                                                
                                                setResultData()
                                                showResultSheet.toggle()
                                            }
                                            
                                        } label: {
                                            
                                            Text("\(String(Array(testVm.answer)[arrayIndex]))")
                                                .font(subTitle)
                                                .foregroundColor(.white)
                                                .frame(maxWidth: .infinity)
                                                .frame(height: 50)
                                                .background(testColor)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                        }
                                        .buttonStyle(tapBounceButtonStyle())
                                        .disabled(isButtonDisabled.indices.contains(arrayIndex) ? isButtonDisabled[arrayIndex] : false)
                                        .opacity(isButtonDisabled.indices.contains(arrayIndex) && isButtonDisabled[arrayIndex] ? 0.5 : 1)
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
            fetchDataAndUpdateView() // Fetch data when view appears
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showResultSheet, onDismiss: {
            fetchDataAndUpdateView() // Reload data when sheet is dismissed
            resetValues() // Reset input and state values
        }) {
            ResultSheetView(icon: resultIcon, text: resultText, textColor: resultColor, progress: $progress)
                .presentationDetents([.height(150)])
                .presentationDragIndicator(.hidden)
                .interactiveDismissDisabled()
        }
        
    }
    
    // MARK: - SPLIT FIRST PART BEFORE "_____"
    func splitFirstPart() -> String{
        let parts = testVm.question.components(separatedBy: "_____")
        let beforePlaceholder = parts.first ?? ""
        return beforePlaceholder
    }
    
    // MARK: - SPLIT SECOND PART AFTER "_____"
    func splitSecondPart() -> String {
        let parts = testVm.question.components(separatedBy: "_____")
        let afterPlaceholder = parts.last ?? ""
        return afterPlaceholder
    }
    
    // MARK: - Fetch Data and Update View
    func fetchDataAndUpdateView() {
        testVm.fetchTestData()
        isButtonDisabled = Array(repeating: false, count: testVm.answer.count)
        
        audioPlayer.isDownloaded = false
        audioPlayer.playAudio(soundName: "\(testVm.soundName).mp3", pathFromFirebase: pathFromFirebase)
    }
    
    // MARK: - Reset Values
    func resetValues() {
        questionAndAnswer = ""
        inputAnswer = ""
        isButtonDisabled.removeAll()
        selectedIndex.removeAll()
        isButtonDisabled = Array(repeating: false, count: testVm.answer.count)
    }
    
    // MARK: - Set Result Data
    func setResultData() {
        if testVm.answer == inputAnswer {
            resultIcon = "result_correct"
            resultText = "Correct"
            resultColor = correctColor
        } else {
            resultIcon = "result_wrong"
            resultText = "Wrong"
            resultColor = wrongColor
        }
    }
}



#Preview {
    FillTheBlankView()
}
