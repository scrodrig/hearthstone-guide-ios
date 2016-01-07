//
//  SearchByTypeViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 19/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class SearchByTypeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var typePicker: UIPickerView!;
    @IBOutlet weak var menuButton:UIBarButtonItem!
    var cards:[Card]?;
    let pickerData = [
        Type.getAsArrayValues()
    ]
    
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
    
    @IBAction func searchByTypeAction(sender: AnyObject) {
        ViewUtil.showLoadingScreen(self.view, object: nil);
        SearchByClient.searchCardsBy(Endpoints.HEARTHSTONE_API_CARDS_TYPE_ENDPOINT, query: pickerData[0][typePicker.selectedRowInComponent(0)], location: currentLanguage!) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            if let c = self.cards{
                if c.count > 0 {
                    //Add operation to the main thread
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        //Excute the segue
                        ViewUtil.hideLoadingScreen(self.view);
                        self.performSegueWithIdentifier("searchByTypeSegue", sender: nil);
                        
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
