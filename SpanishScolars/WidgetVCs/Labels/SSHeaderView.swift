//
//  SSHeaderView.swift
//  SpanishScolars
//
//  Created by kjs on 1/13/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import Foundation
import UIKit

protocol SSHeaderViewDelegate{
    func headerBackBtnTapped(view: SSHeaderView!)
    func headerExitBtnTapped(view: SSHeaderView!)
    func headerShoppingBtnTapped(view: SSHeaderView!)
    func headerHomeBtnTapped(view: SSHeaderView!)
    func headerAddToCartBtnTapped(view: SSHeaderView!)
    func headerMailBtnTappedTapped(view: SSHeaderView!)
}

class SSHeaderView: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var exitButton: UIButton!
    
    @IBOutlet weak var shoppingButton: UIButton!
    
    @IBOutlet weak var addtocardlargeButton: UIButton!
    
    @IBOutlet weak var homeButton: UIButton!
    
    @IBOutlet weak var mailButton: UIButton!
    
    @IBOutlet weak var titleImage: UILabel!
    
    var delegate: SSHeaderViewDelegate! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setHeaderStyle(title: String, backBtn: Bool, exitBtn: Bool, shoppingBtn: Bool, cartBtn: Bool, homeBtn: Bool, mailBtn: Bool){
        titleImage.text = title
        if(backBtn == false){
            backButton.hidden = true
        }else{
            backButton.hidden = false
        }
        
        if(exitBtn == false){
            exitButton.hidden = true
        }else{
            exitButton.hidden = false
        }
        
        if(shoppingBtn == false){
            shoppingButton.hidden = true
        }else{
            shoppingButton.hidden = false
        }
        
        if(cartBtn == false){
            addtocardlargeButton.hidden = true
        }else{
            addtocardlargeButton.hidden = false
        }
        
        if(homeBtn == false){
            homeButton.hidden = true
        }else{
            homeButton.hidden = false
        }
        
        if(mailBtn == false){
            mailButton.hidden = true
        }else{
            mailButton.hidden = false
        }
    }
    
    
    @IBAction func onBtnBackTapped(sender: UIButton) {
        if(delegate != nil){
            delegate.headerBackBtnTapped(self)
        }
    }
    
    @IBAction func onBtnExitTapped(sender: UIButton) {
        if(delegate != nil){
            delegate.headerExitBtnTapped(self)
        }
    }
    
    @IBAction func onBtnShoppingTapped(sender: UIButton) {
        if(delegate != nil){
            delegate.headerShoppingBtnTapped(self)
        }
    }
    
    @IBAction func onBtnAddtoCartTapped(sender: UIButton) {
        if(delegate != nil){
            delegate.headerAddToCartBtnTapped(self)
        }
    }
    
    @IBAction func onBtnHomeTapped(sender: UIButton) {
        if(delegate != nil){
            delegate.headerHomeBtnTapped(self)
        }
    }
    
    @IBAction func onBtnMailTapped(sender: UIButton) {
        if(delegate != nil){
            delegate.headerMailBtnTappedTapped(self)
        }
    }
}

