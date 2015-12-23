//
//  DetailByMinionViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 22/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class DetailByMinionViewController: UIViewController {
    
    var card:Card?;
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var imgGoldenLabel: UIImageView!
    @IBOutlet weak var cardSetLabel: UILabel!
    @IBOutlet weak var rarityLabel: UILabel!
    @IBOutlet weak var rarityImage: UIImageView!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var attackLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var artistTitle: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var mechanicsLabel: UILabel!
    @IBOutlet weak var mechanicTitle: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        if let cardModel:Card = card {
            self.nameLabel.text = cardModel.name;
            self.cardSetLabel.text = cardModel.cardSet!;
            self.rarityLabel.text = cardModel.rarity!;
            if cardModel.rarity! == Rarity.Free.rawValue {
                self.rarityImage.image = nil;
                
            }else if cardModel.rarity! == Rarity.Common.rawValue {
                self.rarityImage.image = UIImage(named: "gem_common");
                
            }else if cardModel.rarity! == Rarity.Rare.rawValue {
                self.rarityImage.image = UIImage(named: "gem_rare");
                
            }else if cardModel.rarity! == Rarity.Epic.rawValue {
                self.rarityImage.image = UIImage(named: "gem_epic");
                
            }else if cardModel.rarity! == Rarity.Legendary.rawValue {
                self.rarityImage.image = UIImage(named: "gem_legendary");
                
            }
            self.costLabel.text = "\(cardModel.cost!)";
            self.attackLabel.text = "\(cardModel.attack!)";
            self.healthLabel.text = "\(cardModel.health!)";
            if(cardModel.artist != nil){
                self.artistLabel.text = cardModel.artist;
            }else{
                self.artistLabel.hidden = true;
                self.artistTitle.hidden = true;
            }
            
            if let text:String = cardModel.text {
                let attrStr = try! NSAttributedString(
                    data: text.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                    options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                    documentAttributes: nil);
                self.textLabel.attributedText = attrStr;
            }else{
                self.textLabel.text = nil;
            }
            
            
            if let mechanics = cardModel.mechanics {
                var valueMechanic:String="";
                if(mechanics.count > 0){
                    for(var i=0;i<mechanics.count;i++){
                        valueMechanic += mechanics[i].name;
                        if(mechanics.count - i > 1){
                            valueMechanic += ", ";
                        }
                    }
                    self.mechanicsLabel.text = valueMechanic;
                }else{
                    self.mechanicsLabel.hidden = true;
                    self.mechanicTitle.hidden = true;

                }
            }
         
            
            //UIImages
            
            if let imageString = cardModel.img {
                
                if let imageUrl = NSURL(string: imageString){
                    NSURLSession.sharedSession().dataTaskWithURL(imageUrl, completionHandler: { (data, response, error) -> Void in
                        if let d = data {
                            let image = UIImage(data: d)
                            NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
                                self.imgLabel.image = image;
                            })
                        }
                    }).resume()
                }
                
            }else{
                self.imgLabel.image = nil;
            }
            
//            
//            if let imageString = cardModel.imgGold {
//                
//                if let imageUrl = NSURL(string: imageString){
//                    NSURLSession.sharedSession().dataTaskWithURL(imageUrl, completionHandler: { (data, response, error) -> Void in
//                        if let d = data {
//                            let image = UIImage(data: d)
//                            NSOperationQueue.mainQueue().addOperationWithBlock({() -> Void in
//                                self.imgGoldenLabel.image = image;
//                            })
//                        }
//                    }).resume()
//                }
//                
//            }else{
//                self.imgGoldenLabel.image = nil;
//            }
            
            let strImg : String = cardModel.imgGold!;
            
            let url: NSURL = NSURL(string: strImg)!
            
            self.imgGoldenLabel.image = UIImage.animatedImageWithAnimatedGIFURL(url)
            
            
            
        }
        
        
        
        
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
    
}
