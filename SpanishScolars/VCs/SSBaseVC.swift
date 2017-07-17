//
//  ViewController.swift
//  SpanishScolars
//
//  Created by kjs on 1/12/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import UIKit

class SSBaseVC: UIViewController, SSHeaderViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validateTextFieldAndShowMessage(textField: UITextField, errorMsg: String) -> Bool {
        if(textField.text!.isEmpty) {
            self.showAlert(errorMsg)
            return false
        }
        return true
    }
    
    func validatePasswordLengthAndShowMessage(textField: UITextField, errorMsg: String) -> Bool {
        if(textField.text!.characters.count < 8) {
            self.showAlert(errorMsg)
            return false
        }
        return true
    }
    
    func showAlert(message: String, title : String = "SpanishScolar", buttonTitle: String = "OK") {
        
        var editedMessage = message
        
        /// "The Internet connect appears to be offline"
        if message.rangeOfString("Could not connect to the server", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start: message.startIndex, end: message.endIndex), locale: nil) != nil {
            editedMessage = "Please check your Internet connection."
        }
        
        if message.rangeOfString("The internet connection appears to be offline", options: NSStringCompareOptions.CaseInsensitiveSearch, range: Range<String.Index>(start: message.startIndex, end: message.endIndex), locale: nil) != nil {
            editedMessage = "Please check your Internet connection."
        }
        
        let refreshAlert = UIAlertController(title: title, message: editedMessage, preferredStyle: UIAlertControllerStyle.Alert)
        refreshAlert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction) in
            
        }))
        presentViewController(refreshAlert, animated: true, completion: nil)
    }
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    /*
    Show customized activity indicator,
    actually add activity indicator to passing view
    
    @param uiView - add activity indicator to this view
    */
    func showActivityIndicator() {
        let uiView = self.view
        
        container.frame = uiView.frame
        container.center = uiView.center
        container.backgroundColor = SSUtils.UIColorFromHex(0xffffff, alpha: 0.3)
        
        loadingView.frame = CGRectMake(0, 0, 80, 80)
        loadingView.center = uiView.center
        loadingView.backgroundColor = SSUtils.UIColorFromHex(0x444444, alpha: 0.7)
        loadingView.clipsToBounds = true
        loadingView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        activityIndicator.center = CGPointMake(loadingView.frame.size.width / 2, loadingView.frame.size.height / 2);
        
        loadingView.addSubview(activityIndicator)
        container.addSubview(loadingView)
        uiView.addSubview(container)
        activityIndicator.startAnimating()
    }
    /*
    Hide activity indicator
    Actually remove activity indicator from its super view
    
    @param uiView - remove activity indicator from this view
    */
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        container.removeFromSuperview()
    }

    func dismissVC() {
        if let navVC = self.navigationController {
            navVC.popViewControllerAnimated(true)
        }
        else {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    var headerView: SSHeaderView! = nil
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "headerViewEmb"){
            headerView = segue.destinationViewController as! SSHeaderView
            headerView.delegate = self
        }
    }
    
    func headerBackBtnTapped(view: SSHeaderView!){
        
    }
    func headerExitBtnTapped(view: SSHeaderView!){
        
    }
    func headerShoppingBtnTapped(view: SSHeaderView!){
        
    }
    func headerHomeBtnTapped(view: SSHeaderView!){
        
    }
    func headerAddToCartBtnTapped(view: SSHeaderView!){
        
    }
    func headerMailBtnTappedTapped(view: SSHeaderView!){
        
    }
}

