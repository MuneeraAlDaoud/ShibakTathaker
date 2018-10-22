//
//  Owner_EditProfileViewController.swift
//  ShibakTathaker
//
//  Created by Asma Alreshoud on 10/21/18.
//  Copyright © 2018 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class Owner_EditProfileViewController: UIViewController {

        
        var ownersList=[owners]()
        var db: OpaquePointer?
        
    @IBOutlet weak var errorE: UILabel!
    @IBOutlet weak var errorPW: UILabel!
    @IBOutlet weak var errorPN: UILabel!
    @IBOutlet weak var errorUN: UILabel!
    
    
    @IBOutlet weak var Ousername: UITextField!
    @IBOutlet weak var Oorganization_name: UITextField!
    @IBOutlet weak var Opassword: UITextField!
    @IBOutlet weak var Ophone: UITextField!
        @IBOutlet weak var Oemail: UITextField!
        
        var username = ""
        var organization_name = ""
        var phone = 0
        var email = ""
        var password=""
        
        var OwnerUn3 = ""
        
        
        
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
                password = String(cString: sqlite3_column_text(stmt, 2))
                organization_name = String(cString: sqlite3_column_text(stmt, 3))
                //            let bio = String(cString: sqlite3_column_text(stmt, 7))
                //            let picture = String(cString: sqlite3_column_text(stmt, 8))
                phone = Int(sqlite3_column_int(stmt, 5))
                email = String(cString: sqlite3_column_text(stmt, 4))
                
                ownersList.append(owners(username: String(describing: username),email: String(describing: email),organization_name: String(describing: organization_name),phone: Int64(phone)))
                
                
                if(username == OwnerUn3)
                {break; }

            }
            Ousername.text = username
            Opassword.text = password
            Oorganization_name.text = organization_name
            Ophone.text = String(phone)
            Oemail.text = email
            
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
        
        let Owner_username = Ousername.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Owner_password = Opassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Organization_name = Oorganization_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Owner_email = Oemail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Owner_phone = Ophone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let string_phone  = Owner_phone
        let num = Int(string_phone!)
        
        var Uflag = true
        var Pflag = true
        var Oflag = true
        var Eflag = true
        var Phflag = true
        
        //validating that values are not empty
        if(Owner_username?.isEmpty)!{
            Ousername.layer.borderColor = UIColor.red.cgColor
            
            Ousername.layer.cornerRadius = 8.0
            Ousername.layer.masksToBounds = true
            Ousername.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Ousername.layer.borderWidth = 2.0
            Uflag = false
        }
        else {
            Ousername.layer.cornerRadius = 8.0
            Ousername.layer.masksToBounds = true
            Ousername.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Ousername.layer.borderWidth = 2.0
            
            
            
        }
        
        if(Owner_password?.isEmpty)!{
            Opassword.layer.borderColor = UIColor.red.cgColor
            
            Opassword.layer.cornerRadius = 8.0
            Opassword.layer.masksToBounds = true
            Opassword.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Opassword.layer.borderWidth = 2.0
            Pflag = false
        }
            
        else if((Owner_password?.count)!<8) {
            errorPW.isHidden = false
            errorPW.text = "* password must be at least 8 characters"
            
            Pflag = false
        }
            
        else{
            errorPW.isHidden = true
            Opassword.layer.cornerRadius = 8.0
            Opassword.layer.masksToBounds = true
            Opassword.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Opassword.layer.borderWidth = 2.0
            
            
        }
        
        
        
        
        if(Owner_phone?.isEmpty)!{
            Ophone.layer.borderColor = UIColor.red.cgColor
            
            Ophone.layer.cornerRadius = 8.0
            Ophone.layer.masksToBounds = true
            Ophone.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Ophone.layer.borderWidth = 2.0
            Phflag = false
            
            
        }else if(((Owner_phone?.count)! != 9) && (num != nil)) {
            errorPN.isHidden = false
            errorPN.text = "* please enter a valid phone number"
            
            Phflag = false
        }
            
        else {
            errorPN.isHidden = true
            Ophone.layer.cornerRadius = 8.0
            Ophone.layer.masksToBounds = true
            Ophone.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Ophone.layer.borderWidth = 2.0
            
            
            
        }
        
        if(Owner_email?.isEmpty)!{
            Oemail.layer.borderColor = UIColor.red.cgColor
            
            Oemail.layer.cornerRadius = 8.0
            Oemail.layer.masksToBounds = true
            Oemail.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Oemail.layer.borderWidth = 2.0
            Eflag = false
        }
        else if !((Owner_email?.contains("@"))! && ((Owner_email?.contains("."))!)) {
            errorE.isHidden = false
            errorE.text = "*  plaese enter a valid email"
            
            Eflag = false
            
        }
        else {
            errorE.isHidden = true
            Oemail.layer.cornerRadius = 8.0
            Oemail.layer.masksToBounds = true
            Oemail.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Oemail.layer.borderWidth = 2.0
            
            
            
        }
        
        if(Organization_name?.isEmpty)!{
            Oorganization_name.layer.borderColor = UIColor.red.cgColor
            
            Oorganization_name.layer.cornerRadius = 8.0
            Oorganization_name.layer.masksToBounds = true
            Oorganization_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Oorganization_name.layer.borderWidth = 2.0
            
            Oflag = false
            
        }
            
        else {
            Oorganization_name.layer.cornerRadius = 8.0
            Oorganization_name.layer.masksToBounds = true
            Oorganization_name.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Oorganization_name.layer.borderWidth = 2.0
            
            
        }
        
        if !(Uflag && Pflag && Oflag && Phflag && Eflag)
        {
            return
            
        }
        
        Uflag = true
        Pflag = true
        Oflag = true
        Phflag = true
        Eflag = true
        
       
        //creating a statement
        var stmt1: OpaquePointer?
        
        //the insert query
        /*    let queryString1 = "Update owners set username = '"+Ousername+"', password = '"+Opassword+"', organization_name = '"+Oorganization_name+"', email = '"+Oemail+"', phone = "+Ophone+" where " */
        
        let queryString1 = "Update owners set username = ?, password = ?, organization_name = ?, email = ?, phone = ? where username = '"+username+"'"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        //preparing the query
        if sqlite3_prepare_v2(db, queryString1, -1, &stmt1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt1, 1, Owner_username, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding username: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt1, 2, Owner_password, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding password: \(errmsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt1, 3, Organization_name, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding organization name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt1, 4, Owner_email, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding owner email: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt1, 5, (Owner_phone! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        
        
        
        //executing the query to insert values
        if sqlite3_step(stmt1) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting owner: \(errmsg)")
            errorUN.isHidden = false
            errorUN.text = "name already existes"
            return
        }
        
        
        
        
        

        
        
        
        
        //displaying a success message
        print("Owner updated successfully")
        self.OwnerUn3 = Ousername.text!
         self.performSegue(withIdentifier: "OwnerViewProfileHP", sender: self)
        
        //emptying the textfields
        
        Ousername.text=""
        Opassword.text=""
        Oorganization_name.text=""
        Oemail.text=""
        Ophone.text=""
        
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

