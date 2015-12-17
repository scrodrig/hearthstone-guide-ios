//
//  SearchByNameViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 16/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class SearchByNameViewController: UIViewController, UITextFieldDelegate {
    
    
    var cards: [Card]?;
    
    @IBOutlet weak var nameSearch: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        //Save integrity for querys
        guard let queryString:String = nameSearch.text else{
            return false;
        }
        SearchByClient.searchCardsBy(Endpoints.HEARTHSTONE_API_CARDS_SEARCH_NAME_ENDPOINT, query: queryString, location: Location.USAEnglish) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            //Add operation to the main thread
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                //Excute the segue
                self.performSegueWithIdentifier("searchByNameSegue", sender: nil);
               
            })
        }
        
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cardTableViewController = segue.destinationViewController as? CardTableViewController {
            cardTableViewController.cards = cards;
        }
        
    }
    
}
