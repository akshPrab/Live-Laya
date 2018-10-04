//
//  ReverseSoundboardViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/16/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let reverseSoundFiles = ["TheeEQModified", "TaEQModified", "ThaEQModified", "ThomEQModified", "NamEQModified", "DheenEQModified", "ChaapuEQModified", "KeeTaThaKaDheenEQModified"]

var reverseAudioPlayers = [AVAudioPlayer]()
class ReverseSoundboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reverseSoundBoardVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        reverseSoundBoardVolumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        
        for sound in reverseSoundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                reverseAudioPlayers.append(audioPlayer)
                
            }
            catch{
                audioPlayers.append(AVAudioPlayer())
                
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reverseButtonTapped(_ sender: UIButton) {

        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
            [audioPlayer.pause]
        }
        audioPlayer.currentTime = 0;
        audioPlayer.play()
    }
    
    
    @IBOutlet weak var reverseSoundBoardVolumeSlider: UISlider!
    
    @IBAction func reverseSoundBoardVolumeChanged(_ sender: Any) {
        
        
//        reverseAudioPlayers[0].volume = reverseSoundBoardVolumeSlider.value
//         reverseAudioPlayers[1].volume = reverseSoundBoardVolumeSlider.value
//         reverseAudioPlayers[2].volume = reverseSoundBoardVolumeSlider.value
//         reverseAudioPlayers[3].volume = reverseSoundBoardVolumeSlider.value
//         reverseAudioPlayers[4].volume = reverseSoundBoardVolumeSlider.value
//         reverseAudioPlayers[5].volume = reverseSoundBoardVolumeSlider.value
//         reverseAudioPlayers[6].volume = reverseSoundBoardVolumeSlider.value
//         reverseAudioPlayers[7].volume = reverseSoundBoardVolumeSlider.value
        for i in 0..<8{
            reverseAudioPlayers[i].volume = reverseSoundBoardVolumeSlider.value
        }
    }
    
    

}
