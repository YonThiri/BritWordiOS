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

class AudioPlayer: NSObject, ObservableObject, AVAudioPlayerDelegate {
    var player: AVAudioPlayer?
    var playbackPosition: TimeInterval = 0 // Store current playback position
    var timer: Timer?
    
    @Published var isDownloaded = true
    @Published var isPlaying = false
    @Published var duration : TimeInterval = 0.0
    @Published var currentTime : TimeInterval = 0.0
    
    func playAudio(soundName: String, pathFromFirebase: String) {
        
        print("Current Queue \(Thread.current)")
        
        DispatchQueue.global(qos: .background).async { [self] in
            guard let url = cachedFileURL(soundName: soundName, pathFromFirebase: pathFromFirebase) else {
                print("Local file not found.")
                return
            }
            
            DispatchQueue.main.async {
                self.playSound(url: url)
            }
        }
        
       
    }
    
    func cachedFileURL(soundName: String, pathFromFirebase: String) -> URL? {
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
            
            downloadAudio(from: fileURL, soundName: soundName, pathFromFirebase: pathFromFirebase)
            return nil
        }
    }
    
    func downloadAudio(from fileURL: URL, soundName: String, pathFromFirebase: String) {
        
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
        do {
            isDownloaded = true
            player = try AVAudioPlayer(contentsOf: url)
            player?.delegate = self
            player?.prepareToPlay()
            player?.play()
            player?.currentTime = playbackPosition // Set playback position
            player?.volume = 1.0
            
            if player?.isPlaying == true {
                isPlaying = true
                //startTimer()
            }
            
            guard let player = player else { return }
            duration = player.duration
            print("Audio downloaded: \(isDownloaded) \(isPlaying) \(currentTime) \(duration)")
            
        } catch {
            print("Error initializing AVAudioPlayer: \(error.localizedDescription)")
        }
    }
    
    func updateProgress() {
        guard let player = player else { return }
        currentTime = player.currentTime
    }
    
    // MARK: - AVAudioPlayerDelegate
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
       if flag {
           // Audio playback finished successfully
           isPlaying = false
           //stopTimer()
       } else {
           // Audio playback finished with an error
           print("Audio playback finished with an error.")
       }
   }
    
   func pause() {
       if let player = player, player.isPlaying {
           playbackPosition = player.currentTime // Store current playback position
           player.pause()
           isPlaying = false
           //stopTimer()
       }
   }
    
    func seekToTime(time: Double) {
        if let player = player {
            player.currentTime = time
        }
    }
    
    
}

