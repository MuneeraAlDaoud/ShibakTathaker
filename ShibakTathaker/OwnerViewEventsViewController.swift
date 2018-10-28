//
//  OwnerViewEventsViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 13/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class OwnerViewEventsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var EventsTableView: UITableView!
    
    var eventsList=Dictionary<String, AnyObject>()
    var eventsListBig=Array<AnyObject>()
    
    //      var eventsList=[Dictionary<String, Any>]()
    
    var db: OpaquePointer?
    
    
    var name = ""
    var type = ""
    var location = ""
    var day = ""
    var month = ""
    var year = ""
    var hour = 0
    var munite = 0
    
    
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ShibakTathaker.sqlite")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "ViewEventsTableViewCell", bundle: nil)
        self.EventsTableView.register(cellNib, forCellReuseIdentifier: "cell")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        // Do any additional setup after loading the view.
        
        
        
        eventsList.removeAll()
        
        let queryString = "SELECT * FROM events"
        
        var stmt:OpaquePointer?
        
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            
            name = String(cString: sqlite3_column_text(stmt, 2))
            location = String(cString: sqlite3_column_text(stmt, 3))
            type = String(cString: sqlite3_column_text(stmt, 9))
            day = String(sqlite3_column_int(stmt, 4))
            month = String(sqlite3_column_int(stmt, 5))
            year = String(sqlite3_column_int(stmt, 6))
            hour = Int(sqlite3_column_int(stmt, 7))
            munite = Int(sqlite3_column_int(stmt, 8))
            
            
            /* eventsList.append(events(name: String(describing: name),location: String(describing: location),type: String(describing: type),day: Int(day),month: Int(month),year: Int(year),hour: Int(hour),munite: Int(munite)))*/
            
            /* eventsList = [
             
             [
             "name":name,
             "location":location,
             "type":type,
             "day":day,
             "month":month,
             "year":year
             
             ]
             
             
             ]*/
            
            eventsList["name"]=name as AnyObject
            eventsList["location"]=location as AnyObject
            eventsList["type"]=type as AnyObject
            eventsList["day"]=day as AnyObject
            eventsList["month"]=month as AnyObject
            eventsList["year"]=year as AnyObject
            
            eventsListBig.append(eventsList as AnyObject)
            
            
            
            // Do any additional setup after loading the view.
        }
        
        
        
        
    }//end viewDidLoad
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsListBig.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewEventsTableViewCell
        
        
        
        //         let event1 = eventsListBig[0]
        //         let event = eventsList[indexPath.row]
        
        
        /* cell.Event_name.text = event["name"] as? String
         cell.Event_location.text = event["location"] as? String
         cell.Event_type.text = event["type"] as? String
         cell.Event_date.text = event["day"] as? String
         //+" "+["month"]+" "+event["year"]*/
        //        print(self.eventsListBig[indexPath.row]["name"] as? String)
        cell.Event_name.text = self.eventsListBig[indexPath.row]["name"] as? String
        cell.Event_location.text = self.eventsListBig[indexPath.row]["location"] as? String
        cell.Event_type.text = self.eventsListBig[indexPath.row]["type"] as? String
        cell.Event_date.text = self.eventsListBig[indexPath.row]["day"] as? String
        cell.Event_month.text = self.eventsListBig[indexPath.row]["month"] as? String
        cell.Event_year.text = self.eventsListBig[indexPath.row]["year"] as? String
        
        //+" "+["month"]+" "+event["year"]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    
    
}//end Class

