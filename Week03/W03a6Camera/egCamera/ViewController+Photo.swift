//
//  ViewController+Photo.swift
//  egCamera
//

//  MUST add two rows (items) to the Info.plist settings file
//  For both, the value (of type String) is something like...
//  This app captures a photo for the current item.
//  The first row's key is...
//  Privacy - Camera Usage Description
//  The second row's key is...
//  Privacy - Photo Library Usage Description

import UIKit

// To take or pick a photo, we must adopt these two protocols
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Lifecycle
    
    func getPhotoWithCameraOrPhotoLibrary() {
        
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
    
    // MARK: - Image picker delegate methods
    
    // Cancel
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    // Save
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        photo = image
        
        print("\nPhoto was taken/picked")
        
        // Optional... do other things with the photo
        pickedPhoto.image = photo

        dismiss(animated: true, completion: nil)
    }
}
