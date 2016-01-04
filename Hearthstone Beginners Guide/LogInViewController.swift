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
        
        //var loginButton = FBSDKLoginButton();
        
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
            self.showMenuIndex();
        }else{
            print(error.localizedDescription);
        }
    }
    
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged out");
    }
    
    func logUserData() {
        let graphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil);
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error);
            }else{
                userLogged.id = result.objectForKey("id") as? String;
                userLogged.name = result.objectForKey("name") as! String;
            }
        }
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