//
//  Constants.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 04/01/2024.
//

import Foundation

struct Constants {
    
    static let supabaseUrl = URL(string: "https://cqswcunxerqctddakmso.supabase.co")!
        
    static let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNxc3djdW54ZXJxY3RkZGFrbXNvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc1NjEwMzEsImV4cCI6MjAyMzEzNzAzMX0.J4MqseEVcWAH7LlSxquQHvc9tUwS0A5MSihXUDD8wzo"
}

// data
let vowelPhoneticLists : PhoneticsListModel = Bundle.main.decode("vowels_phonetics.json")
let diphthongsPhoneticLists : PhoneticsListModel = Bundle.main.decode("diphthongs_phonetics.json")
let consonantsPhoneticLists : PhoneticsListModel = Bundle.main.decode("consonants_phonetics.json")

// FUNCTIONS
func generateRandomNumber(min : Int, max: Int) -> Int {
    
    // Generate a random number between 1 and 100 (inclusive)
    let randomNumber = Int.random(in: min...max)
    return randomNumber
}
