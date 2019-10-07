//
//  DataModelManager.swift
//  W05a4ImageSave
//
//  Created by Peter McIntyre on 2019-10-07.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class DataModelManager {
    
    // MARK: - Variables
    
    private var urlDocuments: URL?
    private var images: [URL]!

    // MARK: - Lifecycle
    
    // Default initializer
    init() {

        // Get the path to the documents folder
        urlDocuments = FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask).first
        
        // Diagnostic
        //print("Documents URL:\n\(urlDocuments!.absoluteString)")
        
        // Get the images in there
        images = fileListGet()
    }
    
    // Get a collection of URLs to the saved images
    func fileListGet() -> [URL] {
        
        // Get all files in the documents folder
        let allFiles = try? FileManager.default
            .contentsOfDirectory(at: urlDocuments!, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        
        // Filter, look only for jpg
        let imageFiles = allFiles?.filter { $0.pathExtension == "jpg" }
        
        // Diagnostic
        //print("image URLs:", imageFiles!)
        
        return imageFiles!
    }

    // Get and return one specific image
    func imageGet(_ url: URL) -> UIImage? {

        return UIImage(contentsOfFile: url.path)
    }
    
    // Save an image in the file system
    func imageSave(_ image: UIImage) -> Bool {

        // Generate filename
        let filename = "\(generateFilename()).jpg"
        // Convert the image into writeable data
        let data = image.jpegData(compressionQuality: 0.7)
        
        do {
            // Attempt to save the image
            try data?.write(to: urlDocuments!.appendingPathComponent(filename))
            
            // Successful, so update the image list
            images = fileListGet()
        }
        catch {
            print(error)
            return false
        }
        return true
    }
    
    // Generate a filename
    private func generateFilename(_ length: Int? = 12) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length!).map{ _ in letters.randomElement()! })
    }

}
