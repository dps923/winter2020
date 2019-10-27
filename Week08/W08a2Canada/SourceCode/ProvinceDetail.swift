//
//  ProvinceDetail.swift
//  Purpose - Shows content for a Detail accessory
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit

protocol ShowProvinceDetailDelegate: class {

    func showDetailDone(_ controller: UIViewController)
}

class ProvinceDetail: UIViewController {

    // MARK: - Instance variables
    
    weak var delegate: ShowProvinceDetailDelegate?
    
    // Use if a collection is passed in, or fetched from data model manager
    //var items = [Province]()
    
    // Use if an object MAY be passed in
    //var item: Province?
    // Use if an object WILL be passed in
    var item: Province!
    
    // Use if a reference to the data model manager is passed in
    // If you don't like the variable name, change it
    //var m: DataModelManager!

    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var provinceName: UILabel!
    @IBOutlet weak var provincePremier: UILabel!
    @IBOutlet weak var provinceArea: UILabel!
    @IBOutlet weak var provinceYearFounded: UILabel!

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        provinceName.text = item.name
        provincePremier.text = "Premier is \(item.premier!)"
        provinceArea.text = "Area in square km: \(item.area)"
        provinceYearFounded.text = "Entered confederation in \(item.yearFounded)"
    }
    
    // MARK: - Actions (user interface)
    
    // This controller's scene has a nav bar button "Done"

    @IBAction func done(_ sender: UIBarButtonItem) {

        // Call into the delegate
        delegate?.showDetailDone(self)
    }

}

// Sample protocol method implementations
// Copy to the presenting controller's "Lifecycle" area
// Configure the presenting controller to adopt the protocol

/*
func showDetailDone(_ controller: UIViewController) {
    
    dismiss(animated: true, completion: nil)
}
*/
