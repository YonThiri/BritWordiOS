//
//  PodcastsModel.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 03/06/2024.
//

import Foundation

struct PodcastsModel: Codable, Identifiable {
    
    let id: Int
    let title: String
    let image: String
    let audio: String
    let createdDate: String
    let duration : String
    let speaker : String
}
