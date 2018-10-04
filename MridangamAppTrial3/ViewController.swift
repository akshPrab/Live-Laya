//
//  ViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/5/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit
import AVFoundation

let soundFiles = ["TheeEQModified", "TaEQModified", "ThaEQModified", "ThomEQModified", "NamEQModified", "DheenEQModified", "ChaapuEQModified", "KeeTaThaKaDheenEQModified"]

var audioPlayers = [AVAudioPlayer]()
class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backToTitleButton.titleLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 20)
        volumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: [])
        volumeSlider.setThumbImage(UIImage(named: "MridangamLeftSideThumbOkay.JPG"), for: UIControlState.highlighted)
        

        
        for sound in soundFiles {
            do{
                let url = Bundle.main.url(forResource: sound, withExtension: "m4a")!
                let audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayers.append(audioPlayer)
            }
            catch{
                audioPlayers.append(AVAudioPlayer())
                
            }
        }
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func ButtonTapped(_ sender: UIButton) {
        let audioPlayer = audioPlayers[sender.tag]
        audioPlayer.play()
        if (audioPlayer.isPlaying) {
            //NSLog("Reset sound: %@", audioPlayers);
            [audioPlayer.pause]
        }
        audioPlayer.currentTime = 0;
        audioPlayer.play()
        
    }
    @IBOutlet weak var backToTitleButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet var DViewController: UIView!
    
    @IBAction func volumeChanged(_ sender: Any) {
        
//        audioPlayers[0].volume = volumeSlider.value
//        audioPlayers[1].volume = volumeSlider.value
//        audioPlayers[2].volume = volumeSlider.value
//        audioPlayers[3].volume = volumeSlider.value
//      $a$ audioPlayers[6].volume = volumeSlider.value
//        audioPlayers[7].volume = volumeSlider.value
        for i in 0..<8{
            audioPlayers[i].volume = volumeSlider.value
        }
    }
}

