//
//  beat.swift
//  Beats
//
//  Created by Pascal Rettig on 3/30/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import Foundation

class Beat {
    var active = false
    var pitch = 0
    
    init() {}
    init(active: Bool, pitch: Int) {
        self.active = active
        self.pitch = pitch
    }
}