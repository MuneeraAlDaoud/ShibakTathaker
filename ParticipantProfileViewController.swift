//
//  ParticipantProfileViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 23/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

/*
class ParticipantProfileViewController: UIViewController,UITableViewDataSource ,UITableViewDelegate{
   
    
    @IBOutlet weak var ParticipantsTable: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    var participantsList=[participants]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ParticipantsTableViewController {
        let Cell = tableView.dequeueReusableCell (withIdentifier: "cell") as! ParticipantsTableViewController
        
        
        let participant: participants
        participant = participantsList[indexPath.row]
        
        Cell.Pusername.text = participant.username
        Cell.activity_type.text = participant.activity_type
        Cell.Porgname.text = participant.organization_name
        Cell.Pemail.text = participant.email
        Cell.Pphone.text = String(participant.phone)
        
        return Cell
        
    }
    
   
    

    var db: OpaquePointer?

    @IBOutlet weak var tableViewParticipants: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("ShibakTathaker.sqlite")
        
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
            
            let username = String(cString: sqlite3_column_text(stmt, 1))
            let organization_name = String(cString: sqlite3_column_text(stmt, 3))
            let activity_type = String(cString: sqlite3_column_text(stmt, 4))
//            let bio = String(cString: sqlite3_column_text(stmt, 7))
//            let picture = String(cString: sqlite3_column_text(stmt, 8))
            let phone = sqlite3_column_int(stmt, 6)
            let email = String(cString: sqlite3_column_text(stmt, 5))
            
            participantsList.append(participants(username: String(describing: username),email: String(describing: email),organization_name: String(describing: organization_name), activity_type: String(describing: activity_type),phone: Int64(phone)))
        }
      
  
      
   
        self.tableViewParticipants.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}*/
