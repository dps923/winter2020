---
title: Location services introduction
layout: default
---

## Location services introduction

This document introduces location services on iOS. 

<br>

### Overview

Some of this was adapted from the documentation. (Links are below, in the "Learning resources and references" section.)

The "Core Location" kit provides services that determine a device's geographic location, altitude, and orientation. The framework gathers data using all available components on the device, including Wi-Fi, GPS, Bluetooth, magnetometer, barometer, and cellular hardware. 

The `CLLocationManager` class is used. We create an instance, then configure, start getting location info, and stop when appropriate. 

To use location services at all, your app must request authorization from the user. 

<br>

#### Location info - the CLLocation class

A `CLLocationManager` instance will get location info, and hold the results in an array, that it passes to a delegate method:

```swift
func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
```

Inside that method, the `locations` local variable is that array of results. As you can see, its type is an array of [`CLLocation` objects](https://developer.apple.com/documentation/corelocation/cllocation). From the documentation, 

> a "`CLLocation` object contains the geographical location and altitude of a device, along with values indicating the accuracy of those measurements and when they were collected. In iOS, a location object also contains course information—that is, the speed and heading in which the device was moving."

Each `CLLocation` object has these interesting properties:
* `coordinate`... 
  * `coordinate.latitude`
  * `coordinate.longitude`
* `altitude`
* `course` (heading, direction)
* `speed` (of the device when last measured)
* `timestamp` 

With some thought, you can surely see how the data would be useful in many apps. 
<br>

### Implementation

Open the code example as you study this section. 

<img src="/media/location-app-example.png" class="border1" alt="Code example" />

<br>

First, the controller that uses location services must conform to the `CLLocationManagerDelegate` protocol. 

Then, a number of local instance variables should be declared and initialized, and they will hold location data as it is gathered and used. 

The request to get location data is usually wrapped by a function/method. It has a limited set of tasks to do:
* Configure the location manager's settings 
* Perform authorization tasks 
* Begin gathering location data

A number of delegate methods must be implemented to handle events that arise during authorization and then during the gathering of location data. 
* Authorization problems
* Get location failure
* Get a suitable location piece of data, then stop gathering any more location data 

How you use the data is up to you. The code example does a *reverse geocoding* task, using an Apple service, and will attempt to report a street address for the current location. Future code examples will use maps. 

<br>

#### Testing the code example app on the simulator 

For best results, run the app on a device. When that's not possible or convenient, the simulator will report a small number of locations to the `CLLocationManager` instance. They are set on the simulator app's Debug > Location menu. 

One of the menu's choices is "Custom Location...". Use a browser and search engine to get the latitude and longitude of a city (place) that you are interested in with this kind of search term:

```text
barrie ontario lat long
```

Configure the dialog with the values:

![Custom location](/media/location-custom-simulator.png)

<br>

### Learning resources and references

[Core Location](https://developer.apple.com/documentation/corelocation) document. 

[CLLocationManager](https://developer.apple.com/documentation/corelocation/cllocationmanager) reference. 

[CLLocation](https://developer.apple.com/documentation/corelocation/cllocation) reference.

[CLPlacemark](https://developer.apple.com/documentation/corelocation/clplacemark) reference. 

[Adding Location Services to Your App](https://developer.apple.com/documentation/corelocation/adding_location_services_to_your_app) document. 

[Getting the User's Location](https://developer.apple.com/documentation/corelocation/getting_the_user_s_location) document. 

<br>

Older / archive:  
[Location and Maps Programming Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/LocationAwarenessPG/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009497) document. 

<br>
