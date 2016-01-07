//
//  CardbackCollectionTableViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 20/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class CardbackCollectionTableViewController: UITableViewController {

    var cardbacks:[Cardback]?;
    var cardbackSelected:Cardback?;
    
    @IBOutlet weak var menuButton:UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()        
        //The charge initial for cardbaks
        CardbackClient.searchCardbacks(currentLanguage!) { (cardbacks, error) -> Void in
            self.cardbacks = cardbacks;
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                self.tableView.reloadData();
            })
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cardbacks?.count ?? 0;
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cardbackCell", forIndexPath: indexPath) as! CardbackTableViewCell;
        let cardback = self.cardbacks![indexPath.row];
        
        cell.titleLabel.text = cardback.name;
        if let text:String = cardback.p_description {
            let attrStr = try! NSAttributedString(
                data: text.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil);
            cell.descriptionLabel.attributedText = attrStr;
        }
        
        
        
        //cell.cardText.attributedText =
        
        if let imageString = cardback.img {
            
            if let imageUrl = NSURL(string: imageString){
                NSURLSession.sharedSession().dataTaskWithURL(imageUrl, completionHandler: { (data, response, error) -> Void in
                    if let d = data {
                        let image = UIImage(data: d)
                        NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                            cell.carbackImage.image = image;
                            //self.tableView.reloadData();
                        })
                    }
                }).resume()
            }
            
        }else{
            cell.carbackImage.image = nil;
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        cardbackSelected = self.cardbacks![indexPath.row];
        if cardbackSelected != nil{
                self.performSegueWithIdentifier("detailByCardback", sender: nil);
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cardbackDetailViewController = segue.destinationViewController as? DetailByCardBackViewController {
            cardbackDetailViewController.cardback = self.cardbackSelected;
        }                
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
