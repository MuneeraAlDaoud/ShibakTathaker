//
//  VisitorTableViewCell.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 27/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit

class VisitorTableViewCell: UITableViewCell {

    
    @IBOutlet weak var first_name: UILabel!
    @IBOutlet weak var last_name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var phone: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var email: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
