//
//  AppUtility.swift
//  Project.TodoList
//
//  Created by Waranyu Khongchai on 26/4/2565 BE.
//

import Foundation
import UIKit

class AppUtility: NSObject {
    
    static var styleAlert: UIAlertController.Style{
        
        if AppUtility.isIPad {
            return UIAlertController.Style(rawValue: 1)! //alert
        }
        
        return UIAlertController.Style(rawValue: 0)! //actionsheet
    }
    
    static func lockOrientation(_ orientation: UIInterfaceOrientationMask) {
        
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.orientationLock = orientation
        }
    }

    static func get60percentOfView(existingConstant:CGFloat) -> CGFloat {
        
        if isIPad {
            return UIScreen.main.bounds.width * 0.6
        }
        
        return existingConstant
    }
    
    static func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        return label.frame.height
    }
    
    static var isIPad: Bool {
        if UI_USER_INTERFACE_IDIOM() == .pad {
            return true
        }else{
            return false
        }
    }
}
