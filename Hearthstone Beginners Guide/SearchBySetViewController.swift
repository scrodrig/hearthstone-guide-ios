//
//  SearchBySetViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 18/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class SearchBySetViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var setPicker: UIPickerView!
    var cards:[Card]?;
    let pickerData = [
        Sets.getAsArrayValues()
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setPicker.delegate = self;
        //setPicker.dataSource = self;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func searchCardsBySetAction(sender: AnyObject) {
    
        SearchByClient.searchCardsBy(Endpoints.HEARTHSTONE_API_CARDS_SET_ENDPOINT, query: pickerData[0][setPicker.selectedRowInComponent(0)], location: Location.USAEnglish) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            //Add operation to the main thread
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                //Excute the segue
                self.performSegueWithIdentifier("searchBySetSegue", sender: nil);
                
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
    
    //MARK -Delgates and DataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        updateLabel()
    }
    
    //MARK -Instance Methods
    func updateLabel(){
        //let size = pickerData[0][setPicker.selectedRowInComponent(0)]
        //let topping = pickerData[1][setPicker.selectedRowInComponent(1)]
        //pizzaLabel.text = "Pizza: " + size + " " + topping
        print(pickerData[0][setPicker.selectedRowInComponent(0)])
        
    }

    
}
