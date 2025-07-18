//
//  AudioPlayerManager.swift
//  stoa
//
//  Created by Ziqa on 18/07/25.
//

import Foundation
import AVFoundation
import Combine

class AudioPlayerManager: ObservableObject {
    @Published var currentText: String = "Starting session..."
    @Published var isPlaying: Bool = false
    @Published var isMuted: Bool = false {
        didSet {
            player?.isMuted = isMuted
        }
    }
    
    private var player: AVPlayer?
    private var timeObserverToken: Any?
    private var steps: [Step] = []
    
    // Call when view appears
    func loadAndPlay(track: AudioTrack) {
        guard let url = Bundle.main.url(forResource: "track-\(track.trackID)", withExtension: "mp3") else {
            print("Error no audio file found.")
            self.currentText = "Audio file not found."
            return
        }
        
        self.steps = track.steps
        
        self.currentText = steps.first?.text ?? ""
        
        let playerItem = AVPlayerItem(url: url)
        self.player = AVPlayer(playerItem: playerItem)
        
        addPeriodicTimeObserver()
        
        player?.play()
        isPlaying = true
    }
    
    func togglePlayPause() {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
    
    private func addPeriodicTimeObserver() {
        let timeScale = CMTimeScale(NSEC_PER_SEC)
        // This fires every 0.1 seconds
        let time = CMTime(seconds: 0.1, preferredTimescale: timeScale)
        
        timeObserverToken = player?.addPeriodicTimeObserver(forInterval: time, queue: .main) { [weak self] currentTime in
            guard let self = self else { return }
            
            let currentSeconds = CMTimeGetSeconds(currentTime)
            
            // Find the last step whose time is less than or equal to the current time
            let newText = self.steps.last { $0.time <= currentSeconds }?.text
            
            if let newText = newText, self.currentText != newText {
                self.currentText = newText
            }
        }
    }
    
    // Call this when the view disappears to prevent memory leaks
    func cleanup() {
        player?.pause()
        if let token = timeObserverToken {
            player?.removeTimeObserver(token)
            timeObserverToken = nil
        }
        player = nil
    }
}
