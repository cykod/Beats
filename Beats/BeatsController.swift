//
//  BeatsController.swift
//  Beats
//
//  Created by Pascal Rettig on 4/1/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import UIKit

class BeatsController: UIViewController, SongListener {

    var song: SinglePlayerSong?
    var songSound: SongSound?
    
    @IBOutlet var beatButtons: [BeatButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        song?.setListener(self)
        if let songSound = songSound {
            self.title = songSound.name()
            for index in 0..<16 {
                
                beatButtons[index].setBeat(songSound.getBeat(index))
            }
        }
    }
    
    func beatTriggered(song: SinglePlayerSong, beatIndex: Int, lastBeatIndex: Int) {
        beatButtons[lastBeatIndex].dehighlightButton()
        beatButtons[beatIndex].highlightButton()
    }
    
    override func viewWillDisappear(animated: Bool) {
        song?.removeListener()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
