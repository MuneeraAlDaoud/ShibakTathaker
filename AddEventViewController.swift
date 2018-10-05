//
//  AddEventViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 25/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class AddEventViewController: UIViewController {


    
    var db: OpaquePointer?
    
    @IBOutlet weak var textFieldEvent_pictureUrl: UITextField!
    @IBOutlet weak var textFieldEvent_name: UITextField!
    @IBOutlet weak var textFieldEvent_location: UITextField!
    @IBOutlet weak var textFieldEvent_day: UITextField! //date
    @IBOutlet weak var textFieldEvent_month: UITextField! //date
    @IBOutlet weak var textFieldEvent_year: UITextField! //date
    @IBOutlet weak var textFieldEvent_hour: UITextField!  //time
    @IBOutlet weak var textFieldEvent_minute: UITextField!  //time
    @IBOutlet weak var textFieldEvent_type: UITextField!
    // @IBOutlet weak var textFieldEvent_capacity: UITextField!
    //    @IBOutlet weak var textFieldEvent_description: UITextField!
    
    
    @IBAction func Add_Event(_ sender: Any) {
        //getting values from textfields
        let Event_picture = textFieldEvent_pictureUrl.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_name = textFieldEvent_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_location = textFieldEvent_location.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_day = textFieldEvent_day.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_month = textFieldEvent_month.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_year = textFieldEvent_year.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_hour = textFieldEvent_hour.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_minute = textFieldEvent_minute.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_type = textFieldEvent_type.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //validating that values are not empty
        if(Event_picture?.isEmpty)!{
            textFieldEvent_pictureUrl.layer.borderColor = UIColor.red.cgColor
            textFieldEvent_pictureUrl.layer.cornerRadius = 8.0
            textFieldEvent_pictureUrl.layer.masksToBounds = true
            textFieldEvent_pictureUrl.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_pictureUrl.layer.borderWidth = 2.0
            
        }
        else {
            textFieldEvent_pictureUrl.layer.cornerRadius = 8.0
            textFieldEvent_pictureUrl.layer.masksToBounds = true
            textFieldEvent_pictureUrl.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_pictureUrl.layer.borderWidth = 2.0
            
        }
        
        if(Event_name?.isEmpty)!{
            textFieldEvent_name.layer.borderColor = UIColor.red.cgColor
            textFieldEvent_name.layer.cornerRadius = 8.0
            textFieldEvent_name.layer.masksToBounds = true
            textFieldEvent_name.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_name.layer.borderWidth = 2.0
            
        }
        else {
            textFieldEvent_name.layer.cornerRadius = 8.0
            textFieldEvent_name.layer.masksToBounds = true
            textFieldEvent_name.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_name.layer.borderWidth = 2.0
            
        }
        
        if(Event_location?.isEmpty)!{
            textFieldEvent_location.layer.borderColor = UIColor.red.cgColor
            
            textFieldEvent_location.layer.cornerRadius = 8.0
            textFieldEvent_location.layer.masksToBounds = true
            textFieldEvent_location.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_location.layer.borderWidth = 2.0
            
        }
            
        else{
            
            textFieldEvent_location.layer.cornerRadius = 8.0
            textFieldEvent_location.layer.masksToBounds = true
            textFieldEvent_location.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_location.layer.borderWidth = 2.0
            
            
        }
        
        
        if(Event_day?.isEmpty)!{
            textFieldEvent_day.layer.borderColor = UIColor.red.cgColor
            
            textFieldEvent_day.layer.cornerRadius = 8.0
            textFieldEvent_day.layer.masksToBounds = true
            textFieldEvent_day.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_day.layer.borderWidth = 2.0
            
        }
            
        else {
            textFieldEvent_day.layer.cornerRadius = 8.0
            textFieldEvent_day.layer.masksToBounds = true
            textFieldEvent_day.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_day.layer.borderWidth = 2.0
            
            
         
            
            if (Int(Event_day.text)<=0 && Int(Event_day.text) < 31){
                //day can't be less than or aqual to 0 or greater than 31
            }
            
            
        }
        
        if(Event_month?.isEmpty)!{
            textFieldEvent_month.layer.borderColor = UIColor.red.cgColor
            
            textFieldEvent_month.layer.cornerRadius = 8.0
            textFieldEvent_month.layer.masksToBounds = true
            textFieldEvent_month.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_month.layer.borderWidth = 2.0
            
        }
        else {
            textFieldEvent_month.layer.cornerRadius = 8.0
            textFieldEvent_month.layer.masksToBounds = true
            textFieldEvent_month.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_month.layer.borderWidth = 2.0
            if (Event_month <= 0 && Event_month? < 12){
                //month can't be less or aqual than to 0 or greater than 12
            }
        }
        
        
        if(Event_year?.isEmpty)!{
            textFieldEvent_year.layer.borderColor = UIColor.red.cgColor
            
            textFieldEvent_year.layer.cornerRadius = 8.0
            textFieldEvent_year.layer.masksToBounds = true
            textFieldEvent_year.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_year.layer.borderWidth = 2.0
            
            
            return
        }
        else {
            textFieldEvent_year.layer.cornerRadius = 8.0
            textFieldEvent_year.layer.masksToBounds = true
            textFieldEvent_year.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_year.layer.borderWidth = 2.0
            
            if (Event_year <= 0){ //we could add the system date to cheack if passed or not :)
                //year can't be less or aqual than to 0 or greater than 12
            }
        }
        if(Event_hour?.isEmpty)!{
            textFieldEvent_hour.layer.borderColor = UIColor.red.cgColor
            textFieldEvent_hour.layer.cornerRadius = 8.0
            textFieldEvent_hour.layer.masksToBounds = true
            textFieldEvent_hour.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_hour.layer.borderWidth = 2.0
            
            
            return
        }
        else {
            textFieldEvent_hour.layer.cornerRadius = 8.0
            textFieldEvent_hour.layer.masksToBounds = true
            textFieldEvent_hour.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_hour.layer.borderWidth = 2.0
            if (Event_hour <= 0 && Event_hour? < 24){
                //hours can't be less or aqual than to 0 or greater than 24
            }
        }
        if(Event_minute?.isEmpty)!{
            textFieldEvent_minute.layer.borderColor = UIColor.red.cgColor
            textFieldEvent_minute.layer.cornerRadius = 8.0
            textFieldEvent_minute.layer.masksToBounds = true
            textFieldEvent_minute.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_minute.layer.borderWidth = 2.0
            
            
            return
        }
        else {
            textFieldEvent_minute.layer.cornerRadius = 8.0
            textFieldEvent_minute.layer.masksToBounds = true
            textFieldEvent_minute.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_minute.layer.borderWidth = 2.0
            if (Event_minute < 0 && Event_minute? < 60){
                //minutes can't be less than to 0 or greater than 60
            }
        }
        if(Event_type?.isEmpty)!{
            textFieldEvent_type.layer.borderColor = UIColor.red.cgColor
            textFieldEvent_type.layer.cornerRadius = 8.0
            textFieldEvent_type.layer.masksToBounds = true
            textFieldEvent_type.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_type.layer.borderWidth = 2.0
            
            
            return
        }
        else {
            textFieldEvent_type.layer.cornerRadius = 8.0
            textFieldEvent_type.layer.masksToBounds = true
            textFieldEvent_type.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_type.layer.borderWidth = 2.0
            
        }
        
        //creating a statement
        var stmt: OpaquePointer?
        
        //the insert query
        let queryString = "INSERT INTO events ( pictureUrl , name , location, day, month, year, hour, minute, type ) VALUES (?,?,?,?,?,?,?,?,?)"
        let SQLITE_TRANSIENT = unsafeBitCast(OpaquePointer(bitPattern: -1), to: sqlite3_destructor_type.self)
        //preparing the query
        if sqlite3_prepare_v2(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //binding the parameters
        if sqlite3_bind_text(stmt, 1, Event_picture, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding username: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, Event_name, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding password: \(errmsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt, 3, Event_location, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding organization name: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, (Event_day! as NSString).intValue, <#Int32#>) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding owner email: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 5, (Event_month! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 6, (Event_year! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 7, (Event_hour! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 8, (Event_minute! as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding phone: \(errmsg)")
            return
        }
        if sqlite3_bind_text(stmt, 9, Event_type, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding organization name: \(errmsg)")
            return
        }
        
        
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting owner: \(errmsg)")
            return
        }
        
        
        
        //emptying the textfields
        
        textFieldEvent_pictureUrl=""
        textFieldEvent_name=""
        textFieldEvent_location=""
        textFieldEvent_day=""
        textFieldEvent_month=""
        textFieldEvent_year=""
        textFieldEvent_hour=""
        textFieldEvent_minute=""
        textFieldEvent_type=""
        
        
        
        
        //displaying a success message
        print("Event added successfully")
        // self.performSegue(withIdentifier: "ownerRegistrationHP", sender: self)
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        
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
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS events (id INTEGER PRIMARY KEY AUTOINCREMENT, pictureUrl TEXT, name TEXT unique, location TEXT, day INT, month INT, year INT, hour INT , munite INT, type TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table: \(errmsg)")
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    
}
