//
//  GSharpLiveViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/24/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let GSharpLivesoundFiles = ["TheeG#Edited", "TaG#Edited", "NamG#Edited", "DheenG#Edited", "ChaapuG#Edited", "KeeTaThaKaDheenG#Edited", "ThaG#Edited", "ThomG#Edited"]
var GSharpLiveaudioPlayers = [AVAudioPlayer]()

class GSharpLiveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GSharpLiveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        GSharpLiveVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        for sound in GSharpLivesoundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                GSharpLiveaudioPlayers.append(audioPlayer)
            }
            catch{
                GSharpLiveaudioPlayers.append(AVAudioPlayer())
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //just experimenting to see if having a button outlet does or doesn't change anything
    @IBOutlet weak var GSharpLiveButton: UIButton!
    @IBAction func GSharpLiveButtonTapped(_ sender: UIButton) {
        let audioPlayer = GSharpLiveaudioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
            [audioPlayer.pause]
        }
        audioPlayer.currentTime = 0;
        audioPlayer.play()
    }
    
    @IBOutlet weak var GSharpLiveVolumeSlider: UISlider!
    
    @IBAction func GSharpLiveVolumeChanged(_ sender: UISlider) {
       
        for i in 0..<GSharpLivesoundFiles.count{
            GSharpLiveaudioPlayers[i].volume = GSharpLiveVolumeSlider.value
            
        }
        
    }
    
}
