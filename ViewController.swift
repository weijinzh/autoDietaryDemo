//
//  ViewController.swift
//  autoDietary
//
//  Created by Weijin on 3/10/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Properties
    
    
    @IBOutlet weak var RecordingButton: UIButton!
    @IBOutlet weak var StatsGraphButton: UIButton!
    @IBOutlet weak var ActivityButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        ActivityButton.setButtonGUI()
        StatsGraphButton.setButtonGUI()
        RecordingButton.setButtonGUI()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
}


extension UIButton{
    func setButtonGUI(){
        //self.backgroundColor=UIColor.blue
        self.layer.cornerRadius = self.frame.height/2.0
        self.setTitleColor(UIColor.white, for: .normal)
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.shadowColor = UIColor.red.cgColor
        self.layer.shadowRadius = 30
        self.layer.shadowOpacity = 0.8
        self.layer.borderWidth = 2.0;
    }
}
