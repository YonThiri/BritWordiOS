//
//  AudioPlayer.swift
//  BritWord
//
//  Created by Yon Thiri Aung on 07/02/2024.
//

import Foundation
import AVFoundation
import FirebaseStorage
import SwiftUI

class AudioPlayer: ObservableObject {
    var player: AVPlayer?
    @Published var isFinished = true
    
    func playAudio(soundName: String, pathFromFirebase: String) {
        guard let url = cachedFileURL(soundName: soundName,pathFromFirebase : pathFromFirebase) else {
            print("Local file not found.")
            return
        }
        
        playSound(url: url)
    }
    
    func cachedFileURL(soundName: String, pathFromFirebase : String) -> URL? {
        // Create a URL for local cache directory
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Error getting documents directory.")
            return nil
        }
        
        // Append the file name to the local cache directory
        let fileURL = documentsDirectory.appendingPathComponent(soundName)
        
        // Check if file exists locally
        if FileManager.default.fileExists(atPath: fileURL.path) {
            print("Local file found at \(fileURL)")
            return fileURL
        } else {
            // If file does not exist, download it from Firebase Storage
            downloadAudio(from: fileURL, soundName: soundName, pathFromFirebase : pathFromFirebase)
            return nil
        }
    }
    
    func downloadAudio(from fileURL: URL, soundName: String, pathFromFirebase : String) {
        let storageRef = Storage.storage().reference(withPath: "\(pathFromFirebase)\(soundName)")
        
        // Download the file from Firebase Storage to a local file URL
        storageRef.write(toFile: fileURL) { url, error in
            if let error = error {
                print("Error downloading audio: \(error.localizedDescription)")
                return
            }
            print("Audio downloaded successfully: \(fileURL)")
            guard let urlString = url else { return }
            self.playSound(url: urlString)
        }
    }
    
    func playSound(url: URL) {
        player = AVPlayer(playerItem: AVPlayerItem(url: url))
        player?.play()
        player?.volume = 1.0
        isFinished = true
        print("Playing audio")
    }
}

