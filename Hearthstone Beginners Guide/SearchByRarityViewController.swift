//
//  SearchByRarityViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 19/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class SearchByRarityViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var rarityPicker: UIPickerView!
    
    var cards:[Card]?;
    let pickerData = [
        Rarity.getAsArrayValues()
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchCardsByRarity(sender: AnyObject) {
        
        SearchByClient.searchCardsBy(Endpoints.HEARTHSTONE_API_CARDS_QUALITY_ENDPOINT, query: pickerData[0][rarityPicker.selectedRowInComponent(0)], location: Location.USAEnglish) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            //Add operation to the main thread
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                //Excute the segue
                self.performSegueWithIdentifier("searchByRaritySegue", sender: nil);
                
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
    
    //MARK: -Delgates and DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }

}
