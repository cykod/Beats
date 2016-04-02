//
//  BeepSound.swift
//  Beats
//
//  Created by Pascal Rettig on 4/1/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import Foundation
import AVFoundation


class BeepSound {
    let soundName: String
    let soundURL: NSURL
    
    let player: AVAudioPlayer
    
    init(soundName: String) {
        self.soundName = soundName
        self.soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundName, ofType: "wav")!)
        
        try! self.player = AVAudioPlayer(contentsOfURL: soundURL, fileTypeHint: "wav")
        player.prepareToPlay()
    }
    
    func play(pitch: Int) {
        player.play()
    }
    
}