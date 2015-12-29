//
//  ViewUtil.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 26/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

//
//  Utility.swift
//  Oculer
//
//  Created by Christian Bustamante on 12/8/15.
//  Copyright © 2015 Christian Bustamante. All rights reserved.
//

import Foundation
import UIKit

class ViewUtil
{
    
    static var visualEffect: UIVisualEffectView!
    static var loadingCircle: UIActivityIndicatorView!
    
    static func alertMessage(vc: UIViewController, title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        vc.presentViewController(alertController, animated: true, completion: nil)
    }
    
    static func showLoadingScreen(view:UIView, object:AnyObject?)
    {
        //Test
        if let anyObject = object{
            anyObject.resignFirstResponder();
        }
        //
        visualEffect = UIVisualEffectView(frame: view.frame)
        loadingCircle = UIActivityIndicatorView(frame: view.frame)
        
        visualEffect.addSubview(loadingCircle)
        
        view.addSubview(visualEffect)
        
        visualEffect.backgroundColor=UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.6)
        
        loadingCircle.startAnimating()
    }
    
    static func hideLoadingScreen(view:UIView)
    {
        visualEffect.hidden = true
        loadingCircle.stopAnimating()
        
        for subview in view.subviews{
            
            if(subview == visualEffect)
            {
                subview.removeFromSuperview()
            }
        }
        
        visualEffect = nil
        loadingCircle = nil
    }
    
}

