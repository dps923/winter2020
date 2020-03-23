//
//  ViewController.swift
//  Location introduction code example
//

//  MUST add a row (an item) to the Info.plist settings file
//  The key is...
//  Privacy - Location When In Use Usage Description
//  The value (of type String) is something like...
//  This app tags a new item with the current location.

import UIKit
// Import the location services library
import CoreLocation
// Import the mapping services library
import MapKit

// Conform to the location services protocol
class ViewController: UIViewController, CLLocationManagerDelegate, ShowMapDelegate {
    
    // MARK: - Instance variables
    
    // These are the important variables:
    // "location" holds the GPS coordinate
    // "placemarkText" holds its address as a string
    
    var locationManager = CLLocationManager()
    var location: CLLocation?
    var locationRequests: Int = 0
    
    var geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var placemarkText = "(location not available)"
    
    // MARK: - Outlets
    
    @IBOutlet weak var locationText: UITextView!
    @IBOutlet weak var locationMap: MKMapView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the location
        getLocation()
    }
    
    func showMapDone(_ controller: UIViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private methods
    
    private func getLocation() {
        
        // These two statements setup and configure the location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 10.0
        
        // Determine whether the app can use location services
        let authStatus = CLLocationManager.authorizationStatus()
        
        // If the app user has never been asked before, then ask
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        // If the app user has previously denied location services, do this
        if authStatus == .denied || authStatus == .restricted {
            showLocationServicesDeniedAlert()
            return
        }
        
        // If we are here, it means that we can use location services
        // This statement starts updating its location
        locationManager.startUpdatingLocation()
    }
    
    // Respond to a previously-denied request to use location services
    private func showLocationServicesDeniedAlert() {
        let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in the Settings app.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Build a nice string from a placemark
    // If you want a different format, do it
    private func makePlacemarkText(from placemark: CLPlacemark) -> String {
        
        var s = ""
        
        if let subThoroughfare = placemark.subThoroughfare {
            s.append(subThoroughfare)
        }
        
        if let thoroughfare = placemark.thoroughfare {
            s.append(" \(thoroughfare)")
        }
        
        if let locality = placemark.locality {
            s.append(", \(locality)")
        }
        
        if let administrativeArea = placemark.administrativeArea {
            s.append(" \(administrativeArea)")
        }
        
        if let postalCode = placemark.postalCode {
            s.append(", \(postalCode)")
        }
        
        if let country = placemark.country {
            s.append(" \(country)")
        }
        
        return s
    }
    
    // MARK: - Delegate methods
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        // When location services is requested for the first time,
        // the app user is asked for permission to use location services
        // After the permission is determined, this method is called by the location manager
        
        // If the permission is granted, we want to start updating the location
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("\nUnable to use location services: \(error)")
    }
    
    // This is called repeatedly by the iOS runtime,
    // as the location changes and/or the accuracy improves
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        // Here is how you can configure an arbitrary limit to the number of updates
        if locationRequests > 10 { locationManager.stopUpdatingLocation() }
        
        // Save the new location to the class instance variable
        location = locations.last!
        
        // Info to the programmer
        print("\nUpdate successful: \(location!)")
        print("\nLatitude \(location?.coordinate.latitude ?? 0)\nLongitude \(location?.coordinate.longitude ?? 0)")
        
        // Do the reverse geocode task
        // It takes a function as an argument to completionHandler
        geocoder.reverseGeocodeLocation(location!, completionHandler: { placemarks, error in
            
            // We're looking for a happy response, if so, continue
            if error == nil, let p = placemarks, !p.isEmpty {
                
                // "placemarks" is an array of CLPlacemark objects
                // For most geocoding requests, the array has only one value,
                // so we will use the last (most recent) value
                
                // Format and save the text from the placemark into the class instance variable
                self.placemarkText = self.makePlacemarkText(from: p.last!)
                
                // Info to the display
                self.locationText.text = self.placemarkText
                
                // Info to the programmer
                print("\n\(self.placemarkText)")
            }
        })
        
        locationRequests += 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toMapScene" {
            
            // Get a reference to the next controller
            let nav = segue.destination as! UINavigationController
            let vc = nav.viewControllers[0] as! MapScene
            
            // Fetch and prepare the data to be passed on
            //let indexPath = tableView.indexPath(for: sender as! UITableViewCell)
            //let selectedData = frc.object(at: indexPath!)
            
            // Set other properties, optional
            vc.userLocationTitle = "My location"
            vc.userLocationSubtitle = placemarkText
            
            // Create two example map annotations, near the current user location
            
            var nearby1 = location!.coordinate
            nearby1.longitude = nearby1.longitude + 0.01
            let ma1 = MapAnnotation(coordinate: nearby1, title: "Food Max", subtitle: "Groceries, housewares, etc.")
            
            var nearby2 = location!.coordinate
            nearby2.latitude = nearby2.latitude - 0.01
            let ma2 = MapAnnotation(coordinate: nearby2, title: "Big Box", subtitle: "Electronics, appliances, etc.")
            
            vc.mapAnnotations = [ma1, ma2]
            
            // Pass on the data model manager, if necessary
            //vc.m = m
            // Set the delegate, if configured
            vc.delegate = self
        }
        
    }
}

