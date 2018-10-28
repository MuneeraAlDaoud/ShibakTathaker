//
//  ParticipantProfileViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 05/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class ParticipantProfileViewController: UIViewController {

    var participantsList=[participants]()
    var db: OpaquePointer?
    
    
    @IBOutlet weak var Pusername: UILabel!
    @IBOutlet weak var Porganization_name: UILabel!
    @IBOutlet weak var Pactivity_type: UILabel!
    @IBOutlet weak var Pemail: UILabel!
    @IBOutlet weak var Pphone: UILabel!
    
    
    var username = ""
    var organization_name = ""
    var activity_type = ""
    var phone = 0
    var email = ""
    
    var ParticipantUn2 = ""
    
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ShibakTathaker.sqlite")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        // Do any additional setup after loading the view.
        
        
        
        participantsList.removeAll()
        
        let queryString = "SELECT * FROM participants"
        
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            
            username = String(cString: sqlite3_column_text(stmt, 1))
            organization_name = String(cString: sqlite3_column_text(stmt, 3))
            activity_type = String(cString: sqlite3_column_text(stmt, 4))
            //            let bio = String(cString: sqlite3_column_text(stmt, 7))
            //            let picture = String(cString: sqlite3_column_text(stmt, 8))
            phone = Int(sqlite3_column_int(stmt, 6))
            email = String(cString: sqlite3_column_text(stmt, 5))
            
            participantsList.append(participants(username: String(describing: username),email: String(describing: email),organization_name: String(describing: organization_name), activity_type: String(describing: activity_type),phone: Int64(phone)))
            
            
            if(username == ParticipantUn2)
            {break; }
        }
        // Do any additional setup after loading the view.
        Pusername.text = username
        Porganization_name.text = organization_name
        Pactivity_type.text = activity_type
        Pemail.text = email
        Pphone.text = String(phone)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
   

}