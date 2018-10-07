//
//  visitors.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 27/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import Foundation

class visitors{
    
    var username: String?
    var email: String?
    var first_name: String?
    var last_name: String?
    var gender: String?
    var age: Int
    //    var bio: String?
    //    var picture: String?
    var phone: Int64
    
    
    init(username: String?, email: String?,first_name: String?,last_name: String?,gender: String?,age: Int,phone: Int64){
        
        self.username = username
        self.email=email
        self.first_name = first_name
        self.last_name = last_name
        self.gender = gender
        self.age = age
        //            self.picture=picture
        //            self.bio=bio
        self.phone=phone
    }
    
    
}
    
    

