//
//  SSLogIn.swift
//  SpanishScolars
//
//  Created by kjs on 1/13/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import UIKit

class SSLogInVC: SSBaseVC {
    
    
    @IBOutlet weak var imgLogin: UIImageView!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgLogin.image = UIImage(named: "spanish scholars logo 3")
        
        self.headerView.setHeaderStyle("Sign In", backBtn: true, exitBtn: false, shoppingBtn: false, cartBtn: false, homeBtn: false, mailBtn: false)
        self.headerView.titleImage.font = SSUtils.getAppFont(24)
        
    }
    
    override func headerBackBtnTapped(view: SSHeaderView!) {
        
        self.dismissVC()
    }
    
    
    @IBAction func SignInComplete(sender: UIButton) {
        
        if(!self.validateTextFieldAndShowMessage(UsernameTextField, errorMsg: "Please specify UserName") ||
            !self.validateTextFieldAndShowMessage(PasswordTextField, errorMsg:"Please specify Password"))
        {
            return;
        }

        self.showActivityIndicator()

        SSAPIHandler.sharedInstance.login(UsernameTextField.text!, password: PasswordTextField.text!){ (success, info)->() in
            
            self.hideActivityIndicator()
            
            if(!success as Bool){
                self.showAlert(info as! String)
            }
            else{
                self.performSegueWithIdentifier("signinTopicSelection", sender: sender)
            }

        }

    }
}
