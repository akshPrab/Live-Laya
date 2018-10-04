//
//  GSharpReverseLiveViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/24/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let GSharpReverseLivesoundFiles = ["TheeG#Edited", "TaG#Edited", "NamG#Edited", "DheenG#Edited", "ChaapuG#Edited", "KeeTaThaKaDheenG#Edited", "ThaG#Edited", "ThomG#Edited"]
var GSharpReverseLiveaudioPlayers = [AVAudioPlayer]()

class GSharpReverseLiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GSharpReverseLiveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        GSharpReverseLiveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        for sound in GSharpReverseLivesoundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                GSharpReverseLiveaudioPlayers.append(audioPlayer)
            }
            catch{
                GSharpReverseLiveaudioPlayers.append(AVAudioPlayer())
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func GSharpReverseLiveButtonTapped(_ sender: UIButton) {
        let audioPlayer = GSharpReverseLiveaudioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
            [audioPlayer.pause]
        }
        audioPlayer.currentTime = 0;
        audioPlayer.play()
        
    }
    
    @IBOutlet weak var GSharpReverseLiveVolumeSlider: UISlider!
    
    @IBAction func GSharpReverseLiveVolumeChanged(_ sender: UISlider) {
       
        for i in 0..<GSharpReverseLivesoundFiles.count{
            GSharpReverseLiveaudioPlayers[i].volume = GSharpReverseLiveVolumeSlider.value
            
        }
        
        
    }
}
