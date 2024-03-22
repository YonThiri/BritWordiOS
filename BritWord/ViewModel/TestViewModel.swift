//
//  TestViewModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 17/03/2024.
//

import Foundation

class TestViewModel : ObservableObject {
    
    @Published var testQuestion = [TestModel]()
    @Published var testListsIndex : Int = 0
    
    @Published var questionListsIndex = 0
    @Published var soundName : String = ""
    @Published var question : String = ""
    @Published var answer : String = ""
    
    func fetchTestData() {
        testListsIndex = generateRandomNumber(min: 0, max: testLists.testLists.count - 1)
        
        questionListsIndex = generateRandomNumber(min: 0, max: testLists.testLists[testListsIndex].questionLists.count - 1)
        
        question = testLists.testLists[testListsIndex].questionLists[questionListsIndex].question
        
        soundName = testLists.testLists[testListsIndex].questionLists[questionListsIndex].soundURL
        
        answer = testLists.testLists[testListsIndex].questionLists[questionListsIndex].answer
    }
}
