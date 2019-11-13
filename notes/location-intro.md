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

### Implementation

Open the code example as you study this section. 

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

### Learning resources and references

[Core Location](https://developer.apple.com/documentation/corelocation) document. 

[Adding Location Services to Your App](https://developer.apple.com/documentation/corelocation/adding_location_services_to_your_app) document. 

[Getting the User's Location](https://developer.apple.com/documentation/corelocation/getting_the_user_s_location) document. 

<br>

Older / archive:  
[Location and Maps Programming Guide](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/LocationAwarenessPG/Introduction/Introduction.html#//apple_ref/doc/uid/TP40009497) document. 

<br>
