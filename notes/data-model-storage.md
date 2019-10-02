---
title: Data model storage
layout: default
---

## Data model storage

In this course, you will learn about on-device *persistent storage* for your app's data model. 

In this course, we will cover three kinds of storage:
1. File system, simple files (text, JSON, property list) 
1. Web API 
1. File system, object graph storage, using Core Data 

A typical app can use more than one of these. 

> There are two more kinds of storage, which will likely not be covered in this course, because of time limitations:  
> * iCloud storage, typically synchronized with some kinds of on-device storage  
> * A local database management system, with or without synchronization with a public cloud storage 

<br>

### Data model startup

In the [data model essentials](data-model-essentials) document, you learned how the essentials of implementing a data model:
* A `DataModelClasses.swift` file with classes or structs that define the data shape
* A `DataModelManager.swift` file with properties and methods that provide data service operations 
* Initialization in the `AppDelegate.swift` file, and passing it to the first scene's controller 

There is another idea that you will become comfortable with - including "startup" or "initial" data with your app. 

<br>

#### Include data with your app 

Often, an app will come with the data it needs to launch successfully for the first time. Here, we will discuss how to include data in the "app bundle". 

> Later but soon, we will also discuss a way to get the app's initial data from the network (i.e. from a web API). 

What is a bundle? It is the collection of executable code and assets that's created by the "build" and "run" task. When an app is installed on a device (or on the simulator), it creates a bundle, and all items in the bundle are read-only, and cannot be changed. 

> As you will soon learn, the app installation process also creates a "sandboxed" (protected) area of the file system, for exclusive and private use by the app.  
> That's where our app's data is stored. 

What kind of data can you include in the bundle? Any kind you want - text-based content, JSON data files, property list (plist) files, images - any kind you want. 

What is the process to get and use the data? We suggest that you use the following guidance:
1. Recognize that an app has a dedicated file system area for storing its data 
2. When the app launches - we recommend that this be done in the data model manager initializer - check whether the app's data file(s) exist 
  * If it does, then use that data and skip the next two tasks
3. If not, it is the first time that the app has launched 
4. Then, read the included data from the bundle, and save it to the app's file system area 

On subsequent app launches, this procedure will guarantee that the correct data gets used by your app. 

While the code example will provide a full understanding of the procedure, the following code snippet will orient you to the procedure to read from the bundle:

```swift
// Create a file system path
let appDocumentsPath = FileManager.default
    .urls(for: .documentDirectory, in: .userDomainMask)
    .first?
    .appendingPathComponent("data-products.json")

var appData = Data()

// Attempt to read from the documents folder
if let path = appDocumentsPath() {
    
    // Path to documents does exist
    do {
        appData = try Data(contentsOf: path)
    }
    catch {
        print(error.localizedDescription)
    }
}
```

While the code example will provide a full understanding of the procedure, the following code snippet will orient you to the procedure to read from the bundle:

```swift
// Create a file system path
let appBundlePath = Bundle.main.path(forResource: "data-products", ofType: "json")

var appData = Data()

// Attempt to read from the bundle
if let path = appBundlePath() {
   
    // Path to bundle does exist
    do {
        appData = try Data(contentsOf: URL(fileURLWithPath: path))
    }
    catch {
        print(error.localizedDescription)
    }
}
```

<br>

#### Resources for learning more 

[UIApplicationDelegate](https://developer.apple.com/documentation/uikit/uiapplicationdelegate) class reference 

[About the App Launch Sequence](https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app/about_the_app_launch_sequence) article 

[Responding to the Launch of Your App](https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app) article

[Performing One-Time Setup for Your App](https://developer.apple.com/documentation/uikit/app_and_environment/responding_to_the_launch_of_your_app/performing_one-time_setup_for_your_app) article 
* A clarification - the data that OUR apps generate, use, and store, should be saved in the "Documents" folder - you'll learn more about that soon 

<br>

### File system

As noted before, the app installation process also creates a "sandboxed" (protected) area of the file system, for exclusive and private use by the app. 

It has a "Documents" folder, to hold the app's data. 

It also has a "Library" folder, to hold assets for the app. These assets can be anything, including data, but the assets typically support the proper and typical operation and use of the app. 

The contents of both folders are automatically backed up to the user's iCloud account. As a result, the user's app data will survive a device replacement. 

The `FileManager` class provides access to the file system, specifically its `default` property. 

<br>

#### Resources for learning more

[File System](https://developer.apple.com/documentation/foundation/file_system) documentation

[Archives and Serialization](https://developer.apple.com/documentation/foundation/archives_and_serialization) documentation; to convert objects and values to and from property list, JSON, and other flat binary representations 

[Encoding and Decoding Custom Types](https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types) documentation; you briefly saw this when you coded structs that inherited from the `Codable` protocol 

[Persist Data](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/PersistData.html) documentation archive; useful as background or fill-in information 

[File System Programming Guide](https://developer.apple.com/library/archive/documentation/FileManagement/Conceptual/FileSystemProgrammingGuide/Introduction/Introduction.html#//apple_ref/doc/uid/TP40010672-CH1-SW1) documentation; a bit older, but much of it is useful and interesting for us as iOS programmers 

<br>

### Web API

(more to come, during week 6 or 7)

<br>

### Core Data

(more to come, during week 8 and beyond)

<br>

### Data model design 

This section will help you design useful _data model objects_ for your iOS app. It is intended for the entry-level iOS app developer. It provides a good object-oriented design pattern that will make your code easier to understand and maintain.

<br>

#### Data model object assumptions

The following are the assumptions about the design and functionality of a model object:

There may be one or more model objects in an app.

A model object's role is to provide a single access point to the app's data for the other parts of the app (which are mostly controllers).

A model object may use any of the available persistence schemes, including the file system, web services, Core Data, and iCloud.

The model object (and _not_ a controller) is responsible for communicating on the network. Async (non-blocking) communication must be used.

<br>

#### Contents of a data model manager

Think about your app's data, and how it should be made available to the app's controllers. Typically, you will need:

* Properties; one for each entity collection
* Functions that accept arguments to filter or sort an entity collection as a return type
* Functions that perform tasks, such as *get one by its identifier*, or *add new item*, etc.

Then, add these members, and their code.

And, it's likely that the model object will also need an initializer. You will learn about this soon.

<br>

#### More discussion

Among other features, a model object provides the user/consumer with access to a “collection” of “items”. Typically, at least one of the model object's properties will deliver an array of results, so that it can be directly used in a table view (UITableView).

The functions will be designed to help with the data service operations, including:
- Get all items (returns a collection)
- Get some items (filtered, returns a collection)
- Get one item (by query)
- New item create
- Modify an item (by query)
- Delete an item (by query)
- Persistence code (e.g. save, load)
- Communication code (e.g. notification, delegation)

> Soon, you will learn how to organize the code in the data model manager to make it more modular, in scenarios where an app has a number of data entities.  
> This technique will help you avoid source code files that run to thousands of lines of code. 

<br>
