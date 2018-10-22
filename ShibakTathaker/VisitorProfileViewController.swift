//
//  VisitorProfileViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 05/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class VisitorProfileViewController: UIViewController {

    var visitorsList=[visitors]()
    var db: OpaquePointer?
    
    
    @IBOutlet weak var Vusername: UILabel!
    @IBOutlet weak var Vname: UILabel!
    @IBOutlet weak var Vage: UILabel!
    @IBOutlet weak var Vphone: UILabel!
    @IBOutlet weak var Vemail: UILabel!
    
    var username = ""
    var first_name = ""
    var last_name = ""
    var gender = ""
    var age = 0
    var phone = 0
    var email = ""
    
    var VisitorUn2 = ""
    
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ShibakTathaker.sqlite")
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        // Do any additional setup after loading the view.
        
        
        
        visitorsList.removeAll()
        
        let queryString = "SELECT * FROM visitors"
        
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            
            username = String(cString: sqlite3_column_text(stmt, 1))
            first_name = String(cString: sqlite3_column_text(stmt, 3))
            last_name = String(cString: sqlite3_column_text(stmt, 4))
            age = Int(sqlite3_column_int(stmt, 5))
            gender = String(cString: sqlite3_column_text(stmt, 6))
            
            //            let bio = String(cString: sqlite3_column_text(stmt, 7))
            //            let picture = String(cString: sqlite3_column_text(stmt, 8))
            phone = Int(sqlite3_column_int(stmt, 8))
            email = String(cString: sqlite3_column_text(stmt, 7))
            
            visitorsList.append(visitors(username: String(describing: username),email: String(describing: email),first_name: String(describing: first_name), last_name: String(describing: last_name),gender: String(describing: gender),age: Int(age),phone: Int64(phone)))
            
            if(username == VisitorUn2)
            {break; }
            
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Vusername.text = username
        Vname.text = first_name+" "+last_name
        Vemail.text = email
        Vphone.text = String(phone)
        Vage.text = String(age)
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VisitorEditProfileHP" {
            let vc = segue.destination as! Visitor_EditProfileViewController
            vc.VisitorUn3 = self.VisitorUn2 }
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
