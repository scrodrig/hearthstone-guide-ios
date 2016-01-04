//
//  FBClient.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 04/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import Foundation

class FBClient {
    static func logUserData(result: AnyObject?, error:NSError?) {
        if let userInfo = result as? NSDictionary{
            userLogged.id = userInfo.objectForKey("id") as? String;
            userLogged.name = userInfo.objectForKey("name") as! String;
            //Image
            if let pictureImg = userInfo.objectForKey("picture") as? NSDictionary{
                if let dataImg = pictureImg.objectForKey("data") as? NSDictionary {
                    if let imageString = dataImg.objectForKey("url") as? String {
                        if let imageUrl = NSURL(string: imageString){
                            NSURLSession.sharedSession().dataTaskWithURL(imageUrl, completionHandler: { (data, response, error) -> Void in
                                if let d = data {
                                    let image = UIImage(data: d)
                                    NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                                        userLogged.picture = image;
                                    })
                                }
                            }).resume()
                        }
                    }else{
                        userLogged.picture = nil;
                    }
                }
            }
            //Cover
            if let coverImg = userInfo.objectForKey("cover") as? NSDictionary{
                if let imageString = coverImg.objectForKey("source") as? String {
                    if let imageUrl = NSURL(string: imageString){
                        NSURLSession.sharedSession().dataTaskWithURL(imageUrl, completionHandler: { (data, response, error) -> Void in
                            if let d = data {
                                let image = UIImage(data: d)
                                NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                                    userLogged.cover = image;
                                })
                            }
                        }).resume()
                    }
                }else{
                    userLogged.picture = nil;
                }
            }
            
        }
    }
    
    
    
    
}