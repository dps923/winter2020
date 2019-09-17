//
//  ViewController.swift
//  W03a1Alerts
//
//  Created by Peter McIntyre on 2019-09-17.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    
    // Outlets
    
    @IBOutlet weak var alertResult: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
    @IBAction func showAlert(_ sender: UIButton) {
        
        // Configure the alert's button actions
        
        let defaultAction = UIAlertAction(title: "Confirm", style: .default, handler: { (alert) in
            let msg = "Alert, default was tapped"
            print(msg)
            self.alertResult.text = msg
            
            // FYI... inside this block, you can access
            // the members of the passed-in "alert" object, if you wish
            // For example, "alert.title", etc.
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert) in
            let msg = "Alert, cancel was tapped"
            print(msg)
            self.alertResult.text = msg
        })
        
        // Create and configure the alert
        // Notice the "preferredStyle" parameter
        
        let alert = UIAlertController(title: "Confirm or cancel", message: "Please confirm or cancel this task", preferredStyle: .alert)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        
        // Present (show) the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func showActionSheet(_ sender: UIButton) {
        
        // Configure the action sheet's button actions
        
        let defaultAction = UIAlertAction(title: "Confirm and update", style: .default, handler: { (alert) in
            let msg = "Action sheet, default was tapped"
            print(msg)
            self.alertResult.text = msg
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { (alert) in
            let msg = "Action sheet, cancel was tapped"
            print(msg)
            self.alertResult.text = msg
        })
        
        let destructiveAction = UIAlertAction(title: "Remove the item", style: .destructive, handler: { (alert) in
            let msg = "Action sheet, destructive was tapped"
            print(msg)
            self.alertResult.text = msg
        })
        
        // Create and configure the action sheet
        // Notice the "preferredStyle" parameter
        
        let alert = UIAlertController(title: "Confirm or cancel", message: "Please confirm and update the item, \nremove the item, \nor cancel this task", preferredStyle: .actionSheet)
        alert.addAction(defaultAction)
        alert.addAction(cancelAction)
        alert.addAction(destructiveAction)
        
        // Present (show) the action sheet
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

