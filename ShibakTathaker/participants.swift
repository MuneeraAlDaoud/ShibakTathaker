//
//  participants.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 23/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import Foundation

class participants{
    

    var username: String?
    var email: String?
    var organization_name: String?
//    var bio: String?
//    var picture: String?
    var activity_type: String?
    var phone: Int64
    
        
        init(username: String?, email: String?,organization_name: String?,activity_type: String?,phone: Int64){
          
            self.username = username
            self.email=email
            self.activity_type=activity_type
            self.organization_name=organization_name
//            self.picture=picture
//            self.bio=bio
            self.phone=phone
        }
    
    
}
