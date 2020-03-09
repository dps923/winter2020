## Week 9 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

### W09a1LoadV1

Based on the `TemplateCDv1` project template. 

This app has a navigation interface.  
The initial scene is managed by a standard view controller.    
It enables the user to create - *programmatically* - some new objects in the store.  
Also enables navigation to a list of objects, and selection of one of those navigates to a scene with some of the object's contents showing on a standard scene.  

<br>

###  W09a2LoadV2

Shows how to load a Core Data store with JSON starter data.  

Look at the store initializer. It shows how to read a JSON file from the bundle, and load its contents into a Core Data store. 

There are two "list" table view controllers.  
`ListFetchRequestOnly` uses a *fetch request* to get the data.  
`ListFRCSections` uses a *fetched results controller* (frc) to get the data. Notice the use of "section" info.  
