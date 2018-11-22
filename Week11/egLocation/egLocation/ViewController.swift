//
//  ViewController.swift
//  egLocation
//

//  MUST add a row (an item) to the Info.plist settings file
//  The key is...
//  Privacy - Location When In Use Usage Description
//  The value (of type String) is something like...
//  This app tags a new item with the current location.

import UIKit
// Import the location services library
import CoreLocation

// Conform to the location services protocol
class ViewController: UIViewController, CLLocationManagerDelegate {

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

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Get the location
        getLocation()
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
        let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in Settings.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    // Build a nice string from a placemark
    // If you want a different format, do it
    private func makePlacemarkText(from placemark: CLPlacemark) -> String {
        
        var s = ""
        s.append(placemark.subThoroughfare!)
        s.append(" \(placemark.thoroughfare!)")
        s.append(", \(placemark.locality!) \(placemark.administrativeArea!)")
        s.append(", \(placemark.postalCode!) \(placemark.country!)")
        
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
                // Info to the programmer
                print("\n\(self.placemarkText)")
            }
        })
        
        locationRequests += 1
    }

}

