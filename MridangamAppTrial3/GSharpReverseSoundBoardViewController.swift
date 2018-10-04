//
//  GSharpReverseSoundBoardViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/24/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let GSharpReverseSBsoundFiles = ["TheeG#Edited", "TaG#Edited", "NamG#Edited", "DheenG#Edited", "ChaapuG#Edited", "KeeTaThaKaDheenG#Edited", "ThaG#Edited", "ThomG#Edited"]
var GSharpReverseSBaudioPlayers = [AVAudioPlayer]()

class GSharpReverseSoundBoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GSharpReverseSBVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        GSharpReverseSBVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        for sound in GSharpReverseSBsoundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                GSharpReverseSBaudioPlayers.append(audioPlayer)
            }
            catch{
                GSharpReverseSBaudioPlayers.append(AVAudioPlayer())
                
            }
        }
    }
    
    
    @IBOutlet weak var GSharpReverseSBButton: UIButton!
    
    @IBAction func GSharpReverseSBButtonTapped(_ sender: UIButton) {
        let audioPlayer = GSharpReverseSBaudioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
            [audioPlayer.pause]
        }
        audioPlayer.currentTime = 0;
        audioPlayer.play()
    }
    
    @IBOutlet weak var GSharpReverseSBVolumeSlider: UISlider!
    
    @IBAction func GSharpReverseSBSliderChanged(_ sender: Any) {
      
        for i in 0..<GSharpReverseSBsoundFiles.count{
            GSharpReverseSBaudioPlayers[i].volume = GSharpReverseSBVolumeSlider.value
        
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
