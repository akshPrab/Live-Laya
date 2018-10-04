//
//  GSharpSoundBoardViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/24/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let GSharpSBsoundFiles = ["TheeG#Edited", "TaG#Edited", "NamG#Edited", "DheenG#Edited", "ChaapuG#Edited", "KeeTaThaKaDheenG#Edited", "ThaG#Edited", "ThomG#Edited"]

var GSharpSBaudioPlayers = [AVAudioPlayer]()

class GSharpSoundBoardViewController: UIViewController {
    @IBOutlet weak var backToTitleButton: UIButton!
    
    @IBOutlet var GSharpSoundBoardViewController: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        backToTitleButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 20)
        GSharpSBSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        GSharpSBSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        for sound in GSharpSBsoundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                GSharpSBaudioPlayers.append(audioPlayer)
            }
            catch{
                GSharpSBaudioPlayers.append(AVAudioPlayer())
                
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func GSharpSBButtonTapped(_ sender: UIButton) {
        let audioPlayer = GSharpSBaudioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
//            NSLog("Reset sound: %@", GSharpSBaudioPlayers);
            [audioPlayer.pause]
        }
        audioPlayer.currentTime = 0;
        audioPlayer.play()
    }
    
    @IBOutlet weak var GSharpSBSlider: UISlider!
    
    @IBAction func GSharpSBSliderChanged(_ sender: Any) {
       
//        GSharpSBaudioPlayers[0].volume = GSharpSBSlider.value
//        GSharpSBaudioPlayers[1].volume = GSharpSBSlider.value
//        GSharpSBaudioPlayers[2].volume = GSharpSBSlider.value
//        GSharpSBaudioPlayers[3].volume = GSharpSBSlider.value
//        GSharpSBaudioPlayers[4].volume = GSharpSBSlider.value
//        GSharpSBaudioPlayers[5].volume = GSharpSBSlider.value
//        GSharpSBaudioPlayers[6].volume = GSharpSBSlider.value
//        GSharpSBaudioPlayers[7].volume = GSharpSBSlider.value
        
        for i in 0..<8{
             GSharpSBaudioPlayers[i].volume = GSharpSBSlider.value
        }

    }
    
    
}
