//
//  InfoScene.swift
//  W05a1StoreText
//
//  Created by Peter McIntyre on 2019-09-30.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class InfoScene: UIViewController {
    
    // Variables
    
    let fileName = "text.txt"
    var fileUrl: URL?
    
    // Outlets
    
    @IBOutlet weak var content: UITextView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the URL to the file
        fileUrl = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first?
            .appendingPathComponent(fileName)
        // Diagnostic
        //print("\(fileUrl!.absoluteString)")
        
        // Attempt to load
        content.text = storageLoad()
    }

    // Load from file system storage
    func storageLoad() -> String {
        
        var itemContent = ""
        
        // Attempt to load
        do {
            itemContent = try String(contentsOf: fileUrl!, encoding: .utf8)
            // Diagnostic
            //print("Loaded")
        }
        catch {
            print(error.localizedDescription)
        }
        return itemContent
    }
    
    // Save to file system storage
    func storageSave(itemContent: String) -> Bool {

        // Attempt to save
        do {
            try itemContent.write(to: fileUrl!, atomically: true, encoding: .utf8)
            return true
        }
        catch {
            print(error.localizedDescription)
            return false
        }
    }
    
    // MARK: - Actions
    
    @IBAction func save(_ sender: UIButton) {
        
        // Attempt to save
        storageSave(itemContent: content.text) ? print("Saved") : print("Save error")
    }
    
}
