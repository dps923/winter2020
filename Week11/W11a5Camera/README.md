###  W11a5Camera

Based on Version 3 of the template.

This app saves photos in the Core Data store.  

Look first in the Core Data model.  
The Example entity has a new attribute, "photo".    
Look at its data model inspector panel.  
Notice that the attribute type is "Binary Data".  
And, the "Allows External Storage" checkbox is checked / marked.  

So, the stored data type is `Data`. You have seen that before, with images sent or received from the network.  

**Get a UIImage from Data?**  

For example, look at the `viewDidLoad()` method in the ExampleScene controller:    
```swift
if let photo = item.photo {
  examplePhoto.image = UIImage(data: photo)
}
```

**Save a UIImage into Data?**

For example, look at the `imagePickerController(_:didFinishPickingMediaWithInfo:)` method in the ExampleAddNew controller:  
```swift
// Attempt to get the image from the "info" object
if let image = info[.originalImage] as? UIImage {
  // If successful, display it in the UI
  examplePhoto.image = image
  newItem.photo = image.pngData()
}
```
