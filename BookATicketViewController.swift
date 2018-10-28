//
//  BookATicketViewController.swift
//  ShibakTathaker
//
//  Created by Muneera AlDaoud on 16/02/1440 AH.
//  Copyright © 1440 Muneera AlDaoud. All rights reserved.
//

import UIKit
import SQLite3

class BookATicketViewController: UIViewController {

    
    
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var price: UITextField!
    var q = 0
    var p = 0
    
    
    @IBAction func plusQuantity(_ sender: Any) {
        
        q = q+1
        p = 135*q
        
        quantity.text = String(q)
        price.text = String(p)
    }
    
    @IBAction func minusQuantity(_ sender: Any) {
        
        q = q-1
        p = 135*q
        
        quantity.text = String(q)
        price.text = String(p)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        quantity.text = String(q)  //or 0
        price.text = String(p)
        

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
