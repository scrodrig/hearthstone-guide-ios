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
    
    var cards: [Card]?;
    
    override func viewDidLoad() {
        super.viewDidLoad()        
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
        
        SearchByParameterClient.searchCardsByParameter(ParameterConstants.HEARTHSTONE_API_PARAMETER_ATTACK, query: "\(Int(self.attackSlider.value))", location: Location.USAEnglish) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            //Add operation to the main thread
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                //Excute the segue
                self.performSegueWithIdentifier("searchByAttackSegue", sender: nil);
                
            })

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
