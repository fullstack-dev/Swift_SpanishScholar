//
//  SSCourseViewCell.swift
//  SpanishScolars
//
//  Created by kjs on 1/17/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import UIKit

class SSCourseViewCell: UITableViewCell {
    
    @IBOutlet weak var smallCourseCell: UIWebView!
    
    @IBOutlet weak var snallCourseTitle: UITextView!

    @IBOutlet weak var CellButton: UIButton!
    
    var temp : SSTopicSelectionTVC? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.snallCourseTitle.text = "Free Las Formas"    //lesson's title
        self.CellButton.backgroundColor = UIColor.greenColor()  //button's color
        self.CellButton.titleLabel!.text = "Go to Lesson"   //button's title
        
        self.backgroundColor = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 1.5)

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func CourseButtonFunction(sender: UIButton) {
        
       temp!.performSegueWithIdentifier("freecoursetvc", sender: sender) //freecourse
        
    }
}
