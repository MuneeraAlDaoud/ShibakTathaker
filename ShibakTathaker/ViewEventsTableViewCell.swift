//
//  ViewEventsTableViewCell.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 12/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit

class ViewEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var EventPic: UIImageView!
    @IBOutlet weak var Event_name: UILabel!
    @IBOutlet weak var Event_location: UILabel!
    @IBOutlet weak var Event_date: UILabel!
    @IBOutlet weak var Event_type: UILabel!
    @IBOutlet weak var Event_month: UILabel!
    @IBOutlet weak var Event_year: UILabel!
    
    @IBAction func bookATicket(_ sender: Any) {
        
//         self.performSegue(withIdentifier: "BookATicket", sender: self)
        
        
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
