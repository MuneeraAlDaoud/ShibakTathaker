//
//  Participant_registration.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 11/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3


class Participant_registration: UIViewController {
    
    var db: OpaquePointer?
    var ParticipantRUn = ""

    @IBOutlet weak var textFieldParticipant_username: UITextField!
    @IBOutlet weak var textFieldOrganization_name: UITextField!
    @IBOutlet weak var textFieldParticipant_phone: UITextField!
    @IBOutlet weak var textFieldParticipant_email: UITextField!
    @IBOutlet weak var textFieldParticipant_activityType: UITextField!
    @IBOutlet weak var textFieldParticipant_password: UITextField!
    
    
    @IBAction func Participant_registration(_ sender: Any) {
        
        //getting values from textfields
        let Participant_username = textFieldParticipant_username.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Participant_password = textFieldParticipant_password.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Organization_name = textFieldOrganization_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Participant_email = textFieldParticipant_email.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Participant_phone = textFieldParticipant_phone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Participant_activityType = textFieldParticipant_activityType.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        //validating that values are not empty
        if(Participant_username?.isEmpty)!{
            textFieldParticipant_username.layer.borderColor = UIColor.red.cgColor
            
            textFieldParticipant_username.layer.cornerRadius = 8.0
            textFieldParticipant_username.layer.masksToBounds = true
            textFieldParticipant_username.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldParticipant_username.layer.borderWidth = 2.0
            
        }
        else {
            textFieldParticipant_username.layer.cornerRadius = 8.0
            textFieldParticipant_username.layer.masksToBounds = true
            textFieldParticipant_username.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldParticipant_username.layer.borderWidth = 2.0
            
        }
        
        if(Participant_password?.isEmpty)!{
            textFieldParticipant_password.layer.borderColor = UIColor.red.cgColor
            
            textFieldParticipant_password.layer.cornerRadius = 8.0
            textFieldParticipant_password.layer.masksToBounds = true
            textFieldParticipant_password.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldParticipant_password.layer.borderWidth = 2.0
            
        }
        
        else {
            textFieldParticipant_password.layer.cornerRadius = 8.0
            textFieldParticipant_password.layer.masksToBounds = true
            textFieldParticipant_password.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldParticipant_password.layer.borderWidth = 2.0
            
        }
        
        if(Organization_name?.isEmpty)!{
            textFieldOrganization_name.layer.borderColor = UIColor.red.cgColor
            
            textFieldOrganization_name.layer.cornerRadius = 8.0
            textFieldOrganization_name.layer.masksToBounds = true
            textFieldOrganization_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldOrganization_name.layer.borderWidth = 2.0
            
        }
        else {
            textFieldOrganization_name.layer.cornerRadius = 8.0
            textFieldOrganization_name.layer.masksToBounds = true
            textFieldOrganization_name.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldOrganization_name.layer.borderWidth = 2.0
            
        }
        
        if(Participant_email?.isEmpty)!{
            textFieldParticipant_email.layer.borderColor = UIColor.red.cgColor
            
            textFieldParticipant_email.layer.cornerRadius = 8.0
            textFieldParticipant_email.layer.masksToBounds = true
            textFieldParticipant_email.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldParticipant_email.layer.borderWidth = 2.0
           
        }
        
        else {
            textFieldParticipant_email.layer.cornerRadius = 8.0
            textFieldParticipant_email.layer.masksToBounds = true
            textFieldParticipant_email.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldParticipant_email.layer.borderWidth = 2.0
            
        }
        
        if(Participant_phone?.isEmpty)!{
            textFieldParticipant_phone.layer.borderColor = UIColor.red.cgColor
            
            textFieldParticipant_phone.layer.cornerRadius = 8.0
            textFieldParticipant_phone.layer.masksToBounds = true
            textFieldParticipant_phone.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldParticipant_phone.layer.borderWidth = 2.0
            
        }
        else {
            textFieldParticipant_phone.layer.cornerRadius = 8.0
            textFieldParticipant_phone.layer.masksToBounds = true
            textFieldParticipant_phone.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldParticipant_phone.layer.borderWidth = 2.0
            
        }
        
        if(Participant_activityType?.isEmpty)!{
            textFieldParticipant_activityType.layer.borderColor = UIColor.red.cgColor
            
            textFieldParticipant_activityType.layer.cornerRadius = 8.0
            textFieldParticipant_activityType.layer.masksToBounds = true
            textFieldParticipant_activityType.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldParticipant_activityType.layer.borderWidth = 2.0
            
            
            return
        }
        
        else {
            textFieldParticipant_activityType.layer.cornerRadius = 8.0
            textFieldParticipant_activityType.layer.masksToBounds = true
            textFieldParticipant_activityType.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldParticipant_activityType.layer.borderWidth = 2.0
            
        }
        

        
        //creating a statement
        var stmt: OpaquePointer?
        
        //the insert query
        let queryString = "INSERT INTO participants ( username, password  , organization_name, activity_type , email , phone ) VALUES (?,?,?,?,?,?)"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        //preparing the query
        if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 1, Participant_username, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding username: \(errmsg)")
            return
        }
      
        
        if sqlite3_bind_text(stmt, 2, Participant_password, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding password: \(errmsg)")
            return
        }
     
        if sqlite3_bind_text(stmt, 3, Organization_name, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding organization name: \(errmsg)")
            return
        }
      
        if sqlite3_bind_text(stmt, 4, Participant_activityType, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding participant activity type: \(errmsg)")
            return
        }
     
        if sqlite3_bind_text(stmt, 5, Participant_email, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding owner email: \(errmsg)")
            return
        }
    
      
        
        if sqlite3_bind_int(stmt, 6, (Participant_phone! as NSString).intValue) != SQLITE_OK{
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
        
        textFieldParticipant_username.text=""
        textFieldParticipant_password.text=""
        textFieldOrganization_name.text=""
        textFieldParticipant_activityType.text=""
        textFieldParticipant_email.text=""
        textFieldParticipant_phone.text=""
        
        
        
        
        //displaying a success message
        print("Participant registered successfully")
        
        self.ParticipantRUn = textFieldParticipant_username.text!
        self.performSegue(withIdentifier: "ParticipantRegisterHP", sender: self)
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ParticipantHPViewController
        vc.ParticipantUn1 = self.ParticipantRUn
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
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS participants (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT unique,password TEXT,organization_name TEXT, activity_type TEXT, email TEXT, phone BIGINT, bio TEXT, picture TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
       
    
        
        
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
