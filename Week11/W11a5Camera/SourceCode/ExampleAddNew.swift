//
//  ExampleAdd.swift
//  CameraCoreData
//  Purpose - Handles the "add item" workflow
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit

protocol ExampleAddDelegate: class {
    
    func addTaskDidCancel(_ controller: UIViewController)
    
    func addTaskDidSave(_ controller: UIViewController)
}

class ExampleAddNew: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Instance variables
    
    weak var delegate: ExampleAddDelegate?

    var m: DataModelManager!
    
    // This will be initialized in viewDidLoad()
    var newItem: Example!
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var exampleName: UILabel!
    @IBOutlet weak var examplePhoto: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create a new item programmatically
        // If the user cancels, the new item will be deleted
        newItem = Example(context: m.ds_context)
        newItem.name = StoreInitializer.randomString(StoreInitializer.randomInteger(between: 5, and: 15))
        newItem.quantity = Int32(StoreInitializer.randomInteger(between: 10, and: 500))
        
        // Update the user interface
        exampleName.text = "\(newItem.name ?? "(none)") (qty \(newItem.quantity))"
    }
    
    // MARK: - Actions (user interface)

    // Get or take photo
    @IBAction func getPhoto(_ sender: UIButton) {
        
        // Create the image picker controller
        let c = UIImagePickerController()
        
        // Determine what we can use...
        // Prefer the camera, but can use the photo library
        c.sourceType = UIImagePickerController.isSourceTypeAvailable(.camera) ? .camera : .photoLibrary
        
        c.delegate = self
        c.allowsEditing = false
        // Show the controller
        present(c, animated: true, completion: nil)
    }
    
    // Get or take photo task was cancelled
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // Save the photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Attempt to get the image from the "info" object
        if let image = info[.originalImage] as? UIImage {
            
            // If successful, display it in the UI
            examplePhoto.image = image
            newItem.photo = image.pngData()
        }
        dismiss(animated: true, completion: nil)
    }

    // Add new task cancelled
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        // Delete the new item from the context
        m.ds_context.delete(newItem)
        
        // Call into the delegate
        delegate?.addTaskDidCancel(self)
    }

    // Add new task save/completed
    @IBAction func save(_ sender: UIBarButtonItem) {
        
        // Save the new item
        m.ds_save()

        // Call into the delegate
        delegate?.addTaskDidSave(self)
    }
    
}

// Sample delegate method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
 func addTaskDidCancel(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 
 func addTaskDidSave(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 */
