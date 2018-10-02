//
//  Participant_forgotPasswordViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 21/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3
import CoreData

class Participant_forgotPasswordViewController: UIViewController {

    
    
  
    @IBOutlet weak var ParticipantEmailTextField: UITextField!
    
//    @IBOutlet weak var UserNameField: UITextField!
    
    var db: OpaquePointer?
    var util = Utilities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func OkAction(_ sender: UIButton) {
        
        if EmailField.text! != ""{
            
            print("email block")
            let  b = db.selectAll(fromTable: "SELECT password FROM users where email = \"\(EmailField.text!)\"")
            
            if let pass = (b?.firstObject as? NSMutableDictionary)?.value(forKey: "password") as? String{
                print(pass)
                let alert = util.configPopup(title: "\(EmailField.text!)", message: "password for \(EmailField.text!) is \(pass)")
                present(alert, animated: true, completion: nil)
            }else{
                print("fettching email unsuccessfull")
                
                let alert = util.configPopup(title: "Oops", message: "\(EmailField.text!) \" email not found")
                present(alert, animated: true, completion: nil)
                
            }
            
        }else if UserNameField.text! != ""{
            
            print("username block")
            
            let a = db.selectAll(fromTable: "SELECT password FROM users where username = \"\(UserNameField.text!)\"")
            
            if let pass = (a?.firstObject as? NSMutableDictionary)?.value(forKey: "password") as? String{
                print(pass)
                
                let alert = util.configPopup(title: "\(UserNameField.text!)", message: "password for \(UserNameField.text!) is \(pass)")
                present(alert, animated: true, completion: nil)
            }else{
                print("fettching password unsuccessfull")
                let alert = util.configPopup(title: "Oops", message: "user not found")
                present(alert, animated: true, completion: nil)
                
            }
            
        }
        else{
            if UserNameField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" && EmailField.text!.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
                
                let alert = util.configPopup(title: "please", message: "enter something")
                present(alert, animated: true, completion: nil)
            }
            else{
                let alert = util.configPopup(title: "Error", message: "Strange Error")
                present(alert, animated: true, completion: nil)
            }
            
            print("else block")
            
        }
        
    }
    
    @IBAction func GoBacktoLogin(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
