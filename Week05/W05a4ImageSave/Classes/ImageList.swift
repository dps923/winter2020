//
//  ImageList.swift
//  W05a4ImageSave
//
//  Created by Peter McIntyre on 2019-10-07.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit
import func AVFoundation.AVMakeRect

class ImageList: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Variables

    var m: DataModelManager!
    var fileList = [URL]()

    // Configure the thumbnail size
    private let thumbnailSize = CGSize(width: 50, height: 50)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Adjust the cell height
        tableView.rowHeight = 60.0

        // Get the list of image files
        fileList = m.fileListGet()
    }

    // Table view build
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Table view build
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fileList.count
    }
    
    // Table view build
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        
        // Configure the cell...
        
        // Show the image's file name in the table row
        let url = fileList[indexPath.row]
        cell.textLabel?.text = url.lastPathComponent

        // Show an image thumbnail
        let image = getThumbnail(at: url, for: thumbnailSize)
        cell.imageView?.image = image
        
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toImageScene" {
            
            // Get a reference to the next controller
            let vc = segue.destination as! ImageScene
            
            // Fetch and prepare the data to be passed on
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            let selectedData = fileList[indexPath!.row]
            
            // Set other properties
            vc.item = selectedData
            vc.m = self.m
        }
    }
    
    // MARK: - Actions

    // Add a new image to the app
    @IBAction func addImage(_ sender: UIBarButtonItem) {
        
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
            
            // If successful, save the image
            
            print(m.imageSave(image) ? "Saved" : "Error")
            
            // Manually update the table view
            fileList = m.fileListGet()
            tableView.reloadData()
        }
        dismiss(animated: true, completion: nil)
    }

    // Image thumbnail generator
    // All credit goes to the author, Mattt Thompson
    // https://nshipster.com/image-resizing/
    
    private func getThumbnail(at url: URL, for size: CGSize) -> UIImage? {
        
        // Make sure that we can continue
        guard let image = m.imageGet(url) else {
            return nil
        }
        // Create a small container in which we can draw the thumbnail
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: CGRect(origin: .zero, size: thumbnailSize))
        
        // Create an image renderer
        let renderer = UIGraphicsImageRenderer(size: size)
        // Create a new thumbnail image
        return renderer.image { (context) in
            //image.draw(in: CGRect(origin: .zero, size: size))
            image.draw(in: rect)
        }
    }

}
