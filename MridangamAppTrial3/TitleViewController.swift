//
//  TitleViewController.swift
//  MridangamAppTrial3
//
//  Created by akshay on 8/14/18.
//  Copyright © 2018 Akshay. All rights reserved.
//

import UIKit

class TitleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        enterButton.titleLabel?.font =  UIFont(name:"MarkerFelt-Thin" , size: 40)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBAction func enterTapped(_ sender: UIButton) {
    }
    
}
