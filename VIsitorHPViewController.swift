//
//  VIsitorHPViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 29/01/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit

class VIsitorHPViewController: UIViewController {
    
    var VisitorUn1 = ""
    
    
    @IBAction func ProfileButton(_ sender: Any) {
        
         self.performSegue(withIdentifier: "VisitorProfile", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VisitorProfile"{
        let nav = segue.destination as! UINavigationController
        let svc = nav.topViewController as! VisitorsTableViewController
            svc.VisitorUn2 = self.VisitorUn1}
        
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
