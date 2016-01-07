//
//  FBClient.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 04/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import Foundation
import UIKit
import FBSDKCoreKit
import FBSDKShareKit

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
    
    static func getCenterForButton(view:UIView, numParts: Int) -> CGPoint{
        if numParts <= 0 {
            let x_point = (view.bounds.maxX - view.bounds.minX)/2
            let y_point = (view.bounds.maxY - view.bounds.minY)/2;
            return CGPoint(x: x_point, y: y_point);
        }else{
            //Always get the vertical center from the view
            let x_point = (view.bounds.maxX - view.bounds.minX)/2;
            //Always get the horizaontal division for the section
            let y_point = view.bounds.maxY - ((view.bounds.maxY - view.bounds.minY)/CGFloat(numParts));
            //Return the place for section button
            return CGPoint(x: x_point, y: y_point);
        }
        
        
    }
    
    static func shareFavouriteCard(view:UIViewController,card:Card){
        //Prepare content for sharing
        let content: FBSDKShareLinkContent = FBSDKShareLinkContent();
        //Content title
        content.contentTitle = card.name;
        //Content description
        content.contentDescription = "I check this card as my favourite <3";
        //Content image
        content.imageURL = NSURL(string: card.img!);
        //Ready for share on facebook
        FBSDKShareDialog.showFromViewController(view, withContent: content, delegate: nil);
    }
    
    static func shareMoment(view:UIViewController, image:UIImage){
        let photo:FBSDKSharePhoto = FBSDKSharePhoto();
        photo.image = image;
        photo.userGenerated = true;
        let content: FBSDKSharePhotoContent = FBSDKSharePhotoContent();
        //Prepare content for sharing
        content.photos = [photo];
        //let content: FBSDKShareLinkContent = FBSDKShareLinkContent();
        //Ready for share on facebook
        //FBSDKShare
        FBSDKShareDialog.showFromViewController(view, withContent: content, delegate: nil);
    }
    
    
    
}