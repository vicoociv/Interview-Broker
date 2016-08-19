//
//  DatesTableViewCell.swift
//  Interview Broker #3
//
//  Created by Victor Chien on 8/6/16.
//  Copyright © 2016 Victor Chien. All rights reserved.
//

import UIKit

class DatesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
