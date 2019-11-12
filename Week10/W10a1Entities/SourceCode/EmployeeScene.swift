//
//  EmployeeScene.swift
//  W10a1Entities
//
//  Created by Peter McIntyre on 2019-11-11.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class EmployeeScene: UIViewController {
    
    // MARK: - Instance variables
    
    var m: DataModelManager!
    var item: Employee!
    
    // MARK: - Outlets
    
    @IBOutlet weak var employeeName: UILabel!
    @IBOutlet weak var employeeTitle: UILabel!
    @IBOutlet weak var employeeBirthDate: UILabel!
    @IBOutlet weak var employeePhoto: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        title = "\(item.company?.name ?? "Company") employee"
        
        employeeName.text = item.name
        employeeTitle.text = "Job title \(item.title ?? "(none)")"
        
        // Format the birth date
        let df = DateFormatter()
        df.dateFormat = "MMMM d, yyyy"
        employeeBirthDate.text = "Birth date \(df.string(from: item.birthDate!))"
        
        // Configure the photo
        
        let photoUrl = item.photo?.replacingOccurrences(of: "http", with: "https")
        
        // Build the URL to the image
        guard let imageURL = URL(string: photoUrl!) else { return }
        
        // Aspect
        employeePhoto.contentMode = .top
        
        // Fetch the image asynchronously
        DispatchQueue.global().async {
            // Attempt to fetch from the network
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            // If something was fetched, attempt to convert it to an image
            if let image = UIImage(data: imageData) {
                // Update the user interface
                DispatchQueue.main.async {
                    self.employeePhoto.image = image
                }
            }
        }
    }
    
}
