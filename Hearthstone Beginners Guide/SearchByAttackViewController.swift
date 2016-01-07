//
//  SearchByAttackViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 17/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class SearchByAttackViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var attackSlider: UISlider!
    @IBOutlet weak var menuButton:UIBarButtonItem!

    var cards: [Card]?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    @IBAction func attackSliderValueChanged(sender: UISlider) {
        
        let currentValue = Int(sender.value)
        
        valueLabel.text = "\(currentValue)";
        
    }
    
    @IBAction func SearchByAttackAction(sender: AnyObject) {
        ViewUtil.showLoadingScreen(self.view, object: nil);
        SearchByParameterClient.searchCardsByParameter(ParameterConstants.HEARTHSTONE_API_PARAMETER_ATTACK, query: "\(Int(self.attackSlider.value))", location: currentLanguage!) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            if let c = self.cards{
                if c.count > 0 {
                    //Add operation to the main thread
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        //Excute the segue
                        self.performSegueWithIdentifier("searchByAttackSegue", sender: nil);
                        ViewUtil.hideLoadingScreen(self.view);
                    })
                }else{
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        ViewUtil.hideLoadingScreen(self.view);
                        ViewUtil.alertMessage(self, title: "Error", message: "There are not results for your search");
                    })
                }
            }else{
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    ViewUtil.hideLoadingScreen(self.view);
                    ViewUtil.alertMessage(self, title: "Error", message: "There are not results for your search");
                })
            }

            
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cardTableViewController = segue.destinationViewController as? CardTableViewController {
            cardTableViewController.cards = cards;
        }
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
