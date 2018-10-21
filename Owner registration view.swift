//
//  Owner registration view.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 11/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class Owner_registration_view: UIViewController, UITextFieldDelegate {
    
    var db: OpaquePointer?

    @IBOutlet weak var textFieldOwner_username: UITextField!
    @IBOutlet weak var textFieldOrganization_name: UITextField!
    @IBOutlet weak var textFieldOwner_phone: UITextField!
    @IBOutlet weak var textFieldOwner_email: UITextField!
    @IBOutlet weak var textFieldOwner_password: UITextField!
    
    var OwnerRUn = ""
    
    
    @IBOutlet weak var errorPW: UILabel!
    @IBOutlet weak var errorUN: UILabel!
    @IBOutlet weak var errorPN: UILabel!
    @IBOutlet weak var errorE: UILabel!
    
    @IBAction func Owner_registration(_ sender: Any) {
        //getting values from textfields
        let Owner_username = textFieldOwner_username.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Owner_password = textFieldOwner_password.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Organization_name = textFieldOrganization_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Owner_email = textFieldOwner_email.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Owner_phone = textFieldOwner_phone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let string_phone  = Owner_phone
        let num = Int(string_phone!)
        
        var Uflag = true
        var Pflag = true
        var Oflag = true
        var Eflag = true
        var Phflag = true
        
        //validating that values are not empty
        if(Owner_username?.isEmpty)!{
            textFieldOwner_username.layer.borderColor = UIColor.red.cgColor
            
            textFieldOwner_username.layer.cornerRadius = 8.0
            textFieldOwner_username.layer.masksToBounds = true
            textFieldOwner_username.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldOwner_username.layer.borderWidth = 2.0
           Uflag = false
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
             Pflag = false
        }
        
        else if((Owner_password?.count)!<8) {
            errorPW.isHidden = false
            errorPW.text = "* password must be at least 8 characters"
            
         Pflag = false
        }
        
        else{
            errorPW.isHidden = true
            textFieldOwner_password.layer.cornerRadius = 8.0
            textFieldOwner_password.layer.masksToBounds = true
            textFieldOwner_password.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldOwner_password.layer.borderWidth = 2.0
            
           
        }
        
        
      

        if(Owner_phone?.isEmpty)!{
            textFieldOwner_phone.layer.borderColor = UIColor.red.cgColor
            
            textFieldOwner_phone.layer.cornerRadius = 8.0
            textFieldOwner_phone.layer.masksToBounds = true
            textFieldOwner_phone.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldOwner_phone.layer.borderWidth = 2.0
         Phflag = false
          
            
        }else if(((Owner_phone?.count)! != 9) && (num != nil)) {
            errorPN.isHidden = false
            errorPN.text = "* please enter a valid phone number"
        
            Phflag = false
        }
            
        else {
            errorPN.isHidden = true
            textFieldOwner_phone.layer.cornerRadius = 8.0
            textFieldOwner_phone.layer.masksToBounds = true
            textFieldOwner_phone.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldOwner_phone.layer.borderWidth = 2.0
            
           
            
        }
        
        if(Owner_email?.isEmpty)!{
            textFieldOwner_email.layer.borderColor = UIColor.red.cgColor
            
            textFieldOwner_email.layer.cornerRadius = 8.0
            textFieldOwner_email.layer.masksToBounds = true
            textFieldOwner_email.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldOwner_email.layer.borderWidth = 2.0
            Eflag = false
        }
        else if !((Owner_email?.contains("@"))! && ((Owner_email?.contains("."))!)) {
            errorE.isHidden = false
            errorE.text = "*  plaese enter a valid email"
            
            Eflag = false
           
        }
        else {
            errorE.isHidden = true
            textFieldOwner_email.layer.cornerRadius = 8.0
            textFieldOwner_email.layer.masksToBounds = true
            textFieldOwner_email.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldOwner_email.layer.borderWidth = 2.0
            
           
            
        }
        
        if(Organization_name?.isEmpty)!{
            textFieldOrganization_name.layer.borderColor = UIColor.red.cgColor
            
            textFieldOrganization_name.layer.cornerRadius = 8.0
            textFieldOrganization_name.layer.masksToBounds = true
            textFieldOrganization_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldOrganization_name.layer.borderWidth = 2.0
            
            Oflag = false
            
        }
            
        else {
            textFieldOrganization_name.layer.cornerRadius = 8.0
            textFieldOrganization_name.layer.masksToBounds = true
            textFieldOrganization_name.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldOrganization_name.layer.borderWidth = 2.0
            
            
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
        var stmt: OpaquePointer?
     
        //the insert query
        let queryString = "INSERT INTO owners ( username, password, organization_name , email , phone ) VALUES (?,?,?,?,?)"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        //preparing the query
        if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 1, Owner_username, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding username: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, Owner_password, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding password: \(errmsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt, 3, Organization_name, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding organization name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, Owner_email, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding owner email: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 5, (Owner_phone! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        
        
        
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting owner: \(errmsg)")
            errorUN.isHidden = false
            errorUN.text = "name already existes"
            return
        }
        
      
        
        //emptying the textfields
        
        textFieldOwner_username.text=""
        textFieldOwner_password.text=""
        textFieldOrganization_name.text=""
        textFieldOwner_email.text=""
        textFieldOwner_phone.text=""
        
        
      
        
        //displaying a success message
        print("Owner registered successfully")
        self.OwnerRUn = textFieldOwner_username.text!
        self.performSegue(withIdentifier: "ownerRegistrationHP", sender: self)
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ownerRegistrationHP" {
        let vc = segue.destination as! OwnerHPViewController
            vc.OwnerUn1 = self.OwnerRUn }
    }
    
    
 override func viewDidLoad() {
      super.viewDidLoad()
    
    self.textFieldOwner_username.delegate = self
    self.textFieldOwner_password.delegate = self
    self.textFieldOrganization_name.delegate = self
    self.textFieldOwner_email.delegate = self
    self.textFieldOwner_phone.delegate = self
    
    errorE.isHidden = true
    errorPN.isHidden = true
    errorPW.isHidden = true
    errorUN.isHidden = true
    

   
    
   let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
     .appendingPathComponent("ShibakTathaker.sqlite")
    
    //opening the database
    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        print("error opening database")
    }

    
    
    //creating table
    if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS owners (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT unique,password TEXT, organization_name TEXT, email TEXT, phone BIGINT, bio TEXT, picture TEXT)", nil, nil, nil) != SQLITE_OK {
        let errmsg = String(cString: sqlite3_errmsg(db)!)
        print("error creating table: \(errmsg)")
    }
   
  

        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }//end viewDidLoad
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldOwner_username.resignFirstResponder()
        textFieldOwner_password.resignFirstResponder()
        textFieldOwner_phone.resignFirstResponder()
        textFieldOwner_email.resignFirstResponder()
        textFieldOrganization_name.resignFirstResponder()
    
        
        return true
    }
    




}
