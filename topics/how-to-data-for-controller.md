---
title: How-to Configure data for a controller
layout: default
---

## How-to: Configure data for a controller

In this how-to, we describe how to configure data for a controller. 

The assumption is that a controller needs data of some kind, to do its job and/or to display in the user interface. 

Further, we should follow the pattern that assumes that the controller comes to life with the data it needs to do its job. We will *inject* the data, by writing code in the parent or presenting controller (which is the the injector). 

<br>

### Data for the app

Assume that the data model classes, and the data model manager, already exist. 

For this note, assume also that we are working with a "Product" entity class. Its source code is elsewhere (maybe in a `DataModelClasses.swift` source code file).  It will have properties for identifier, name, price, and probably some others.  

Finally, assume that we have a data model manager (maybe in a `DataModelManager.swift` source code file). It will have members (properties and/or methods) that perform data service operations (e.g. fetch, add, change, save, etc.). 

A single Product object can be a data source for a standard view. Maybe the manager has a "fetch one product" method. 

A collection of Product objects - as an array - can be a data source for a table view. Maybe the manager has a "fetch all products" method. 

<br>

### Prepare the controller

As suggested above, the data needed in the controller could be a single object, or it could be a collection. The important idea is that we must create an *instance variable* to hold the data. 

There are a few different scenarios that we could plan for:

1. We do not need a reference to the manager,  
we just need the data as a single object

2. We do not need a reference to the manager,  
we just need the data as a collection

3. We need a reference to the manager, and  
we need the data as a single object

4. We need a reference to the manager, and  
we need the data as a collection

In the *instance variables* declaration area of the class, declare a *nil* object or an *empty* array of the desired data type. When necessary, declare a manager object too. Here's the code needed for each scenario:

```swift
// Scenario 1 - no manager ref, single object
var product: Product!

// Scenario 2 - no manager ref, collection
var products: [Product] = []
// ...or...
var products: [Product]!

// Scenario 3 - manager ref, and single object
var m: DataModelManager!
var product: Product!

// Scenario 4 - manager ref, and collection
var m: DataModelManager!
var products: [Product] = []
// ...or...
var products: [Product]!
```

<br>

### Prepare the parent / presenter / injector 

As noted above, the pattern we are using assumes that the controller comes to life as a result of some action or event that happens in another controller. You can think of that other controller as a "parent", or "presenter", or "injector". 

You can also safely assume that the injector has the data - and/or a reference to the data model manager - needed by the new controller. 

If your controller is the first one to load in an app, then the injector is the *app delegate* (and its source code is in the `AppDelegate.swift` file). Here's the typical algorithms for the app delegate code:

```swift
// If your controller is a standard view...
// Create an instance of the data model manager 
// Get a reference to your view controller
// Pass on the manager reference to the controller, if needed
// Pass on the data to the controller, if needed
// (one of the two above will be needed)

// If your controller is a table view...
// Create an instance of the data model manager 
// Get a reference to the navigation controller
// Get a reference to your view controller
// Pass on the manager reference to the controller, if needed
// Pass on the data to the controller, if needed
// (one of the two above will be needed)
```

<br>

Alternatively, if your controller loads as a result of some action or event, then we write code in the injector. The code could be in a button-handler action method, or it could be in a segue method. It doesn't matter, as the code is similar. In both cases, either method will also have access to the existing data and/or manager. 

```swift
// If triggered by an action method...
// Create an instance of your controller
// Locate the data that will be passed on (if necessary...)
// Pass on the manager reference to the controller, if needed
// Pass on the data to the controller, if needed
// (one of the two above will be needed)

// If triggered by a segue method...
// In a matching-segue block of code...
// Create an instance of your controller
// Locate the data that will be passed on (if necessary...)
// Pass on the manager reference to the controller, if needed
// Pass on the data to the controller, if needed
// (one of the two above will be needed)
```

<br>
