//
//  Owner_AddEvent.swift
//  ShibakTathaker
//
//  Created by Asma Alreshoud on 10/7/18.
//  Copyright © 2018 Muneera AlDaoud. All rights reserved.
//

import Foundation

import UIKit
import SQLite3

class AddEventViewController: UIViewController, UITextFieldDelegate {
    
    
    
    var db: OpaquePointer?
    
    @IBOutlet weak var EventAdded: UILabel!
    @IBOutlet weak var textFieldEvent_pictureUrl: UITextField!
    @IBOutlet weak var textFieldEvent_name: UITextField!
    @IBOutlet weak var textFieldEvent_location: UITextField!
    @IBOutlet weak var Picker: UIDatePicker!
    @IBOutlet weak var textFieldEvent_type: UITextField!
    // @IBOutlet weak var textFieldEvent_capacity: UITextField!
    //    @IBOutlet weak var textFieldEvent_description: UITextField!
    
    
    @IBAction func Add_Event(_ sender: Any) {
        //getting values from textfields
        let Event_picture = textFieldEvent_pictureUrl.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_name = textFieldEvent_name.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_location = textFieldEvent_location.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let Event_day = textFieldEvent_day.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let Event_month = textFieldEvent_month.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let Event_year = textFieldEvent_year.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let Event_hour = textFieldEvent_hour.text?.trimmingCharacters(in: .whitespacesAndNewlines)
//        let Event_minute = textFieldEvent_minute.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_type = textFieldEvent_type.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Event_dateFull = DateFormatter.localizedString(from: Picker.date, dateStyle: DateFormatter.Style.full , timeStyle: DateFormatter.Style.short)
        
        let day = DateFormatter ()
        day.dateFormat = "dd"
        let Event_day = day.string(from: Picker.date)
        print (Event_day)
        
        let month = DateFormatter ()
        month.dateFormat = "MM"
        let Event_month = day.string(from: Picker.date)
        print (Event_month)
        
        let year = DateFormatter ()
        year.dateFormat = "yyyy"
        let Event_year = year.string(from: Picker.date)
        print (Event_year)

        let hours = DateFormatter ()
        hours.dateFormat = "hh"
        let Event_hour = hours.string(from: Picker.date)
        print (Event_hour)

        let minutes = DateFormatter ()
        minutes.dateFormat = "mm"
        let Event_minute = minutes.string(from: Picker.date)
        print (Event_minute)

        
    
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
        
        
      /*  if(Event_day?.isEmpty)!{
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
            
            
            let Event_dayInt = (Event_day as! NSString).integerValue
            
            
            if (Event_dayInt <= 0){
                errorLabel?.isHidden = false
                errorLabel?.text = "day should be greater than 0"
            } else { errorLabel?.isHidden = true }
            if (Event_dayInt > 31){
                errorLabel?.isHidden = false
                errorLabel?.text = "day should be less than 31"
            } else { errorLabel?.isHidden = true }
            
        }
        
        
        if ((Event_month?.isEmpty)!) {
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
            let Event_monthInt = (Event_month as! NSString).integerValue
            if ( Event_monthInt <= 0){
                errorLabel?.isHidden = false
                errorLabel?.text = "month should be greater than 0"
            } else { errorLabel?.isHidden = true }
            if ( Event_monthInt > 12){
                errorLabel?.isHidden = false
                errorLabel?.text = "month should be less than 12"
            } else { errorLabel?.isHidden = true }
        }
        
        
        if(Event_year?.isEmpty)!{
            textFieldEvent_year.layer.borderColor = UIColor.red.cgColor
            
            textFieldEvent_year.layer.cornerRadius = 8.0
            textFieldEvent_year.layer.masksToBounds = true
            textFieldEvent_year.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_year.layer.borderWidth = 2.0
            
            
            
        }
        else {
            textFieldEvent_year.layer.cornerRadius = 8.0
            textFieldEvent_year.layer.masksToBounds = true
            textFieldEvent_year.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_year.layer.borderWidth = 2.0
            
            let Event_yearInt = (Event_year as! NSString).integerValue
            if (Event_yearInt <= 2017 ){ //we could add the system date to cheack if passed or not :)
                errorLabel?.isHidden = false
                errorLabel?.text = "year should be 2018 and greater"
            } else { errorLabel?.isHidden = true }
        }
        if(Event_hour?.isEmpty)!{
            textFieldEvent_hour.layer.borderColor = UIColor.red.cgColor
            textFieldEvent_hour.layer.cornerRadius = 8.0
            textFieldEvent_hour.layer.masksToBounds = true
            textFieldEvent_hour.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_hour.layer.borderWidth = 2.0
            
            
            
        }
        else {
            textFieldEvent_hour.layer.cornerRadius = 8.0
            textFieldEvent_hour.layer.masksToBounds = true
            textFieldEvent_hour.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_hour.layer.borderWidth = 2.0
            
            let Event_hourInt = (Event_hour as! NSString).integerValue
            
            if (Event_hourInt <= 0){
                errorLabel?.isHidden = false
                errorLabel?.text = "hours should be greater than 0"
            } else { errorLabel?.isHidden = true }
            if (Event_hourInt > 24){
                errorLabel?.isHidden = false
                errorLabel?.text = "hours should be less than 24"
            } else { errorLabel?.isHidden = true }
        }
        if(Event_minute?.isEmpty)!{
            textFieldEvent_minute.layer.borderColor = UIColor.red.cgColor
            textFieldEvent_minute.layer.cornerRadius = 8.0
            textFieldEvent_minute.layer.masksToBounds = true
            textFieldEvent_minute.layer.borderColor = UIColor( red: 255/255, green: 0/255, blue:0/255, alpha: 1.0 ).cgColor
            textFieldEvent_minute.layer.borderWidth = 2.0
            
            
            
        }
        else {
            textFieldEvent_minute.layer.cornerRadius = 8.0
            textFieldEvent_minute.layer.masksToBounds = true
            textFieldEvent_minute.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldEvent_minute.layer.borderWidth = 2.0
            
            let Event_minuteInt = (Event_minute as! NSString).integerValue
            if (Event_minuteInt < 0 ){
                errorLabel?.isHidden = false
                errorLabel?.text = "minutes should be positive"
                return
            } else { errorLabel?.isHidden = true }
            if ( Event_minuteInt > 60){
                errorLabel?.isHidden = false
                errorLabel?.text = "minutes should be less than 60"
                return
            } else { errorLabel?.isHidden = true }
        }*/
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
        let queryString = "INSERT INTO events ( pictureUrl , name , location, day, month, year, hour, munite, type ) VALUES (?,?,?,?,?,?,?,?,?)"
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
            print("failure binding picture: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 2, Event_name, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding name: \(errmsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt, 3, Event_location, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding location: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 4, (Event_day as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding day: \(errmsg)")
            return
        }
        
