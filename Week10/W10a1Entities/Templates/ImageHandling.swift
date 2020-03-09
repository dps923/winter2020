//
//  ImageHandling.swift
//  Code snippets for fetching images
//  Copy then paste these into your code

import UIKit
import func AVFoundation.AVMakeRect

class ImageHandling {
    
    // Fetch from...
    // Asset catalog
    // App bundle
    // Documents folder
    // (to be completed)
    
    
    
    
    // ############################################################
    // Network, not cached
    
    // Use this in a standard view controller
    
    // Assume that we have a UIImageView somewhere
    @IBOutlet weak var imageInUserInterface: UIImageView!
    
    func imageHandler4() {
        
        // Set image content mode
        imageInUserInterface.contentMode = .scaleAspectFill
        
        // Load a placeholder image
        imageInUserInterface.image = UIImage(named: "placeholder.png")
        
        // Assume the following URL string
        let url = "https://dummyimage.com/126x131.png/ff4444/ffffff"
        // Build the URL to the image
        guard let imageURL = URL(string: url) else { return }
        
        // Fetch the image asynchronously
        DispatchQueue.global().async {
            // Attempt to fetch from the network
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            // If something was fetched, attempt to convert it to an image
            if let image = UIImage(data: imageData) {
                // Update the user interface
                DispatchQueue.main.async {
                    self.imageInUserInterface.image = image
                }
            }
        }
    }
    
    // ############################################################
    // Network, cached
    
    // Use this in a table view controller, in the cell render method
    
    func imageHandler5() {
        
        // Declare a photo cache container
        // It will be a dictionary that holds image data
        // and a unique key (for example, a URL)
        var photoCache = [String: Data]()
        
        // Assume that we have a reference to a table view cell
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "default")
        
        // Set image content mode
        cell.imageView?.contentMode = .scaleAspectFill
        
        // Load placeholder image
        cell.imageView?.image = UIImage(named: "placeholder.png")
        
        // Assume the following URL string
        let url = "https://dummyimage.com/126x131.png/ff4444/ffffff"
        
        // Attempt to load from the local photo cache
        if let image = photoCache[url] {
            // Diagnostic
            //print("Photo cache has the photo")
            cell.imageView?.image = UIImage(data: image)
        }
        else {
            // Diagnostic
            //print("Will attempt to fetch \(url)")
            
            // Attempt to load from the web
            // If using the signature with "completionHandler",
            // must create a data task variable
            // Otherwise, cannot use the trailing closure form,
            // and then execute the task right away with ".resume()"
            let photoFetch = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { (data, response, error) in
                
                // Continue only if the response is an image
                guard let mimeType = response?.mimeType, mimeType.starts(with: "image/") else { return }
                
                // Continue only if data was returned
                if let imageData = data {
                    // Remember, we're inside a closure function
                    // So we must access the main thread to update the UI
                    DispatchQueue.main.async {
                        cell.imageView?.image = UIImage(data: imageData)
                        
                        // Add to the photo cache
                        photoCache[url] = data
                        // Diagnostic
                        //print("Photo cache now has \(photoCache.count) items")
                    }
                }
            })
            photoFetch.resume()
            
        }
        
    }
    
    // ############################################################
    // Thumbnail handling
    
    // Image thumbnail generator
    // All credit goes to the author, Mattt Thompson
    // https://nshipster.com/image-resizing/
    
    class func makeThumbnail(from image: UIImage, size: CGSize) -> UIImage? {
        
        // Create a container in which we can draw the thumbnail
        let rect = AVMakeRect(aspectRatio: image.size, insideRect: CGRect(origin: .zero, size: size))
        
        // Create an image renderer
        let renderer = UIGraphicsImageRenderer(size: size)
        // Create a new thumbnail image
        return renderer.image { (context) in
            image.draw(in: rect)
        }
    }
    
}
