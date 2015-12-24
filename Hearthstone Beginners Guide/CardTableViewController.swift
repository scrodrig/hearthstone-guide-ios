//
//  CardTableViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 15/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class CardTableViewController: UITableViewController {
    
    
    var cards:[Card]?
    var cardSelected:Card?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cards?.count ?? 0;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cardCell", forIndexPath: indexPath) as! CardTableViewCell;
        let card = self.cards![indexPath.row];
        
        cell.cardName.text = card.name;
        cell.cardCost.text = String(card.cost!);
        cell.cardType.text = card.rarity!;
        if let text:String = card.text {
            let attrStr = try! NSAttributedString(
                data: text.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil);
            cell.cardText.attributedText = attrStr;
        }
        
        
        
        //cell.cardText.attributedText =
        
        if let imageString = card.img {
            
            if let imageUrl = NSURL(string: imageString){
                NSURLSession.sharedSession().dataTaskWithURL(imageUrl, completionHandler: { (data, response, error) -> Void in
                    if let d = data {
                        let image = UIImage(data: d)
                        NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                            cell.cardImage.image = image;
                        })
                    }
                }).resume()
            }
            
        }else{
            cell.cardImage.image = nil;
        }
        
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        cardSelected = self.cards![indexPath.row];
        if cardSelected != nil{
            if(cardSelected!.type == Type.Minion.rawValue || cardSelected!.type == Type.Hero.rawValue){
                self.performSegueWithIdentifier("cardDetailMinionSegue", sender: nil);
            }
            if(cardSelected!.type == Type.Weapon.rawValue){
                self.performSegueWithIdentifier("cardDetailWeaponSegue", sender: nil);
            }
            if(cardSelected!.type == Type.Spell.rawValue || cardSelected!.type == Type.Enchantment.rawValue){
                self.performSegueWithIdentifier("cardDetailSpellSegue", sender: nil);
            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cardDetailViewController = segue.destinationViewController as? DetailByMinionViewController {
            cardDetailViewController.card = self.cardSelected;
        }
        
        if let cardDetailViewController = segue.destinationViewController as? DetailByWeaponViewController {
            cardDetailViewController.card = self.cardSelected;
        }
        
        if let cardDetailViewController = segue.destinationViewController as? DetailBySpellViewController {
            cardDetailViewController.card = self.cardSelected;
        }
    }
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
