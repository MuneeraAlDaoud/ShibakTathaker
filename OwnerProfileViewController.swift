//
//  OwnerProfileViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 05/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class OwnerProfileViewController: UIViewController {

    var ownersList=[owners]()
    var db: OpaquePointer?
    
    
    @IBOutlet weak var Ousername: UILabel!
    @IBOutlet weak var Oorganization_name: UILabel!
    @IBOutlet weak var Ophone: UILabel!
    @IBOutlet weak var Oemail: UILabel!
    
    var username = ""
    var organization_name = ""
    var phone = 0
    var email = ""
    var OwnerUn2 = ""
    
    
    
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ShibakTathaker.sqlite")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        // Do any additional setup after loading the view.
        
        
        
        ownersList.removeAll()
        
        let queryString = "SELECT * FROM owners"
        
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            
            username = String(cString: sqlite3_column_text(stmt, 1))
            organization_name = String(cString: sqlite3_column_text(stmt, 3))
            //            let bio = String(cString: sqlite3_column_text(stmt, 7))
            //            let picture = String(cString: sqlite3_column_text(stmt, 8))
            phone = Int(sqlite3_column_int(stmt, 5))
            email = String(cString: sqlite3_column_text(stmt, 4))
            
            ownersList.append(owners(username: String(describing: username),email: String(describing: email),organization_name: String(describing: organization_name),phone: Int64(phone)))
            
            
            if(username == OwnerUn2)
            {break; }
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Ousername.text = username
        Oorganization_name.text = organization_name
        Ophone.text = String(phone)
        Oemail.text = email
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OwnerEditProfileHP" {
            let vc = segue.destination as! Owner_EditProfileViewController
            vc.OwnerUn3 = self.OwnerUn2 }
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
