//
//  TestListsModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 18/01/2024.
//

import Foundation

struct TestListsModel : Codable {
    
    let testLists : [TestModel]
    
}

struct TestModel : Codable, Identifiable {
    
    let id : Int
    let levelTitle : String
    let questionLists : [QuestionListsModel]
}

struct QuestionListsModel : Codable, Identifiable {
    let id : Int
    let question : String
    let answer : String
    let imageURL : String
    let soundURL : String
    let choices : [String]
}
