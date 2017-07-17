//
//  SSUtils.swift
//  SpanishScolars
//
//  Created by kjs on 1/14/16.
//  Copyright © 2016 kkk. All rights reserved.
//

import Foundation
import UIKit

class SSUtils {
    
    static func getSSAquaColor() -> UIColor {
        return UIColor (red: 16/256.0, green: 185/256.0, blue: 215/256.0, alpha: 1)
    }
    
    static func getSSLightGrayColor() -> UIColor {
        return UIColor (red: 238/256.0, green: 238/256.0, blue: 238/256.0, alpha: 1)
    }
    
    static func getSSOrangeColor() -> UIColor {
        return UIColor (red: 242/256.0, green: 110/256.0, blue: 66/256.0, alpha: 1)
    }
    
    static func getAppFont(fontsize: CGFloat) -> UIFont! {
        return UIFont(name: "NeutrafaceText-Demi", size: fontsize);
    }
    
    static func getAppLightFont(fontsize: CGFloat) -> UIFont! {
        return UIFont(name: "NeutrafaceText-Light", size: fontsize);
    }
    
    static func getAppBookAltFont(fontsize: CGFloat) -> UIFont! {
        return UIFont(name: "NeutrafaceText-BookAlt", size: fontsize);
    }
    
    
    /*
    Define UIColor from hex value
    
    @param rgbValue - hex color value
    @param alpha - transparency level
    */
    static func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
    static func parseDateTime(dateStr: String!, format:String="yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ") -> NSDate! {
        if(dateStr == nil || dateStr.isEmpty) {
            return nil;
        }
        let dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = format
        return dateFmt.dateFromString(dateStr)!
    }
    
    static func printDateTime(date: NSDate!,format:String="yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ") -> String! {
        if(date == nil) {
            return "";
        }
        let dateFmt = NSDateFormatter()
        dateFmt.timeZone = NSTimeZone.defaultTimeZone()
        dateFmt.dateFormat = format
        return dateFmt.stringFromDate(date);
    }
    
    
    /*
    
    static func distanceFromCoordinate(fromLat: Double, fromLon: Double, toLat: Double, toLon: Double) -> Double {
        let locA = CLLocation(latitude: fromLat, longitude: fromLon);
        let locB = CLLocation(latitude: toLat, longitude: toLon);
        
        return locA.distanceFromLocation(locB);
    }
    
    */
    
    
    
    static func setStyledTextWithArrays(full: [String], fill: [String], fontSize: CGFloat = 17) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string:"")
        var idx = 0
        for(var item) in full {
            var found = false
            if(fill.indexOf(item) != nil) {
                found = true
            }
            
            let attrs = [NSFontAttributeName : SSUtils.getAppBookAltFont(fontSize),
                NSForegroundColorAttributeName: found ? SSUtils.getSSOrangeColor() : UIColor.blackColor(),
                "customTag" : item];
            item = item.uppercaseString
            let str = NSMutableAttributedString(string: idx == 0 ? "\(item)" : "    \(item)", attributes: attrs)
            if(idx % 3 == 2) {
                str.appendAttributedString(NSMutableAttributedString(string: "\n"))
            }
            attributedString.appendAttributedString(str)
            idx++
        }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 20
        paragraphStyle.alignment = NSTextAlignment.Center
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        return attributedString
    }
    
    static func handleTapOnAttributeText(sender: UIGestureRecognizer, txtContainer: UITextView) -> String? {
        // handling code
        var pos = sender.locationInView(txtContainer)
        pos = CGPointMake(pos.x - CGFloat(txtContainer.textContainerInset.left), pos.y - CGFloat(txtContainer.textContainerInset.top));
        let charIdx = txtContainer.layoutManager.characterIndexForPoint(pos, inTextContainer: txtContainer.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        if(charIdx < txtContainer.textStorage.length) {
            var range : NSRange = NSRange()
            let val = txtContainer.attributedText.attributesAtIndex(charIdx, effectiveRange: &range)
            if(range.length > 1) {
                let stringVal : String = val["customTag"] as! String
                return stringVal
            }
        }
        
        return nil;
    }
    
    
    
    static func setTextAccessoryView(text: UIView, target: AnyObject?, selector: Selector?) {
        let barButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: text, action: Selector("resignFirstResponder"))
        barButton.tintColor = UIColor.blackColor()
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 44))
        toolbar.barTintColor = UIColor(red: 236.0/255.0, green: 240.0/255.0, blue:241.0/255.0, alpha:1.0)
        let flexible = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: text, action: Selector("resignFirstResponder"))
        
        toolbar.items = [flexible, flexible, barButton]
        
        if let ctrl = text as? UITextView {
            ctrl.inputAccessoryView = toolbar
        }
        else if let ctrl = text as? UITextField {
            ctrl.inputAccessoryView = toolbar
        }
        
    }
    
    static func widthOfScreen() -> CGFloat{
        let screenRect = UIScreen.mainScreen().bounds
        return screenRect.size.width
    }
    
    static func heightOfScreen() -> CGFloat {
        let screenRect = UIScreen.mainScreen().bounds
        return screenRect.size.height
    }
}


extension String {
    func sha256() -> String {
        let data = self.dataUsingEncoding(NSUTF8StringEncoding)!
        var digest = [UInt8](count:Int(CC_SHA256_DIGEST_LENGTH), repeatedValue: 0)
        CC_SHA256(data.bytes, CC_LONG(data.length), &digest)
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joinWithSeparator("")
    }

    func ignoreCaseExist(key: String) -> Bool {
        if self.lowercaseString.rangeOfString(key.lowercaseString) != nil {
            return true
        }
        return false
    }
}



extension NSRange {
    func toRange(string: String) -> Range<String.Index> {
        let startIndex = string.startIndex.advancedBy(location)
        let endIndex = startIndex.advancedBy(length)
        return startIndex..<endIndex
    }
}
