//
//  Visitor_registration.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 11/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class Visitor_registration: UIViewController {

    var db: OpaquePointer?
    var VisitorRUn = ""

    
    @IBOutlet weak var textFieldFirst_name: UITextField!
    @IBOutlet weak var textFieldLast_name: UITextField!
    @IBOutlet weak var textFieldVisitor_username: UITextField!
    @IBOutlet weak var textFieldGender: UITextField!
    @IBOutlet weak var textFieldVisitor_phone: UITextField!
    @IBOutlet weak var textFieldVisitor_email: UITextField!
    @IBOutlet weak var textFieldVisitor_age: UITextField!
    @IBOutlet weak var textFieldVisitor_password: UITextField!
    
    @IBAction func VisitorRegistration(_ sender: Any) {
        
        //getting values from textfields
        let Visitor_FirstName = textFieldFirst_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_LastName = textFieldLast_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_username = textFieldVisitor_username.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_password = textFieldVisitor_password.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_gender = textFieldGender.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_phone = textFieldVisitor_phone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_email = textFieldVisitor_email.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_age = textFieldVisitor_age.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //validating that values are not empty
        if(Visitor_FirstName?.isEmpty)!{
            textFieldFirst_name.layer.borderColor = UIColor.red.cgColor
            
            textFieldFirst_name.layer.cornerRadius = 8.0
            textFieldFirst_name.layer.masksToBounds = true
            textFieldFirst_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldFirst_name.layer.borderWidth = 2.0
            
        }
        else {
            textFieldFirst_name.layer.cornerRadius = 8.0
            textFieldFirst_name.layer.masksToBounds = true
            textFieldFirst_name.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldFirst_name.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_LastName?.isEmpty)!{
            textFieldLast_name.layer.borderColor = UIColor.red.cgColor
            
            textFieldLast_name.layer.cornerRadius = 8.0
            textFieldLast_name.layer.masksToBounds = true
            textFieldLast_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldLast_name.layer.borderWidth = 2.0
            
        }
        
        else {
            textFieldLast_name.layer.cornerRadius = 8.0
            textFieldLast_name.layer.masksToBounds = true
            textFieldLast_name.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldLast_name.layer.borderWidth = 2.0
            
        }
        
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
            
        }
        else {
            textFieldVisitor_password.layer.cornerRadius = 8.0
            textFieldVisitor_password.layer.masksToBounds = true
            textFieldVisitor_password.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldVisitor_password.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_gender?.isEmpty)!{
            textFieldGender.layer.borderColor = UIColor.red.cgColor
            
            textFieldGender.layer.cornerRadius = 8.0
            textFieldGender.layer.masksToBounds = true
            textFieldGender.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldGender.layer.borderWidth = 2.0
            
        }
        
        else {
            textFieldGender.layer.cornerRadius = 8.0
            textFieldGender.layer.masksToBounds = true
            textFieldGender.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldGender.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_phone?.isEmpty)!{
            textFieldVisitor_phone.layer.borderColor = UIColor.red.cgColor
            
            textFieldVisitor_phone.layer.cornerRadius = 8.0
            textFieldVisitor_phone.layer.masksToBounds = true
            textFieldVisitor_phone.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldVisitor_phone.layer.borderWidth = 2.0
            
        }
        else {
            textFieldVisitor_phone.layer.cornerRadius = 8.0
            textFieldVisitor_phone.layer.masksToBounds = true
            textFieldVisitor_phone.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldVisitor_phone.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_email?.isEmpty)!{
            textFieldVisitor_email.layer.borderColor = UIColor.red.cgColor
            
            textFieldVisitor_email.layer.cornerRadius = 8.0
            textFieldVisitor_email.layer.masksToBounds = true
            textFieldVisitor_email.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldVisitor_email.layer.borderWidth = 2.0
            
        }
        else {
            textFieldVisitor_email.layer.cornerRadius = 8.0
            textFieldVisitor_email.layer.masksToBounds = true
            textFieldVisitor_email.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldVisitor_email.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_age?.isEmpty)!{
            textFieldVisitor_age.layer.borderColor = UIColor.red.cgColor
            
            textFieldVisitor_age.layer.cornerRadius = 8.0
            textFieldVisitor_age.layer.masksToBounds = true
            textFieldVisitor_age.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldVisitor_age.layer.borderWidth = 2.0
            
            
            return
        }
        else {
            textFieldVisitor_age.layer.cornerRadius = 8.0
            textFieldVisitor_age.layer.masksToBounds = true
            textFieldVisitor_age.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldVisitor_age.layer.borderWidth = 2.0
            
        }
        
        
        
        //creating a statement
        var stmt: OpaquePointer?
        
        //the insert query
        let queryString = "INSERT INTO visitors ( username,password,first_name,last_name,age,gender, email , phone ) VALUES (?,?,?,?,?,?,?,?)"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)

        //preparing the query
        if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 1, Visitor_username, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding username: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, Visitor_password, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding password: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, Visitor_FirstName, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Fisrt name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, Visitor_LastName, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding last name: \(errmsg)")
            return
        }
        
        
        
        
        if sqlite3_bind_int(stmt, 5, (Visitor_age! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding age: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 6, Visitor_gender, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding last gender: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 7, Visitor_email, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding email: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 8, (Visitor_phone! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        
        
        
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting participant: \(errmsg)")
            return
        }
        
        //emptying the textfields
        
        textFieldFirst_name.text=""
        textFieldLast_name.text=""
        textFieldVisitor_username.text=""
        textFieldVisitor_password.text=""
        textFieldVisitor_age.text=""
        textFieldVisitor_email.text=""
        textFieldVisitor_phone.text=""
        textFieldGender.text=""
        
        
        
        
        //displaying a success message
        print("Visitor registered successfully")
        
        self.VisitorRUn = textFieldVisitor_username.text!
        self.performSegue(withIdentifier: "VisitorRegistrationHP", sender: self)
        
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! VIsitorHPViewController
        vc.VisitorUn1 = self.VisitorRUn
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("ShibakTathaker.sqlite")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        //creating table
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS visitors (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT unique,password TEXT,first_name TEXT, last_name TEXT, age INT, gender TEXT, email TEXT, phone BIGINT, bio TEXT, picture TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
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
