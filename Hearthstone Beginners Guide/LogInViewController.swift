//
//  LogInViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 05/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

var userLogged:User = User();

class LogInViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userCover: UIImageView!
    @IBOutlet weak var userPicture: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let loginButton = FBSDKLoginButton();
        loginButton.readPermissions = ["public_profile","email","user_friends"];
        loginButton.delegate = self;
        loginButton.center = self.view.center;
        self.view .addSubview(loginButton);
        self.showMenuIndex();
        if(FBSDKAccessToken.currentAccessToken() == nil){
            print("Not logged in");
        }else{
            print("Logged in");
            self.logUserData();
        }
        
        //self.fillLoginPanel();
    }
    
    func showMenuIndex (){
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.Portrait ,UIInterfaceOrientationMask.PortraitUpsideDown]
    }
    
    //MARK: - Facebook button
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if(error == nil){
            print("Login complete");
            self.logUserData();
            //self.fillLoginPanel();
        }else{
            print(error.localizedDescription);
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged out");
        self.unfillLoginPanel();
    }
    
    func logUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "me?fields=cover,picture,name,id", parameters: nil);
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error);
            }else{
                //FBClient.logUserData(result, error: error);
                
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
                                                self.fillLoginPanel();
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
                                            self.fillLoginPanel();
                                        })
                                    }
                                }).resume()
                            }
                            //self.view.
                        }else{
                            userLogged.cover = nil;
                        }
                    }
                    
                }
            }
        }
    }
    
    func fillLoginPanel(){
        self.userName.text = userLogged.name;
        if let imgCover = userLogged.cover {
            self.userCover.image = imgCover;
        }else{
            self.userCover.image = nil;
        }
        
        if let imgPicture = userLogged.picture {
            self.userPicture.image = imgPicture;
        }else{
            self.userPicture.image = UIImage(named: "guest");
        }
    }
    
    func unfillLoginPanel(){
        userLogged = User();
        self.fillLoginPanel();
    }
    
    //
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}