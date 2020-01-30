## Week 5 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

###  W05a1StoreText

Learn how to read-and-write from-and-to a simple text file in the file system. 

The app's UI features a `UITextView`. 

<br>

### W05a3StoreData

Learn how to read-and-write from-and-to a JSON file in the file system. 

And, learn how to include JSON data with the app "bundle", and then read from it when the app starts up for the first time. 

Uses a "data model manager" class, that gets initialized in the app delegate. 

<br>

### W05a4ImageSave

Enables the user to save a photo to the app's file system. 

The app has a two-level nav interface, from a table view to a standard view.  
The app also features a data model manager, with functionality for images and the file system.  
Study the code that generates a file name for the image.  

One new thing is the generation of an image "thumbnail", to display in the table view cell.  
Also note how we can adjust the cell height. 

<br>

### W05a6NavAdd

Multi-scene, navigation interface, table view, modal detail view, modal "add item" view, etc.

Has a working data model and controller code that can be used in other projects. Assumes a very simple data storage model, persisted as a JSON file in the app's Documents directory. 

<br>
