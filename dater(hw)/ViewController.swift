//
//  ViewController.swift
//  dater(hw)
//
//  Created by Yernur Adilbek on 10/21/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fromDate: UIDatePicker!
    @IBOutlet weak var toDate: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "SecondVC" {
            if let vc = segue.destination as? SecondViewController {
                vc.receivedFromDate = fromDate.date
                vc.receivedToDate = toDate.date
            }
        }
    }
    
}

