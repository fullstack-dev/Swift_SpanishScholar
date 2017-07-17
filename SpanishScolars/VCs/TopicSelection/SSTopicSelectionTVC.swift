//
//  SSTopicSelection.swift
//  SpanishScolars
//
//  Created by kjs on 1/14/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import Foundation
import UIKit

class SSTopicSelectionTVC: SSBaseVC, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
        
        self.headerView.setHeaderStyle("Topic Selection", backBtn: false, exitBtn: true, shoppingBtn: true, cartBtn: false, homeBtn: false, mailBtn: false)
        self.headerView.titleImage.font = SSUtils.getAppFont(24)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
    
    }
    
    override func headerExitBtnTapped(view: SSHeaderView!) {
        
        self.dismissVC()
    }
    
    override func headerShoppingBtnTapped(view: SSHeaderView!) {
        
        self.dismissVC()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10//lesson's count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        

        var resCell : UITableViewCell
        
        if(indexPath.row % 2  == 0){
            resCell = tableView.dequeueReusableCellWithIdentifier("CourseHeaderViewCell", forIndexPath: indexPath)
        }
        else{
//            let row = indexPath.row - 1
            
            let cell = tableView.dequeueReusableCellWithIdentifier("CourseViewCell", forIndexPath: indexPath) as! SSCourseViewCell
            
            /*
            
            */
//            cell.smallCourseCell
/*            cell.smallTitleCell.text = "Free Las Formas"    //lesson's title
            cell.CellButton.backgroundColor = UIColor.greenColor()  //button's color
            cell.CellButton.titleLabel!.text = "Go to Lesson"   //button's title
            
            cell.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 1.5)
*/            
            cell.temp = self
            
            resCell = cell
        }
        
        resCell.separatorInset = UIEdgeInsetsMake(0, resCell.bounds.size.width, 0, 0)
        resCell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return resCell

    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return (indexPath.row % 2 == 0) ? 30 : 180;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    
}
