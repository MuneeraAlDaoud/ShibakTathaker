//
//  VisitorsTableViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 27/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class VisitorsTableViewController: UITableViewController {

    var visitorsList=[visitors]()
    var db: OpaquePointer?
    
    
    
    var username = ""
    var first_name = ""
    var last_name = ""
    var gender = ""
    var age = 0
    var phone = 0
    var email = ""
    
    
    
    let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ShibakTathaker.sqlite")
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "VisitorTableViewCell", bundle: nil)
        self.tableView.register(cellNib, forCellReuseIdentifier: "cellV")
        
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
            first_name = String(cString: sqlite3_column_text(stmt, 3))
            last_name = String(cString: sqlite3_column_text(stmt, 4))
            age = Int(sqlite3_column_int(stmt, 5))
            gender = String(cString: sqlite3_column_text(stmt, 6))
     
            //            let bio = String(cString: sqlite3_column_text(stmt, 7))
            //            let picture = String(cString: sqlite3_column_text(stmt, 8))
            phone = Int(sqlite3_column_int(stmt, 8))
            email = String(cString: sqlite3_column_text(stmt, 7))
            
            visitorsList.append(visitors(username: String(describing: username),email: String(describing: email),first_name: String(describing: first_name), last_name: String(describing: last_name),gender: String(describing: gender),age: Int(age),phone: Int64(phone)))
        }


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return visitorsList.count 
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellV = tableView.dequeueReusableCell(withIdentifier: "cellV", for: indexPath) as! VisitorTableViewCell

        // Configure the cell...
        
        cellV.first_name.text = first_name
        cellV.last_name.text = last_name
        cellV.username.text = username
        cellV.gender.text = gender
        cellV.email.text = email
        cellV.phone.text = String(phone)
        cellV.age.text = String(age)
        
        

        return cellV
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 421
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
