//
//  ParticipantTableViewCell.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 26/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit

class ParticipantTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var username: UILabel!
  
    @IBOutlet weak var email: UILabel!
  
    @IBOutlet weak var organization_name: UILabel!
    
    @IBOutlet weak var activity_type: UILabel!
    
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
