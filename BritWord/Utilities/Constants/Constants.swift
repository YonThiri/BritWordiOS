//
//  Constants.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import Foundation

let totalQuestion : Int = 15

// data
//let differentWords : DifferentWordsListModel = Bundle.main.decode("differentwords.json")
let storyLists : StoryListModel = Bundle.main.decode("storyListening.json")
let vowelPhoneticLists : PhoneticsListModel = Bundle.main.decode("vowels_phonetics.json")
let diphthongsPhoneticLists : PhoneticsListModel = Bundle.main.decode("diphthongs_phonetics.json")
let consonantsPhoneticLists : PhoneticsListModel = Bundle.main.decode("consonants_phonetics.json")
let testLists : TestListsModel = Bundle.main.decode("test_lists.json")


// FUNCTIONS
func generateRandomNumber(min : Int, max: Int) -> Int {
    
    // Generate a random number between 1 and 100 (inclusive)
    let randomNumber = Int.random(in: min...max)
    return randomNumber
}
