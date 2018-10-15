//
//  OwnerHPViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 29/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit

class OwnerHPViewController: UIViewController {
    
    var OwnerUn1 = ""

    @IBAction func OwnerProfile(_ sender: Any) {

           self.performSegue(withIdentifier: "OwnerProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "OwnerProfile" {
        
            let vc = segue.destination as! OwnerProfileViewController
            vc.OwnerUn2 = self.OwnerUn1

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
