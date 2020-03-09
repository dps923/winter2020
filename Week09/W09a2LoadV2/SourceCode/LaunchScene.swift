//
//  LaunchScene.swift
//  W09a2LoadV2
//
//  Created by Peter McIntyre on 2019-11-10.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class LaunchScene: UIViewController {
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Pass on the data model manager
        
        // To the list that uses a standard fetch request
        if segue.identifier == "toListFetchRequestOnly" {
            let vc = segue.destination as! ListFetchRequestOnly
            vc.m = m
        }
        
        // To the list that uses an frc
        // Notice that we do NOT set/configure/pass a section name
        // So the appearance of the list will match the previous list
        if segue.identifier == "toListFRC" {
            let vc = segue.destination as! ListFRCSections
            vc.m = m
        }
        
        // To the list that uses an frc
        // Notice that we set/configure/pass a section name
        if segue.identifier == "toListFRCWithSectionInfo" {
            let vc = segue.destination as! ListFRCSections
            vc.m = m
            // Send along the name of the section property
            vc.sectionName = "province"
        }
    }
    
}
