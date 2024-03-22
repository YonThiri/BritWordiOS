//
//  StoryListModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 15/01/2024.
//

import Foundation

struct StoryListModel : Codable {
    
    let storyList : [StoryModel]
    
}

struct StoryModel : Codable, Identifiable {
    
    let id : Int
    let title : String
    let imageURL : String
    let soundURL : String
    let content : String
    
}
