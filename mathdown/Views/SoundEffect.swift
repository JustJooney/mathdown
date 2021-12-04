//
//  SoundEffect.swift
//  mathdown
//
//  Created by Joon Kang on 12/2/21.
//

import Foundation
import AVKit

class SoundEffect {
    
    static let instance = SoundEffect()
    
    var player: AVAudioPlayer?
    
    enum soundOption: String {
        case count
        case countStart
        case rightanswer
        case wronganswer
    }
    
    func playSound(sound: soundOption) {
        
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch let error{
            print("Error playing sound \(error.localizedDescription)")
        }
    }
    
}
