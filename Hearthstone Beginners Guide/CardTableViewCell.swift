//
//  CardTableViewCell.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 15/12/15.
//  Copyright © 2015 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardCost: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
