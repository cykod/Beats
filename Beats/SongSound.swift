//
//  SongBeat.swift
//  Beats
//
//  Created by Pascal Rettig on 3/30/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import Foundation



class SongSound {
    
    var beats = [Beat](count: 16, repeatedValue: Beat())
    
    var beepSound: BeepSound?
    
    init(beepSound: BeepSound) {
        self.beepSound = beepSound
        for index in 0..<16 {
            beats[index] = Beat()
        }
    }
    
    func getBeat(index: Int) ->  Beat {
        return beats[index]
    }
    
    func name() -> String {
       return beepSound?.soundName ?? ""
    }
    
    func playBeat(index: Int) {
        if let beepSound = beepSound {
            let beat = beats[index]
            if(beat.active) {
                beepSound.play(beat.pitch)
            }
        }
    }
}