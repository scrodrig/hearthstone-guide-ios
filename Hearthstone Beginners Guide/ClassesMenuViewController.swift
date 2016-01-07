//
//  MenuViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 15/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class ClassesMenuViewController: UIViewController {
    
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var druidButton: UIButton!
    @IBOutlet weak var hunterButton: UIButton!
    @IBOutlet weak var mageButton: UIButton!
    @IBOutlet weak var paladinButton: UIButton!
    @IBOutlet weak var priestButton: UIButton!
    @IBOutlet weak var rogueButton: UIButton!
    @IBOutlet weak var shamanButton: UIButton!
    @IBOutlet weak var warlockButton: UIButton!
    @IBOutlet weak var warriorButton: UIButton!
    
    //Class selected
    
    var heroSelected:Heroes?;
    var heroPending:Heroes?;
    var sessionTask:NSURLSessionDataTask?;
    var cards: [Card]?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func searchByClass(sender: UIButton) {
        switch sender
        {
        case druidButton:
            heroSelected = Heroes.Druid;
        case hunterButton:
            heroSelected = Heroes.Hunter;
        case mageButton:
            heroSelected = Heroes.Mage;
        case paladinButton:
            heroSelected = Heroes.Paladin;
        case priestButton:
            heroSelected = Heroes.Priest;
        case rogueButton:
            heroSelected = Heroes.Rogue;
        case shamanButton:
            heroSelected = Heroes.Shaman;
        case warlockButton:
            heroSelected = Heroes.Warlock;
        case warriorButton:
            heroSelected = Heroes.Warrior;
        default:
            break;
        }
        if self.heroPending == heroSelected {
            return;
        }
        else {
            if let session = sessionTask{
                session.cancel();
                sessionTask = nil;
            }
            heroPending = heroSelected;
            ViewUtil.showLoadingScreen(self.view, object: nil);
        }

        sessionTask = SearchByClassClient.searchCardsByClass(self.heroSelected, location: currentLanguage!, completionHandler: { (cards, error) -> Void in
            self.heroPending = nil;
            self.cards = cards;
            if let c = self.cards{
                if c.count >= 0 {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                         ViewUtil.hideLoadingScreen(self.view);
                        self.performSegueWithIdentifier("classSelectedSegue", sender: nil);
                    })
                    
                }else{
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        ViewUtil.hideLoadingScreen(self.view);
                        ViewUtil.alertMessage(self, title: "Error", message: "There are not results for your search");
                    })
                }
            }
            
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cardTableViewController = segue.destinationViewController as? CardTableViewController {
            cardTableViewController.cards = cards;
        }
        
    }
}
