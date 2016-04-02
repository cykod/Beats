//
//  SinglePlayerSongController.swift
//  Beats
//
//  Created by Pascal Rettig on 4/1/16.
//  Copyright © 2016 Pascal Rettig. All rights reserved.
//

import UIKit

class SinglePlayerSongController: UITableViewController {
    
    let textCellIdentifier = "SoundCell"

    var song = SinglePlayerSong()
    
    var beepSounds: [BeepSound] = []

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        
        beepSounds.append(BeepSound(soundName: "random_sound"))
        beepSounds.append(BeepSound(soundName: "random_sound2"))
        beepSounds.append(BeepSound(soundName: "random_sound3"))
        
        song.songSounds.append(SongSound(beepSound: beepSounds[0]))
        song.songSounds.append(SongSound(beepSound: beepSounds[1]))
        song.songSounds.append(SongSound(beepSound: beepSounds[2]))

        
    }
    
    override func viewDidAppear(animated: Bool) {
        song.playSong()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        if (self.isMovingFromParentViewController()){
            song.stopSong()
        }
    }

    
    override func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return song.numberOfSounds()
    }
    
    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath) as UITableViewCell
            
            if let songSound = song.soundAt(indexPath.row) {
                cell.textLabel?.text = songSound.name()
            }
            return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "beatSegue" {
            let viewController:BeatsController = segue.destinationViewController as! BeatsController
            let indexPath = self.tableView.indexPathForSelectedRow
            viewController.songSound = song.soundAt(indexPath!.row)
            viewController.song = song
        }

    }
    
 
}
