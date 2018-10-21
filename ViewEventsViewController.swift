//
//  ViewEventsViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 09/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class ViewEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
  
    var eventsList=[events]()
    var db: OpaquePointer?
    
    var name = ""
    var type = ""
    var location = ""
    var day = 0
    var month = 0
    var year = 0
    var hour = 0
    var munite = 0
    
    
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ShibakTathaker.sqlite")
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
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
            day = Int(sqlite3_column_int(stmt, 4))
            month = Int(sqlite3_column_int(stmt, 5))
            year = Int(sqlite3_column_int(stmt, 6))
            hour = Int(sqlite3_column_int(stmt, 7))
            munite = Int(sqlite3_column_int(stmt, 8))

            
            eventsList.append(events(name: String(describing: name),location: String(describing: location),type: String(describing: type),day: Int(day),month: Int(month),year: Int(year),hour: Int(hour),munite: Int(munite)))
            

        // Do any additional setup after loading the view.
    }
    
}//end viewDidLoad
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ViewEventsTableViewCell
        
        
        
        return cell
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
