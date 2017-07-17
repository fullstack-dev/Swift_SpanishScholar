//
//  SSRegister.swift
//  SpanishScolars
//
//  Created by kjs on 1/13/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import UIKit

class SSRegisterVC: SSBaseVC {
    
    @IBOutlet weak var usenameTextField: UITextField!
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var doublepasswordTextField: UITextField!
    
    @IBOutlet weak var imgLogin: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imgLogin.image = UIImage(named: "spanish scholars logo 3")
        
        self.headerView.setHeaderStyle("Register", backBtn: true, exitBtn: false, shoppingBtn: false, cartBtn: false, homeBtn: false, mailBtn: false)
        self.headerView.titleImage.font = SSUtils.getAppFont(24)
        
    }

    override func headerBackBtnTapped(view: SSHeaderView!) {
        
        self.dismissVC()
    }

    //signup(username: String, firstname: String, lastname: String, email: String, password: String, callback: ((Bool, AnyObject?) ->()))
    @IBAction func submitRegistration(sender: UIButton) {
        
        if(!self.validateTextFieldAndShowMessage(usenameTextField, errorMsg: "Please specify User name") ||
            !self.validateTextFieldAndShowMessage(firstnameTextField, errorMsg:"Please specify first name") ||
            !self.validateTextFieldAndShowMessage(lastnameTextField, errorMsg: "Please specify last name") ||
            !self.validateTextFieldAndShowMessage(emailTextField, errorMsg:"Please input email") ||
            !self.validateTextFieldAndShowMessage(passwordTextField, errorMsg: "Please input password") ||
            !self.validateTextFieldAndShowMessage(doublepasswordTextField, errorMsg: "Please confirm password") ||
            !self.validatePasswordLengthAndShowMessage(passwordTextField, errorMsg: "Password must be at the most 8 characters long"))
        {
            return;
        }

        if(passwordTextField.text != doublepasswordTextField.text) {
            showAlert("Password don't match. Please input again.")
            return
        }

        self.showActivityIndicator()
        
        SSAPIHandler.sharedInstance.signup(usenameTextField.text!, firstname: firstnameTextField.text!, lastname: lastnameTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, doublepassword: doublepasswordTextField.text!){ (success, info)->() in
            
            self.hideActivityIndicator()
            
            if(!success as Bool){
                self.showAlert(info as! String)
            }
            else{
                self.performSegueWithIdentifier("signupTopicSelection", sender: sender)
            }
            
        }

    }

}
