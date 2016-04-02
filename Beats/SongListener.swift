//
//  SongListener.swift
//  Beats
//
//  Created by Pascal Rettig on 4/1/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import Foundation


protocol SongListener: class {
    func beatTriggered(song: SinglePlayerSong, beatIndex: Int, lastBeatIndex: Int)
}