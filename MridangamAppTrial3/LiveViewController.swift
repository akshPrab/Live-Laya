//
//  LiveViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/19/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let liveSoundFiles = ["TheeEQModified", "TaEQModified", "ThaEQModified", "ThomEQModified", "NamEQModified", "DheenEQModified", "ChaapuEQModified", "KeeTaThaKaDheenEQModified"]

var liveAudioPlayers = [AVAudioPlayer]()

class LiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        liveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        liveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        for sound in liveSoundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                liveAudioPlayers.append(audioPlayer)
                
            }
            catch{
                liveAudioPlayers.append(AVAudioPlayer())
                
            }
        }
    }
        

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func liveButtonTapped(_ sender: UIButton) {
        let audioPlayer = liveAudioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
            [audioPlayer.pause]
        }
        
        audioPlayer.currentTime = 0;
        audioPlayer.play()
    }
    
    
    @IBOutlet weak var liveVolumeSlider: UISlider!
    @IBAction func liveVolumeChanged(_ sender: Any) {
        
//        liveAudioPlayers[0].volume = liveVolumeSlider.value
//        liveAudioPlayers[1].volume = liveVolumeSlider.value
//        liveAudioPlayers[2].volume = liveVolumeSlider.value
//        liveAudioPlayers[3].volume = liveVolumeSlider.value
//        liveAudioPlayers[4].volume = liveVolumeSlider.value
//        liveAudioPlayers[5].volume = liveVolumeSlider.value
//        liveAudioPlayers[6].volume = liveVolumeSlider.value
//        liveAudioPlayers[7].volume = liveVolumeSlider.value
        for i in 0..<8{
            liveAudioPlayers[i].volume = liveVolumeSlider.value
        }
    }
    
}

