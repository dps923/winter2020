//
//  ViewController.swift
//  egCamera
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Instance variables
    
    var photo: UIImage?

    // MARK: - User interface outlets
    
    @IBOutlet weak var pickedPhoto: UIImageView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Actions
    
    @IBAction func getPhoto(_ sender: UIButton) {

        getPhotoWithCameraOrPhotoLibrary()
    }
    
}

