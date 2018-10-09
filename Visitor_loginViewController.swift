//
//  Visitor_loginViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 13/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class Visitor_loginViewController: UIViewController {

    var db: OpaquePointer?
    
    @IBOutlet weak var textFieldVisitor_username: UITextField!
    @IBOutlet weak var textFieldVisitor_password: UITextField!
    
    var VisitorUn=""
    
    @IBAction func Visitor_login(_ sender: Any) {
        
        let Visitor_username = textFieldVisitor_username.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_password = textFieldVisitor_password.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //validating that values are not empty
        if(Visitor_username?.isEmpty)!{
            textFieldVisitor_username.layer.borderColor = UIColor.red.cgColor
            
            textFieldVisitor_username.layer.cornerRadius = 8.0
            textFieldVisitor_username.layer.masksToBounds = true
            textFieldVisitor_username.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldVisitor_username.layer.borderWidth = 2.0
            
            
            
        }
        else {
            textFieldVisitor_username.layer.cornerRadius = 8.0
            textFieldVisitor_username.layer.masksToBounds = true
            textFieldVisitor_username.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldVisitor_username.layer.borderWidth = 2.0
            
        }
        if(Visitor_password?.isEmpty)!{
            textFieldVisitor_password.layer.borderColor = UIColor.red.cgColor
            
            textFieldVisitor_password.layer.cornerRadius = 8.0
            textFieldVisitor_password.layer.masksToBounds = true
            textFieldVisitor_password.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldVisitor_password.layer.borderWidth = 2.0
            
            
            return
            
            
        }
        else {
            textFieldVisitor_password.layer.cornerRadius = 8.0
            textFieldVisitor_password.layer.masksToBounds = true
            textFieldVisitor_password.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldVisitor_password.layer.borderWidth = 2.0
            
        }
        
        //this is our select query
        let queryString = "SELECT * FROM visitors"
        
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
            
        
            
            if((Visitor_username==username) && (Visitor_password==password)) {flag=true}
            
            
            
            
            
            
        }
        
        //displaying a success message
        if(flag)
        {print("Logged-in succesfully")
            
            self.VisitorUn = textFieldVisitor_username.text!
            self.performSegue(withIdentifier: "VisitorLoginHP", sender: self)
            
        }
            
        else {print("sorry , username or password is wrong")}
        
        //emptying the textfields
        textFieldVisitor_username.text=""
        textFieldVisitor_password.text=""
        
        
        
    }//end visitor login
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VIsitorHPViewController
        vc.VisitorUn1 = self.VisitorUn 
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("ShibakTathaker.sqlite")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        // Do any additional setup after loading the view.
        
       
        
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
