//
//  ShrutiPickerViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/20/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class ShrutiPickerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        shrutiLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 30.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var shrutiLabel: UILabel!
  

    
}
