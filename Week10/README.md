## Week 10 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

### W10a1Entities

Based on the `TemplateCDv2` project template. 

This loads a multi-entity data model, from a JSON file in the app bundle.  
The data model has three entities:  
1. Company 
2. Employee
3. Product

A company has a collection of employees. And, it has a collection of products. 

<br>

### W10a2TVEdit

Accompanies the [table view editing](https://dps923.ca/notes/core-data-tableview-editing) document.  
Use that document to guide you through the code that enables table view editing.  

<br>

### W10a3Location

Shows two capabilities:
1. Location services, to get and use a GPS coordinate set   
2. Reverse geocoding, to get and use the address for a GPS coordinate set

Run this on the simulator, and it will report a preconfigured location.  
Run this on a device, and it will report your actual location. 

<br>
