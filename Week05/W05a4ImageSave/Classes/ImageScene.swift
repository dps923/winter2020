//
//  ImageScene.swift
//  W05a4ImageSave
//
//  Created by Peter McIntyre on 2019-10-07.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class ImageScene: UIViewController {

    // MARK: - Variables
    
    var m: DataModelManager!
    var item: URL!
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var imageContent: UIImageView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Show the image's file name
        imageName.text = item.lastPathComponent
        
        // Load the image into the UI
        imageContent.image = m.imageGet(item)
    }
    
}

