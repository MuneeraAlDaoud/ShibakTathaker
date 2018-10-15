//
//  Participant_loginViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 13/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3



class Participant_loginViewController: UIViewController, UITextFieldDelegate {

    var db: OpaquePointer?

  
    var ParticipantUn = ""

 
    @IBOutlet weak var error: UILabel!

    
    @IBOutlet weak var textFieldParticipant_username: UITextField!
    @IBOutlet weak var textFieldParticipant_password: UITextField!
    
    
    @IBAction func Participant_login(_ sender: Any) {
        
        let Participant_username = textFieldParticipant_username.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let Participant_password = textFieldParticipant_password.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
//weak var lblval
//        lblval.isHidden= true
        
//        guard let Participant_username= textFieldParticipant_username.text?.trimmingCharacters(in: .whitespacesAndNewlines),textFieldParticipant_username.text?.characters.count !=0 else {
//            lblval.isHidden = false
//            lblval.text = "please enter username"
//            return
//        }
        
//        guard    let Participant_password = textFieldParticipant_password.text?.trimmingCharacters(in: .whitespacesAndNewlines),textFieldParticipant_username.text?.characters.count !=0 else {
//            lblval.isHidden = false
//            lblval.text = "please enter username"
//            return
//        }
//
        
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
            
            return
            
            
        }
        
        else {
            textFieldParticipant_password.layer.cornerRadius = 8.0
            textFieldParticipant_password.layer.masksToBounds = true
            textFieldParticipant_password.layer.borderColor = UIColor( red: 255/255, green: 255/255, blue:255/255, alpha: 1.0 ).cgColor
            textFieldParticipant_password.layer.borderWidth = 2.0
            
        }
        
        //this is our select query
        let queryString = "SELECT * FROM participants"
        
        //statement pointer
        var stmt:OpaquePointer?
        
        //preparing the query
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
            return
        }
        
        //traversing through all the records
        var flag = false
        while(sqlite3_step(stmt) == SQLITE_ROW && !flag){
            
            let username = String(cString: sqlite3_column_text(stmt, 1))
            let password = String(cString: sqlite3_column_text(stmt, 2))
            
           
            
            if((Participant_username==username) && (Participant_password==password)) {flag = true}

            
        }//end while
        
        //displaying a success message
        if(flag)
        {print("Logged-in succesfully")
         
            self.ParticipantUn = textFieldParticipant_username.text!
            self.performSegue(withIdentifier: "ParticipantLoginHP" ,sender: self)
            
        }
            
        else {
            error.isHidden = false
            error.text = " * sorry, username or password is incorrect"
            
            print("sorry , username or password is wrong")}
        
        //emptying the textfields
        textFieldParticipant_username.text=""
        textFieldParticipant_password.text=""
        
        sqlite3_reset(stmt)
        sqlite3_finalize(stmt)
        
    }//end participant login
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if segue.identifier == "ParticipantLoginHP" {
        let vc = segue.destination as! ParticipantHPViewController
            vc.ParticipantUn1 = self.ParticipantUn }
    }
    
    override func viewDidLoad() {
        error.isHidden = true
        super.viewDidLoad()
        self.textFieldParticipant_username.delegate = self
        self.textFieldParticipant_password.delegate = self

        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("ShibakTathaker.sqlite")
        
        //opening the database
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        // Do any additional setup after loading the view.
        

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }//end viewDidLoad
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldParticipant_username.resignFirstResponder()
        textFieldParticipant_password.resignFirstResponder()
        
        return true
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
