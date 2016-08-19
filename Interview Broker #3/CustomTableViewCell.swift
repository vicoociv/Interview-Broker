//
//  CustomTableViewCell.swift
//  Interview Broker #3
//
//  Created by Victor Chien on 8/5/16.
//  Copyright © 2016 Victor Chien. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var availableCount: UILabel!
    
    @IBOutlet weak var hospitalPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
