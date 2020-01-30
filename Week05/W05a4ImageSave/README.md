###  W05a4ImageSave

Enables the user to save a photo to the app's file system. 

The app was created with the single-view template.  
Then, a table view controller (embedded in a nav controller) was added to the storyboard.  
A two-level nav interface was created, table view to standard view.  

The app also features a data model manager.  
It has functionality that enables us to work with images and the file system.  
One new thing is the generation of an image "thumbnail", to display in the table view cell.  

In a previous code example, you learned that the "Data" type is used to represent any data that is stored in the file system. We use that here, too.  
An image is saved to the file system by converting it to a "Data" object, and then writing that to the file system.  
An image, stored as "Data", is read from the file system by using a `UIImage` constructor that takes a URL as an argument. 
