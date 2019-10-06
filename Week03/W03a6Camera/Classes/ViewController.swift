//
//  ViewController.swift
//  W03a6Camera
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - User interface outlets
    
    @IBOutlet weak var pickedPhoto: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    
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
    
    // Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // Save
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        // Attempt to get the image from the "info" object
        if let image = info[.originalImage] as? UIImage {
            
            // If successful, display it in the UI
            pickedPhoto.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}
