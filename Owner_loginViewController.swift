//
//  Owner_loginViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 13/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class Owner_loginViewController: UIViewController {
    
    var db: OpaquePointer?

    @IBOutlet weak var textFieldOwner_username: UITextField!
    @IBOutlet weak var textFieldOwner_password: UITextField!
    
    
    @IBAction func Owner_login(_ sender: Any) {
       
        let Owner_username = textFieldOwner_username.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Owner_password = textFieldOwner_password.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //validating that values are not empty
        if(Owner_username?.isEmpty)!{
            textFieldOwner_username.layer.borderColor = UIColor.red.cgColor
            
            textFieldOwner_username.layer.cornerRadius = 8.0
            textFieldOwner_username.layer.masksToBounds = true
            textFieldOwner_username.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldOwner_username.layer.borderWidth = 2.0
            
            
            
        }
        else {
            textFieldOwner_username.layer.cornerRadius = 8.0
            textFieldOwner_username.layer.masksToBounds = true
            textFieldOwner_username.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldOwner_username.layer.borderWidth = 2.0
            
        }
        
        if(Owner_password?.isEmpty)!{
            textFieldOwner_password.layer.borderColor = UIColor.red.cgColor
            
            textFieldOwner_password.layer.cornerRadius = 8.0
            textFieldOwner_password.layer.masksToBounds = true
            textFieldOwner_password.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldOwner_password.layer.borderWidth = 2.0
            
            
            return
            
            
        }
        else {
            textFieldOwner_password.layer.cornerRadius = 8.0
            textFieldOwner_password.layer.masksToBounds = true
            textFieldOwner_password.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldOwner_password.layer.borderWidth = 2.0
            
        }
        
        //this is our select query
        let queryString = "SELECT * FROM owners"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
            return
        }
        
        //traversing through all the records
        var flag = false
        while(sqlite3_step(stmt) == SQLITE_ROW && !flag){
            
            let username = String(cString: sqlite3_column_text(stmt, 1))
            let password = String(cString: sqlite3_column_text(stmt, 2))
            
            
            if((Owner_username==username) && (Owner_password==password)) {flag=true}
            
            
            
            
        
            
        }
        
        //displaying a success message
        if(flag)
        {print("Logged-in succesfully")
            self.performSegue(withIdentifier: "ownerLoginHP", sender: self)
        }
            
        else {print("sorry , username or password is wrong ")}
        
        //emptying the textfields
        textFieldOwner_username.text=""
        textFieldOwner_password.text=""
        
        }//end Owner_login
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("ShibakTathaker.sqlite")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
       
        
        
        // Do any additional setup after loading the view.
        
        
    }//end viewDidLoad
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}//end class
