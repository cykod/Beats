//
//  SinglePlayerSong.swift
//  Beats
//
//  Created by Pascal Rettig on 4/1/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import Foundation

class SinglePlayerSong : NSObject {
    
    var songSounds:[SongSound] = []
    var timer:NSTimer?
    var playing:Bool = false
    
    var listener: SongListener?
    
    var currentIndex = 0
    

    func playSong() {
        if(!playing) {
            self.playing = true
            self.timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target:self, selector: Selector("runTimer"), userInfo: nil, repeats: true)
        }

    }

    func stopSong() {
        if(playing) {
            self.playing = false
            self.timer?.invalidate()
        }
    }
    
    func setListener(listener: SongListener) {
        self.listener = listener
    }
    
    func removeListener() {
        self.listener = nil
    }
    
    func numberOfSounds() -> Int {
        return songSounds.count
    }
    
    func soundAt(index: Int) -> SongSound? {
        return songSounds[index]
    }
    
    
    func runTimer() {
        let lastIndex = self.currentIndex
        self.currentIndex = ( currentIndex + 1 ) % 16
        
        NSLog(String(currentIndex))

        if let listener = listener {
            listener.beatTriggered(self, beatIndex: currentIndex, lastBeatIndex: lastIndex)
        }
        
        for songSound in songSounds {
            songSound.playBeat(currentIndex)
        }
    }
    
}