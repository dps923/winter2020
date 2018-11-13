//
//  ExampleDetailCD.swift
//  Purpose - Shows content for a Detail accessory
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Example method implementations are at the bottom of this file

import UIKit

protocol ShowExampleDetailDelegate: class {

    func showDetailDone(_ controller: UIViewController)
}

class ExampleDetailCD: UIViewController {

    // MARK: - Instance variables
    
    weak var delegate: ShowExampleDetailDelegate?
    
    // Use if a collection is passed in, or fetched from data model manager
    //var items = [Example]()
    
    // Use if an object MAY be passed in
    //var item: Example?
    // Use if an object WILL be passed in
    var item: Example!
    
    // Use if a reference to the data model manager is passed in
    // If you don't like the variable name, change it
    //var m: DataModelManager!

    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var exampleName: UILabel!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        exampleName.text = item.name
    }
    
    // MARK: - Actions (user interface)
    
    // This controller's scene has a nav bar button "Done"

    @IBAction func done(_ sender: UIBarButtonItem) {

        // Call into the delegate
        delegate?.showDetailDone(self)
    }

}

// Example method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
func showDetailDone(_ controller: UIViewController) {
    
    dismiss(animated: true, completion: nil)
}
*/
