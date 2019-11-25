//
//  ExampleScene.swift
//  Purpose - Control the "next" scene in the nav Disclosure workflow
//  This is a standard view controller
//  It is within a navigation workflow, with a presenter, and a maybe a successor
//

import UIKit

class ExampleScene: UIViewController {
    
    // MARK: - Public properties (instance variables)
    
    var m: DataModelManager!
    // Passed-in object, if necessary
    var item: Example!
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var exampleName: UILabel!
    @IBOutlet weak var examplePhoto: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exampleName.text = "\(item.name ?? "(none)") (qty \(item.quantity))"
        if let photo = item.photo {
            examplePhoto.image = UIImage(data: photo)
        }
    }
    
}
