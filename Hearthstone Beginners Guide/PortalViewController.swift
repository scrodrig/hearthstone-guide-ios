//
//  PortalViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 04/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import UIKit

var userLogged:User = User();

var favouriteCards:[Card] = [Card]();

class PortalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func continueButton(sender: AnyObject) {
        self.performSegueWithIdentifier("menuPortalSegue", sender: nil);        
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
