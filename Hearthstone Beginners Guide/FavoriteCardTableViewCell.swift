//
//  FavoriteCardTableViewCell.swift
//  Hearthstone Beginners Guide
//
//  Created by Schubert David Rodríguez on 05/01/16.
//  Copyright © 2016 Schubert David Rodríguez. All rights reserved.
//

import UIKit

class FavoriteCardTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardCost: UILabel!
    @IBOutlet weak var cardType: UILabel!
    @IBOutlet weak var cardText: UILabel!
    @IBOutlet weak var favouriteImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
