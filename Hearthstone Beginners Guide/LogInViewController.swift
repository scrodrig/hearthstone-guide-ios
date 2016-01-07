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
import CoreLocation

var currentLanguage:Location?;

class LogInViewController: UIViewController, FBSDKLoginButtonDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
    
    //let locationManager = CLLocationManager();
    
    let locationManager = CLLocationManager()
    var currentLocation:CLLocation?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBSDKLoginButton();
        loginButton.readPermissions = ["public_profile","email","user_friends","read_stream"];
        loginButton.publishPermissions = ["publish_actions"];
        loginButton.delegate = self;
        loginButton.center = FBClient.getCenterForButton(self.view, numParts: 4);
        self.view.addSubview(loginButton);
        self.showMenuIndex();
        if(FBSDKAccessToken.currentAccessToken() == nil){
            print("Not logged in");
        }else{
            print("Logged in");
            self.logUserData();
        }
        favouriteCards = CardArchive().retreiveCards();
        self.fillLoginPanel();
        
        
        // For use in foreground
        //self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            locationManager.requestAlwaysAuthorization();
            locationManager.startUpdatingLocation()
            //currentLocation = locationManager.location;
            currentLocation = CLLocation();
            //Do something
            
        }
        currentLanguage = Location.USAEnglish; 
        
        
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
        let graphRequest = FBSDKGraphRequest(graphPath: "me?fields=name,id", parameters: nil);
        graphRequest.startWithCompletionHandler { (connection, result, error) -> Void in
            if error != nil {
                print(error);
            }else{
                if let userInfo = result as? NSDictionary{
                    userLogged.id = userInfo.objectForKey("id") as? String;
                    userLogged.name = userInfo.objectForKey("name") as! String;
                    if let id = userLogged.id {
                        let imgURLString = "https://graph.facebook.com/" + "\(id)" + "/picture?type=large" //type=small, normal, album, large, square"
                        let imgURL = NSURL(string: imgURLString)
                        let imageData = NSData(contentsOfURL: imgURL!)
                        userLogged.picture = UIImage(data: imageData!)
                    }
                    self.fillLoginPanel();
                }
            }
        }
        
        
    }
    
    func fillLoginPanel(){
        self.userName.text = userLogged.name;        
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
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}