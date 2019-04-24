//
//  ReminderTableViewCell.swift
//  AutoDietaryApp
//
//  Created by Weijin on 3/3/19.
//  Copyright © 2019 Weijin. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {
    //MARK: Properties
    
  
    
    @IBOutlet weak var reminderItemLabel: UILabel!

    @IBOutlet weak var reminderTimeLabel: UILabel!
    
 
    @IBOutlet weak var categoryIcon: UIImageView!
    
    @IBOutlet weak var reminderImage: UIImageView!
    
    @IBOutlet weak var edgeImage: UIImageView!
    
    @IBOutlet weak var unitLabel: UILabel!
    
    @IBOutlet weak var descriptionStaticLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