        if sqlite3_bind_int(stmt, 5, (Event_month as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding month: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 6, (Event_year as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding year: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 7, (Event_hour as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding hour: \(errmsg)")
            return
        }
        if sqlite3_bind_int(stmt, 8, (Event_minute as NSString).intValue) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding minute: \(errmsg)")
            return
        }
        if sqlite3_bind_text(stmt, 9, Event_type, -1, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure binding type: \(errmsg)")
            return
        }
        
        
        //executing the query to insert values
        if sqlite3_step(stmt) != SQLITE_DONE {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("failure inserting Event: \(errmsg)")
            return
        }
        
        
        
        //emptying the textfields
        
        textFieldEvent_pictureUrl.text=""
        textFieldEvent_name.text=""
        textFieldEvent_location.text=""
   /*     textFieldEvent_day.text=""
        textFieldEvent_month.text=""
        textFieldEvent_year.text=""
        textFieldEvent_hour.text=""
        textFieldEvent_minute.text=""*/
        textFieldEvent_type.text=""
        
        
        
        
        //displaying a success message
        print("Event added successfully")
        // self.performSegue(withIdentifier: "ownerRegistrationHP", sender: self)
         EventAdded.isHidden = false
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        
      
       
 
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.textFieldEvent_name.delegate = self
        self.textFieldEvent_type.delegate = self
        self.textFieldEvent_location.delegate = self
        self.textFieldEvent_pictureUrl.delegate = self
        
        
       // errorLabel?.isHidden = true
        
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
        
        EventAdded.isHidden = true
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldEvent_pictureUrl.resignFirstResponder()
        textFieldEvent_location.resignFirstResponder()
        textFieldEvent_type.resignFirstResponder()
        textFieldEvent_name.resignFirstResponder()
        
        return true
    }
    
    
    
}
