---
title: Map essentials
layout: default
---

## Mapping services essentials

This document will introduce you to the use of mapping services in an iOS app. Before continuing, make sure that you know how to use location services. 

A scene in an iOS apps can include an `MKMapView` object, which is a rectangle. It will use the network to fetch map content from the Apple mapping services infrastructure (so obviously the device *must* be able to use the network). Your app's logic can add annotations and other data to the map, if desired. 

<br>

### Getting started

It is easy to get started with a map. Assume that you have a standard view controller and scene, with some space on it to hold a map. 

<img class="border1" src="/media/location-scene-part.png" alt="Map part">

At a minimum, do the following:
* On the storyboard, on the scene, add a map view from the object library, and size it. 
* On the attributes inspector, check (mark) the Shows > User Location checkbox. 
* Create an outlet to the view controller. 
* In the controller, `import MapKit` 
* At the appropriate place - when you have an actual location coordinate - write some code that will define a zoom region, and then show that region on the map. 

At a minimum, the code will look similar to this:

```swift
// Assume that "locationMap" is the outlet name
// to the map view on the storyboard scene

// Prepare the map's visible region
let region = MKCoordinateRegion.init(center: self.locationMap.userLocation.coordinate, latitudinalMeters: 2000, longitudinalMeters: 2000)

// Show the map
self.locationMap.setRegion(self.locationMap.regionThatFits(region), animated: true)
```

<br>

### The full-scene map view approach

This is the preferred approach, using a full-scene map, displayed modally from a presenter. After the user is done with the map, a button is tapped, and the modal scene is dismissed. This is a typical "task", similar to add, edit, and details. 

<img class="border1" src="/media/location-scene-full.png" alt="Map full">


<br>
