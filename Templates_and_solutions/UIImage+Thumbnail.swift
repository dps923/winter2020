//
//  UIImage+Thumbnail.swift
//  Adds a "getThumbnailImage()" method to any UIImage object
//  Inspiration is from Eng Yew https://stackoverflow.com/a/45653305

import UIKit

extension UIImage {
    
    // Call this method with an image size number
    // Small thumbnails for a table view can be about 25.0
    // Larger thumbnails can be about 100.0
    
    func getThumbnailImage(_ dimension: CGFloat, opaque: Bool = true, contentMode: UIViewContentMode = .scaleAspectFit) -> UIImage {
        
        // Setup
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        
        // Initialization
        let size = self.size
        let aspectRatio =  size.width/size.height
        
        // Can add more content modes if you wish
        switch contentMode {
        case .scaleAspectFit:
            if aspectRatio > 1 {                            // Landscape image
                width = dimension
                height = dimension / aspectRatio
            } else {                                        // Portrait image
                height = dimension
                width = dimension * aspectRatio
            }
        default:
            fatalError("UIIMage.getThumbnailImage(): FATAL: Unimplemented ContentMode")
        }
   
        // Generate thumbnail and return it
        let renderFormat = UIGraphicsImageRendererFormat.default()
        renderFormat.opaque = opaque
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
        newImage = renderer.image {
            (context) in
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        }
        
        return newImage
    }
}
