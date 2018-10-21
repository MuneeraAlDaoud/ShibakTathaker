//
//  events.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 09/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//


import Foundation

class events {
    
    var name: String?
    var location: String?
    var type: String?
    var day: Int
    var month: Int
    var year: Int
    var hour: Int
    var munite: Int
    
    
    init(name: String?, location: String?,type: String?,day:Int,month:Int,year:Int,hour:Int,munite:Int){
        
        self.name = name
        self.location = location
        self.type = type
        self.day = day
        self.month = month
        self.year = year
        self.hour = day
        self.munite = munite
    }
    
    
    
}
