//
//  ReverseLiveViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let reverseLiveSoundFiles = ["TheeEQModified", "TaEQModified", "ThaEQModified", "ThomEQModified", "NamEQModified", "DheenEQModified", "ChaapuEQModified", "KeeTaThaKaDheenEQModified"]

var reverseLiveAudioPlayers = [AVAudioPlayer]()

class ReverseLiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reverseLiveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        reverseLiveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        for sound in liveSoundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                reverseLiveAudioPlayers.append(audioPlayer)
                
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
    
    @IBAction func reverseLiveButtonTapped(_ sender: UIButton) {
        let audioPlayer = reverseLiveAudioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
            NSLog("Reset sound: %@", reverseLiveAudioPlayers);
            [audioPlayer.pause]
        }
        
        audioPlayer.currentTime = 0;
        audioPlayer.play()
    }

    @IBOutlet weak var reverseLiveVolumeSlider: UISlider!
    @IBAction func reverseLiveVolumeChanged(_ sender: Any) {
       
//        reverseLiveAudioPlayers[0].volume = reverseLiveVolumeSlider.value
//        reverseLiveAudioPlayers[1].volume = reverseLiveVolumeSlider.value
//        reverseLiveAudioPlayers[2].volume = reverseLiveVolumeSlider.value
//        reverseLiveAudioPlayers[3].volume = reverseLiveVolumeSlider.value
//        reverseLiveAudioPlayers[4].volume = reverseLiveVolumeSlider.value
//        reverseLiveAudioPlayers[5].volume = reverseLiveVolumeSlider.value
//        reverseLiveAudioPlayers[6].volume = reverseLiveVolumeSlider.value
//        reverseLiveAudioPlayers[7].volume = reverseLiveVolumeSlider.value
        for i in 0..<8{
            reverseLiveAudioPlayers[i].volume = reverseLiveVolumeSlider.value
        }
    
    }
    
    
    
}
