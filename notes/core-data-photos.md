---
title: Core Data and photos
layout: default
---

## Core Data and photos

In a Core Data entity, an attribute can be configured to have a Core Data type of "Binary Data". Its actual data type, when materialized in memory, is [`Data`](https://developer.apple.com/documentation/foundation/data), which is a byte buffer. This can be used for photos/images and other byte-oriented data (audio, video). 

<br>

### Important concepts and info

The native persistent storage format of byte-oriented data (image, audio, video, etc.) is efficient, and is handled easily by modern device operating systems. 

As a result, it is appropriate and necessary to ask whether there is a role for a database engine when handling byte-oriented data. The answer is debatable, but in general, at scale, byte-oriented data should NOT be managed (and stored) by a database engine. Yet all database engines offer a way to handle byte-oriented data. 

Why? To easily enable the association between data items and photos for example. Is there an alternative way of accomplishing this? Yes, by separating the handling responsibilities How?
* Create a unique file system name for the photo (audio, video, etc.). 
* Save it into the device's file system. 
* In the database, save/store the file system name. 
* Write code for the load and save tasks to work with both storage destinations. 

<br>

### How Core Data helps

Core Data can help by handling all of these separate responsibilities for us. A photo can become just a simple attribute on an entity object. 

One of the configurable properties of a "Binary Data" attribute is "Allows External Storage". That's the magic that makes it happen. It seems that authoritative Apple documentation on its operation is scarce, but behind the scenes, Core Data will save the photos in a specific (and hidden) file system location (but near the Core Data store files). 

<br>

#### Making it work, prerequisite

As noted above, in the Core Data model editor, the entity attribute must be configured as follows: 
* Type is "Binary Data" 
* "Allows External Storage" is checked (marked) 

Assume that we have a reference to an entity object, as "`item`", and it has a "`photo`" attribute. 

Then, you must be prepared to marshal the bytes back-and-forth to-and-from `UIImage` and `Data`. 

<br>

#### Saving a photo

Assume that you have a photo, as a `UIImage` instance, as "`image`". It doesn't matter where it came from (camera, photo library, the network). 

Perhaps in the `imagePickerController(_:didFinishPickingMediaWithInfo:)` method, do something like this: 

```swift
// Marshal the bytes from UIImage to Data
item.photo = image.pngData()
```

On your own, look up the [`pngData()`](https://developer.apple.com/documentation/uikit/uiimage/1624096-pngdata) and [`jpgData(compressionQuality:)`](https://developer.apple.com/documentation/uikit/uiimage/1624115-jpegdata) methods. 

<br>

#### Reading a photo

Same assumptions as above. 

Perhaps in the `viewDidLoad()` method, do something like this: 

```swift
if let photo = item.photo {
  // Display in the user interface
  photoOnTheScene.image = UIImage(data: photo)
}
```

<br>
