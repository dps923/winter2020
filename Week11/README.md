## Week 11 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

### W11a1Select

An example of an app that uses a table view controller and scene as an item-selection list. 

The code is in many files (manager, starting view controller, and the table view controller).  

The app was built with the Single View App project template.

<br>

### W11a3Map

Based on the W10a3Location (location introduction) app.  

Adds the ability to view a map of the current location.  
The "map view" was added to the app's only scene.  
A separate app will use the preferred "task scene" technique.

<br>

### W11a4MapTask

Based on the above W11a3Map (map introduction) app.  

The "map view" is on a separate scene, managed by the preferred "task scene" technique.

Another feature is the use of *map annotations*.  
These appear as red pins on the map.  

<br>

### W11a5Camera

This app saves photos in the Core Data store.  

Look first in the Core Data model.  
The Example entity has a new attribute, "photo".    
Look at its data model inspector panel.  
Notice that the attribute type is "Binary Data".  
And, the "Allows External Storage" checkbox is checked / marked.  

Then, we go back-and-forth between `UIImage` and `Data`. 
