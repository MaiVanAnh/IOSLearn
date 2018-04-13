//
//  ItemCell.swift
//  Homepwner
//
//  Created by Van Anh on 4/4/18.
//  Copyright © 2018 Van Anh. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell{

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    	
    @IBOutlet weak var serialNumberLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
}
