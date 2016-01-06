//
//  CustomSearchViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 06/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class CustomSearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    var cards: [Card]?;
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet weak var nameSearch: UITextField!
    @IBOutlet weak var classPicker: UIPickerView!
    @IBOutlet weak var rarityPicker: UIPickerView!
    @IBOutlet weak var attackSlider: UISlider!
    @IBOutlet weak var healthSlider: UISlider!
    @IBOutlet weak var costSlider: UISlider!
    @IBOutlet weak var durabilitySlider: UISlider!
    
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var durabilityLabel: UILabel!
    
    var attackChanged = false;
    var healthChanged = false;
    var costChanged = false;
    var durabilityChanged = false;
    
    let classData = [
        Heroes.getAsArrayValuesWithNone()
    ]
    
    let rarityData = [
        Rarity.getAsArrayValuesWithNone()
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
    
    
    @IBAction func attackChangedAction(sender: UISlider) {
        nameSearch.resignFirstResponder();
        attackChanged = true;
        let currentValue = Int(sender.value)
        attackLabel.text = "\(currentValue)";
    }
    
    @IBAction func healthChangedAction(sender: UISlider) {
        nameSearch.resignFirstResponder();
        healthChanged = true;
        let currentValue = Int(sender.value)
        healthLabel.text = "\(currentValue)";
    }
    
    @IBAction func costChangedAction(sender: UISlider) {
        nameSearch.resignFirstResponder();
        costChanged = true;
        let currentValue = Int(sender.value)
        costLabel.text = "\(currentValue)";
    }
    
    @IBAction func durabilityChangedAction(sender: UISlider) {
        nameSearch.resignFirstResponder();
        durabilityChanged = true;
        let currentValue = Int(sender.value)
        durabilityLabel.text = "\(currentValue)";
    }
    
    
    
    @IBAction func searchCustom(sender: AnyObject) {
        ViewUtil.showLoadingScreen(self.view, object: nil);
        SearchByCustomClient.searchCardsByParameters(self.attackChanged ? "\(Int(self.attackSlider.value))" : nil, health: self.healthChanged ? "\(Int(self.healthSlider.value))":nil, cost: self.costChanged ? "\(Int(self.costSlider.value))": nil, durability: self.durabilityChanged ? "\(Int(self.durabilitySlider.value))" : nil, location: Location.USAEnglish) { (cards, error) -> Void in
            //Go to the server
            self.cards = cards;
            if var c = self.cards{
                if c.count > 0 {
                    if(self.nameSearch.text != nil && self.nameSearch.text != ""){
                        c = c.filter({ (card:Card) -> Bool in
                            return card.name == self.nameSearch.text;
                        })
                    }
                    
                    if(self.classData[0][self.classPicker.selectedRowInComponent(0)] != Heroes.None.rawValue){
                        c = c.filter({ (card:Card) -> Bool in
                            return card.playerClass == self.classData[0][self.classPicker.selectedRowInComponent(0)];
                        })
                    }
                    
                    if(self.rarityData[0][self.rarityPicker.selectedRowInComponent(0)] != Rarity.None.rawValue){
                        c = c.filter({ (card:Card) -> Bool in
                            return card.rarity == self.rarityData[0][self.rarityPicker.selectedRowInComponent(0)];
                        })
                    }
                    
                    self.cards = c;
                    if let cards = self.cards{
                        if cards.count > 0 {
                            //Add operation to the main thread
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                //Excute the segue
                                self.performSegueWithIdentifier("searchByCustomSegue", sender: nil);
                                ViewUtil.hideLoadingScreen(self.view);
                            })
                        }else{
                            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                                ViewUtil.hideLoadingScreen(self.view);
                                ViewUtil.alertMessage(self, title: "Error", message: "There are not results for your search");
                            })
                        }
                    }
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
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if(self.classPicker == pickerView){
            return classData.count;
        }
        
        if(self.rarityPicker == pickerView){
            return rarityData.count;
        }
        
        return 0;
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(self.classPicker == pickerView){
            return classData[component].count;
        }
        
        if(self.rarityPicker == pickerView){
            return rarityData[component].count;
        }
        
        return 0;
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(self.classPicker == pickerView){
            return classData[component][row];
        }
        
        if(self.rarityPicker == pickerView){
            return rarityData[component][row];
        }
        return nil;
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nameSearch.resignFirstResponder();
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
