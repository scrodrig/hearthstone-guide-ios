//
//  SearchByCostViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 19/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class SearchByCostViewController: UIViewController {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var costSlider: UISlider!
    
    var cards:[Card]?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func costSliderValueChanged(sender: UISlider) {
    
        let currentValue = Int(sender.value);
        valueLabel.text = "\(currentValue)";
  
    }

    @IBAction func searchByCostAction(sender: UISlider) {        
        SearchByParameterClient.searchCardsByParameter(ParameterConstants.HEARTHSTONE_API_PARAMETER_COST, query: "\(Int(self.costSlider.value))", location: Location.USAEnglish) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            //Add operation to the main thread
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                //Excute the segue
                self.performSegueWithIdentifier("searchByCostSegue", sender: nil);
                
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
