//
//  Visitor_EditProfileViewController.swift
//  ShibakTathaker
//
//  Created by Asma Alreshoud on 10/22/18.
//  Copyright © 2018 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class Visitor_EditProfileViewController: UIViewController {

    
    var visitorsList=[visitors]()
    var db: OpaquePointer?
    
    @IBOutlet weak var errorE: UILabel!
    @IBOutlet weak var errorPW: UILabel!
    @IBOutlet weak var errorPN: UILabel!
    @IBOutlet weak var errorUN: UILabel!
    
    
    @IBOutlet weak var Vusername: UITextField!
    @IBOutlet weak var Vfname: UITextField!
    @IBOutlet weak var Vlname: UITextField!
    @IBOutlet weak var Vpassword: UITextField!
    @IBOutlet weak var Vphone: UITextField!
    @IBOutlet weak var Vemail: UITextField!
    @IBOutlet weak var Vage: UITextField!
    
    
    var username = ""
    var first_name = ""
    var last_name = ""
    var password=""
    var gender = ""
    var age = 0
    var phone = 0
    var email = ""
    
    var VisitorUn3 = ""
    
    
    
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
            password = String(cString: sqlite3_column_text(stmt, 2))
            first_name = String(cString: sqlite3_column_text(stmt, 3))
            last_name = String(cString: sqlite3_column_text(stmt, 4))
            age = Int(sqlite3_column_int(stmt, 5))
            gender = String(cString: sqlite3_column_text(stmt, 6))
            
            //            let bio = String(cString: sqlite3_column_text(stmt, 7))
            //            let picture = String(cString: sqlite3_column_text(stmt, 8))
            phone = Int(sqlite3_column_int(stmt, 8))
            email = String(cString: sqlite3_column_text(stmt, 7))
            
            visitorsList.append(visitors(username: String(describing: username),email: String(describing: email),first_name: String(describing: first_name), last_name: String(describing: last_name),gender: String(describing: gender),age: Int(age),phone: Int64(phone)))
        
            
            if(username == VisitorUn3)
            {break; }
            
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        Vusername.text = username
        Vfname.text = first_name
        Vlname.text = last_name
        Vpassword.text = password
        Vemail.text = email
        Vphone.text = String(phone)
        Vage.text = String(age)
        
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
        let Visitor_FirstName = Vfname.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_LastName = Vlname.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_username = Vusername.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_password = Vpassword.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_phone = Vphone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_email = Vemail.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Visitor_age = Vage.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        var Fflag = true
        var Lflag = true
        var Uflag = true
        var Pflag = true
        var Gflag = true
        var Eflag = true
        var Phflag = true
        var Aflag = true
        
        //validating that values are not empty
        if(Visitor_FirstName?.isEmpty)!{
            Vfname.layer.borderColor = UIColor.red.cgColor
            
            Vfname.layer.cornerRadius = 8.0
            Vfname.layer.masksToBounds = true
            Vfname.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Vfname.layer.borderWidth = 2.0
            
            Fflag = false
            
        }
        else {
            Vfname.layer.cornerRadius = 8.0
            Vfname.layer.masksToBounds = true
            Vfname.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Vfname.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_LastName?.isEmpty)!{
            Vlname.layer.borderColor = UIColor.red.cgColor
            
            Vlname.layer.cornerRadius = 8.0
            Vlname.layer.masksToBounds = true
            Vlname.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Vlname.layer.borderWidth = 2.0
            
            Lflag = false
        }
            
        else {
            Vlname.layer.cornerRadius = 8.0
            Vlname.layer.masksToBounds = true
            Vlname.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Vlname.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_username?.isEmpty)!{
            Vusername.layer.borderColor = UIColor.red.cgColor
            
            Vusername.layer.cornerRadius = 8.0
            Vusername.layer.masksToBounds = true
            Vusername.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Vusername.layer.borderWidth = 2.0
            
            Uflag = false
        }
        else {
            Vusername.layer.cornerRadius = 8.0
            Vusername.layer.masksToBounds = true
            Vusername.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Vusername.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_password?.isEmpty)!{
            Vpassword.layer.borderColor = UIColor.red.cgColor
            
            Vpassword.layer.cornerRadius = 8.0
            Vpassword.layer.masksToBounds = true
            Vpassword.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Vpassword.layer.borderWidth = 2.0
            
            Pflag = false
            
        }   else if((Visitor_password?.count)!<8) {
            errorPW.isHidden = false
            errorPW.text = "* password must be at least 8 characters"
            
            Pflag = false
        }
            
        else {
            errorPW.isHidden = true
            Vpassword.layer.cornerRadius = 8.0
            Vpassword.layer.masksToBounds = true
            Vpassword.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Vpassword.layer.borderWidth = 2.0
            
        }
        
        
        if(Visitor_phone?.isEmpty)!{
           Vphone.layer.borderColor = UIColor.red.cgColor
            
            Vphone.layer.cornerRadius = 8.0
            Vphone.layer.masksToBounds = true
            Vphone.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Vphone.layer.borderWidth = 2.0
            
            Phflag = false
            
        }   else if((Visitor_phone?.count)! != 9) {
            errorPN.isHidden = false
            errorPN.text = "* please enter a valid phone number"
            
            Phflag = false
            
        }
        else {
            errorPN.isHidden = true
            Vphone.layer.cornerRadius = 8.0
            Vphone.layer.masksToBounds = true
            Vphone.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Vphone.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_email?.isEmpty)!{
            Vemail.layer.borderColor = UIColor.red.cgColor
            
            Vemail.layer.cornerRadius = 8.0
            Vemail.layer.masksToBounds = true
            Vemail.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Vemail.layer.borderWidth = 2.0
            
            Eflag = false
            
        }   else if !((Visitor_email?.contains("@"))! && ((Visitor_email?.contains("."))!)) {
            errorE.isHidden = false
            errorE.text = "*  plaese enter a valid email"
            
            Eflag = false
            //            return
        }
            
        else {
            errorE.isHidden = true
            Vemail.layer.cornerRadius = 8.0
            Vemail.layer.masksToBounds = true
            Vemail.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Vemail.layer.borderWidth = 2.0
            
        }
        
        if(Visitor_age?.isEmpty)!{
           Vage.layer.borderColor = UIColor.red.cgColor
            
            Vage.layer.cornerRadius = 8.0
            Vage.layer.masksToBounds = true
            Vage.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            Vage.layer.borderWidth = 2.0
            
            Aflag = false
            
            
            
        }
        else {
            Vage.layer.cornerRadius = 8.0
            Vage.layer.masksToBounds = true
            Vage.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            Vage.layer.borderWidth = 2.0
            
        }
        
        if !(Fflag && Lflag && Uflag && Pflag && Eflag && Phflag && Gflag && Aflag)
        {return}
        
        Fflag = true
        Lflag = true
        Uflag = true
        Pflag = true
        Aflag = true
        Phflag = true
        Eflag = true
        Gflag = true

        
        //creating a statement
        var stmt1: OpaquePointer?
        
        //the insert query
        /*    let queryString1 = "Update owners set username = '"+Ousername+"', password = '"+Opassword+"', organization_name = '"+Oorganization_name+"', email = '"+Oemail+"', phone = "+Ophone+" where " */
        
        let queryString1 = "Update visitors set username = ?, password = ?, first_name = ? ,last_name = ? ,age = ?, email = ?, phone = ? where username = '"+username+"'"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        
        //preparing the query
        if sqlite3_prepare_v2(db, queryString1, -1, &stmt1, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt1, 1, Visitor_username, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding username: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt1, 2, Visitor_password, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding password: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt1, 3, Visitor_FirstName, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding Fisrt name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt1, 4, Visitor_LastName, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding last name: \(errmsg)")
            return
        }
        
        
        
        
        if sqlite3_bind_int(stmt1, 5, (Visitor_age! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding age: \(errmsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt1, 6, Visitor_email, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding email: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt1, 7, (Visitor_phone! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        
        
        
        //executing the query to insert values
        if sqlite3_step(stmt1) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting participant: \(errmsg)")
            errorUN.isHidden = false
            errorUN.text = "name already existes"
            return
        }
        
        //emptying the textfields
        
        Vfname.text=""
        Vlname.text=""
        Vusername.text=""
        Vpassword.text=""
        Vage.text=""
        Vemail.text=""
        Vphone.text=""
        
        
        
        
        //displaying a success message
        print("Visitor updated successfully")
        
        self.VisitorUn3 = Vusername.text!
        self.performSegue(withIdentifier: "VisitorEditProfileHP", sender: self)
        
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
