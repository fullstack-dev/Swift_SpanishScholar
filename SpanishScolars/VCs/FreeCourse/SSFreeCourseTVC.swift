//
//  FreeCourseTVC.swift
//  SpanishScolars
//
//  Created by kjs on 1/17/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import UIKit

class SSFreeCourseTVC: SSBaseVC, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        self.headerView.setHeaderStyle("Name of Course", backBtn: true, exitBtn: false, shoppingBtn: false, cartBtn: false, homeBtn: true, mailBtn: true)
        self.headerView.titleImage.font = SSUtils.getAppFont(24)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func headerBackBtnTapped(view: SSHeaderView!) {
        self.dismissVC()
    }
    
    override func headerHomeBtnTapped(view: SSHeaderView!) {
        self.dismissVC()
    }
    
    override func headerMailBtnTappedTapped(view: SSHeaderView!) {
        self.dismissVC()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//lesson's count and cart's count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "lessoncell")
        
        cell.textLabel?.text = "Row #\(indexPath.row)"  //real lesson title
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
