//
//  MenuViewController.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 15/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var druidButton: UIButton!
    @IBOutlet weak var hunterButton: UIButton!
    @IBOutlet weak var mageButton: UIButton!
    @IBOutlet weak var paladinButton: UIButton!
    @IBOutlet weak var priestButton: UIButton!
    @IBOutlet weak var rogueButton: UIButton!
    @IBOutlet weak var shamanButton: UIButton!
    @IBOutlet weak var warlockButton: UIButton!
    @IBOutlet weak var warriorButton: UIButton!
    
    //Class selected
    
    var heroSelected:Heroes?;
    
    
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
    
    @IBAction func searchByClass(sender: UIButton) {
        if sender == druidButton {
            heroSelected = Heroes.Druid;
        }
        switch sender
        {
            
        case druidButton:
            heroSelected = Heroes.Druid;
        case hunterButton:
            heroSelected = Heroes.Hunter;
        case mageButton:
            heroSelected = Heroes.Mage;
        case paladinButton:
            heroSelected = Heroes.Paladin;
        case priestButton:
            heroSelected = Heroes.Priest;
        case rogueButton:
            heroSelected = Heroes.Rogue;
        case shamanButton:
            heroSelected = Heroes.Shaman;
        case warlockButton:
            heroSelected = Heroes.Warlock;
        case warriorButton:
            heroSelected = Heroes.Warrior;
        default:
            break;
        }
        print("Heroe " + (heroSelected?.rawValue)!);
        //performSegueWithIdentifier("heroCardSegue", sender: nil)
    }
    
    /*override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    let cards = [Card];
    //        if let coltrollador = segue.destinationViewController as? CardListVC {}
    
    }*/
}
