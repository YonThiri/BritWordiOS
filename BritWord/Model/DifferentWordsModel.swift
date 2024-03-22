//
//  DifferentWordsModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 15/01/2024.
//

import Foundation

struct DifferentWordModel : Codable, Identifiable {
    
    let id : Int
    let us : String
    let uk : String
    let imageURL : String
    let ukSoundURL : String
    let usSoundURL : String
}
