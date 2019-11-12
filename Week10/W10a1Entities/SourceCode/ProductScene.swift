//
//  ProductScene.swift
//  W10a1Entities
//
//  Created by Peter McIntyre on 2019-11-11.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ProductScene: UIViewController {
    
    // MARK: - Instance variables
    
    var m: DataModelManager!
    var item: Product!
    
    // MARK: - Outlets
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCost: UILabel!
    @IBOutlet weak var productSize: UILabel!
    @IBOutlet weak var productPhoto: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set title
        title = "\(item.company?.name ?? "Product") product"
        
        productName.text = item.name
        productSize.text = "Size is \(item.size ?? "(unavailable)")"
        productCost.text = "Cost is $\(item.cost)"
        
        // Configure the photo
        
        let photoUrl = item.photo?.replacingOccurrences(of: "http", with: "https")
        
        // Build the URL to the image
        guard let imageURL = URL(string: photoUrl!) else { return }
        
        // Aspect
        productPhoto.contentMode = .top
        
        // Fetch the image asynchronously
        DispatchQueue.global().async {
            // Attempt to fetch from the network
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            // If something was fetched, attempt to convert it to an image
            if let image = UIImage(data: imageData) {
                // Update the user interface
                DispatchQueue.main.async {
                    self.productPhoto.image = image
                }
            }
        }
    }
    
}
