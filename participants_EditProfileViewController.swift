//
//  participants_EditProfileViewController.swift
//  ShibakTathaker
//
//  Created by Asma Alreshoud on 10/28/18.
//  Copyright © 2018 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class participants_EditProfileViewController: UIViewController {

    //
    //  Participant_EditViewController.swift
    //  ShibakTathaker
    //
    //  Created by Asma Alreshoud on 10/23/18.
    //  Copyright © 2018 Muneera AlDaoud. All rights reserved.
    //
        
        
        var participantsList=[participants]()
        var db: OpaquePointer?
        
        @IBOutlet weak var errorE: UILabel!
        @IBOutlet weak var errorPW: UILabel!
        @IBOutlet weak var errorPN: UILabel!
        @IBOutlet weak var errorUN: UILabel!
        
        
        @IBOutlet weak var Pusername: UITextField!
        @IBOutlet weak var Porganization_name: UITextField!
        @IBOutlet weak var Ppassword: UITextField!
        @IBOutlet weak var Pphone: UITextField!
        @IBOutlet weak var Pemail: UITextField!
        @IBOutlet weak var Pactivity_type: UITextField!
        
        
        var username = ""
        var organization_name = ""
        var password=""
        var activity_type = ""
        var phone = 0
        var email = ""
        
        var ParticipantUn3 = ""
        
        
        
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("ShibakTathaker.sqlite")
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            errorUN.isHidden = true
            errorPW.isHidden = true
            errorE.isHidden = true
            errorPN.isHidden = true
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
                password = String(cString: sqlite3_column_text(stmt, 2))
                organization_name = String(cString: sqlite3_column_text(stmt, 3))
                activity_type = String(cString: sqlite3_column_text(stmt, 4))
                //            let bio = String(cString: sqlite3_column_text(stmt, 7))
                //            let picture = String(cString: sqlite3_column_text(stmt, 8))
                phone = Int(sqlite3_column_int(stmt, 6))
                email = String(cString: sqlite3_column_text(stmt, 5))
                
                participantsList.append(participants(username: String(describing: username),email: String(describing: email),organization_name: String(describing: organization_name), activity_type: String(describing: activity_type),phone: Int64(phone)))
                
                
                if(username == ParticipantUn3)
                {break; }
            }
            // Do any additional setup after loading the view.
            Pusername.text = username
            Ppassword.text = password
            Porganization_name.text = organization_name
            Pactivity_type.text = activity_type
            Pemail.text = email
            Pphone.text = String(phone)
            
            sqlite3_reset(stmt)
            sqlite3_finalize(stmt)
            
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false
            
            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
            if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
                print("error opening database")}
        }
        
        @IBAction func update(_ sender: Any) {
            
            //getting values from textfields
            let Participant_username = Pusername.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Participant_password = Ppassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Organization_name = Porganization_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Participant_email = Pemail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Participant_phone = Pphone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let Participant_activityType = Pactivity_type.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            
            var Uflag = true
            var Pflag = true
            var Oflag = true
            var Eflag = true
            var Phflag = true
            var Aflag = true
            
            
            //validating that values are not empty
            if(Participant_username?.isEmpty)!{
                Pusername.layer.borderColor = UIColor.red.cgColor
                
                Pusername.layer.cornerRadius = 8.0
                Pusername.layer.masksToBounds = true
                Pusername.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
                Pusername.layer.borderWidth = 2.0
                Uflag = false
                
            }
            else {
                Pusername.layer.cornerRadius = 8.0
                Pusername.layer.masksToBounds = true
                Pusername.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
                Pusername.layer.borderWidth = 2.0
                
            }
            
            if(Participant_password?.isEmpty)!{
                Ppassword.layer.borderColor = UIColor.red.cgColor
                
                Ppassword.layer.cornerRadius = 8.0
                Ppassword.layer.masksToBounds = true
                Ppassword.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
                Ppassword.layer.borderWidth = 2.0
                
                Pflag = false
                
            }    else if((Participant_password?.count)!<8) {
                errorPW.isHidden = false
                errorPW.text = "* password must be at least 8 characters"
                
                Pflag = false
            }
                
            else {
                errorPW.isHidden = true
                Ppassword.layer.cornerRadius = 8.0
                Ppassword.layer.masksToBounds = true
                Ppassword.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
                Ppassword.layer.borderWidth = 2.0
                
            }
            
            if(Organization_name?.isEmpty)!{
                Porganization_name.layer.borderColor = UIColor.red.cgColor
                
                Porganization_name.layer.cornerRadius = 8.0
                Porganization_name.layer.masksToBounds = true
                Porganization_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
                Porganization_name.layer.borderWidth = 2.0
                
                Oflag = false
                
            }
            else {
                Porganization_name.layer.cornerRadius = 8.0
                Porganization_name.layer.masksToBounds = true
                Porganization_name.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
                Porganization_name.layer.borderWidth = 2.0
                
            }
            
            if(Participant_email?.isEmpty)!{
                Porganization_name.layer.borderColor = UIColor.red.cgColor
                
                Porganization_name.layer.cornerRadius = 8.0
                Porganization_name.layer.masksToBounds = true
                Porganization_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
                Porganization_name.layer.borderWidth = 2.0
                
                Eflag = false
                
                
            }   else if !((Participant_email?.contains("@"))! && ((Participant_email?.contains("."))!)) {
                errorE.isHidden = false
                errorE.text = "*  plaese enter a valid email"
                
                Eflag = false
            }
                
            else {
                errorE.isHidden = true
                Pemail.layer.cornerRadius = 8.0
                Pemail.layer.masksToBounds = true
                Pemail.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
                Pemail.layer.borderWidth = 2.0
                
            }
            
            if(Participant_phone?.isEmpty)!{
                Pemail.layer.borderColor = UIColor.red.cgColor
                
                Pemail.layer.cornerRadius = 8.0
                Pemail.layer.masksToBounds = true
                Pemail.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
                Pemail.layer.borderWidth = 2.0
                
                Phflag = false
                
            }   else if((Participant_phone?.count)! != 9) {
                errorPN.isHidden = false
                errorPN.text = "* please enter a valid phone number"
                
                Phflag = false
                
            }
            else {
                errorPN.isHidden = true
                Pphone.layer.cornerRadius = 8.0
                Pphone.layer.masksToBounds = true
                Pphone.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
                Pphone.layer.borderWidth = 2.0
                
            }
            
            if(Participant_activityType?.isEmpty)!{
                Pactivity_type.layer.borderColor = UIColor.red.cgColor
                
                Pactivity_type.layer.cornerRadius = 8.0
                Pactivity_type.layer.masksToBounds = true
                Pactivity_type.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
                Pactivity_type.layer.borderWidth = 2.0
                
                Aflag = false
                
            }
                
            else {
                Pactivity_type.layer.cornerRadius = 8.0
                Pactivity_type.layer.masksToBounds = true
                Pactivity_type.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
                Pactivity_type.layer.borderWidth = 2.0
                
            }
            
            if !(Uflag && Pflag && Phflag && Oflag && Eflag && Aflag)
            {
                return
                
            }
            
            Uflag = true
            Pflag = true
            Oflag = true
            Phflag = true
            Eflag = true
            Aflag = true
            
            
            //creating a statement
            var stmt1: OpaquePointer?
            
            //the insert query
            
            let queryString1 = "Update participants set username = ?, password = ?, organization_name = ? ,activity_type = ? , email = ?, phone = ? where username = '"+username+"'"
            let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
            
            //preparing the query
            if sqlite3_prepare_v2(db, queryString1, -1, &stmt1, nil) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("error preparing update: \(errmsg)")
                return
            }
            
            //binding the parameters
            if sqlite3_bind_text(stmt1, 1, Participant_username, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding username: \(errmsg)")
                return
            }
            
            
            if sqlite3_bind_text(stmt1, 2, Participant_password, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding password: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt1, 3, Organization_name, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding organization name: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt1, 4, Participant_activityType, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding participant activity type: \(errmsg)")
                return
            }
            
            if sqlite3_bind_text(stmt1, 5, Participant_email, -1, SQLITE_TRANSIENT) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding owner email: \(errmsg)")
                return
            }
            
            
            
            if sqlite3_bind_int(stmt1, 6, (Participant_phone! as NSString).intValue) != SQLITE_OK{
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure binding phone: \(errmsg)")
                return
            }
            
            
            //executing the query to insert values
            if sqlite3_step(stmt1) != SQLITE_DONE {
                let errmsg = String(cString: sqlite3_errmsg(db)!)
                print("failure updating participant: \(errmsg)")
                errorUN.isHidden = false
                errorUN.text = "name already existes"
                return
            }
            
            
            
            
            //displaying a success message
            print("Participant updated successfully")
            self.ParticipantUn3 = Pusername.text!
            self.performSegue(withIdentifier: "ParticipantEditProfileHP", sender: self)
            
            //emptying the textfields
            
            Pusername.text=""
            Ppassword.text=""
            Porganization_name.text=""
            Pactivity_type.text=""
            Pemail.text=""
            Pphone.text=""
            
            
            sqlite3_reset(stmt1)
            sqlite3_finalize(stmt1)
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

