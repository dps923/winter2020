//
//  MapScene.swift
//  Purpose - Shows content for a map view
//  This is a standard view controller, modally-presented
//

//  This controller's scene (on the storyboard) must be embedded in a navigation controller

//  This functionality needs a delegate (choose a meaningful name)
//  Therefore, we declare a protocol
//  Sample method implementations are at the bottom of this file

import UIKit
// Import the mapping services library
import MapKit

protocol ShowMapDelegate: class {
    
    func showMapDone(_ controller: UIViewController)
}

// Must adopt the MKMapViewDelegate protocol
class MapScene: UIViewController, MKMapViewDelegate {
    
    // MARK: - Instance variables
    
    weak var delegate: ShowMapDelegate?
    
    // User location titles
    var userLocationTitle: String?
    var userLocationSubtitle: String?
    
    // Map annotations (pins)
    var mapAnnotations = [MapAnnotation]()
    
    // Use if a reference to the data model manager is passed in
    //var m: DataModelManager!
    
    // MARK: - Outlets (user interface)
    
    @IBOutlet weak var locationMap: MKMapView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the map view delegate
        locationMap.delegate = self
    }
    
    // Update the current user location (the blue dot)
    // The iOS runtime calls this method
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        // Prepare the map's visible region
        let region = MKCoordinateRegion.init(center: userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)
        
        // Prepare the callout
        locationMap.userLocation.title = userLocationTitle
        locationMap.userLocation.subtitle = userLocationSubtitle
        
        // Show the map
        locationMap.setRegion(region, animated: true)
        
        // Add annotations
        if mapAnnotations.count > 0 {
            locationMap.addAnnotations(mapAnnotations)
        }
    }
    
    // MARK: - Actions (user interface)
    
    // This controller's scene has a nav bar button "Done"
    @IBAction func done(_ sender: UIBarButtonItem) {
        
        // Call into the delegate
        delegate?.showMapDone(self)
    }
    
}

// Sample delegate method implementations
// Copy to the presenting controller's "Lifecycle" area

/*
 func showMapDone(_ controller: UIViewController) {
 
 dismiss(animated: true, completion: nil)
 }
 */

// Defines a map annotation object
class MapAnnotation: NSObject, MKAnnotation {
    
    // Initializer
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        
    }
    // This property must be key-value observable, which the "`"@objc dynamic"`" attributes provide.
    @objc dynamic var coordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    
    var title: String?
    var subtitle: String?
}
