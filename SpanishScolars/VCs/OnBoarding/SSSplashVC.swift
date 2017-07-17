 //
//  SSSplashVC.swift
//  SpanishScolars
//
//  Created by kjs on 1/12/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import UIKit

class SSSplashVC: SSBaseVC {
    
    @IBOutlet weak var imgSSBack: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgSSBack.image = UIImage(named: "logo opening minds")
        
    }
    
    @IBAction func onBtnLoginTapped(sender: UIButton) {
        
    self.performSegueWithIdentifier("signinIdentifier", sender: sender)
        
    }
        
    @IBAction func onBtnRegisterTapped(sender: UIButton) {
        
    self.performSegueWithIdentifier("registerIdentifier", sender: sender)
    }
}
