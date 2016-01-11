//
//  DetailByCardBackViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 29/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class DetailByCardBackViewController: UIViewController {

    var cardback:Cardback?;
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var animatedImgLabel: UIImageView!
    @IBOutlet weak var howToGetLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let cardbackModel = cardback{                                    
            self.titleLabel.text = cardbackModel.name;
            self.howToGetLabel.text = cardbackModel.howToGet;
            self.descriptionLabel.text = cardbackModel.p_description;
                        
            if let imageString = cardbackModel.img {
                
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
            
            if let strImg : String = cardbackModel.imgAnimated {
                let url: NSURL = NSURL(string: strImg)!;
                self.animatedImgLabel.image = UIImage.animatedImageWithAnimatedGIFURL(url);
            }
            
            
            
        }
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

}
