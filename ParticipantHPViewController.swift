//
//  ParticipantHPViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 29/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit

class ParticipantHPViewController: UIViewController {

    
    var ParticipantUn1 = ""
    
    
    @IBAction func ParticipantProfile(_ sender: Any) {
      
        self.performSegue(withIdentifier: "ParticipantProfile", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if segue.identifier == "ParticipantProfile"{
       
        let vc = segue.destination as! ParticipantProfileViewController
            vc.ParticipantUn2 = self.ParticipantUn1
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
