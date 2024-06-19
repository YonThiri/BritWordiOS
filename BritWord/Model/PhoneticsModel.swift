//
//  PhoneticsModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 17/04/01/2024.
//

import Foundation

struct PhoneticsListModel : Codable {
    
    let phoneticsList : [PhoneticModel]
    
}

struct PhoneticModel : Codable, Identifiable {
    
    let id : Int
    let word : String
    let description : String
    let explanation : String
    let example : [Example]
}

struct Example : Codable, Identifiable {
    let id : Int
    let soundURL : String
    let word : String
    let phoneticsSymbol : String
}
