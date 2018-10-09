//
//  owners.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 27/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import Foundation

class owners {
    
    var username: String?
    var email: String?
    var organization_name: String?
    //    var bio: String?
    //    var picture: String?
    var phone: Int64
    
    
    init(username: String?, email: String?,organization_name: String?,phone: Int64){
        
        self.username = username
        self.email=email
        self.organization_name=organization_name
        //            self.picture=picture
        //            self.bio=bio
        self.phone=phone
    }
    
    
    
}
