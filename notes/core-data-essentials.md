---
title: Core Data Essential Techniques
layout: default
---

## Core Data Essential Techniques

This document briefly summarizes the essential and often-used data service operations in an app that uses Core Data technologies. 

Assume that the current scope (typically a controller) has a reference to the app's data model manager object (i.e. `m`), which in turn has:
* a reference to the Core Data managed object context (i.e. `m.ds_context`), 
* a "save" method (which saves changes to the context) (i.e. `m.ds_save()`), and
* a fetched results controller factory (i.e. `ds_frcWithEntityNamed...`). 

Also assume that the Core Data model has entity definitions for `Person` etc. 

<br>

### Create new object, then save

```swift
let peter = Person(context: m.ds_context)
peter.name = "Peter"
peter.age = 23
m.ds_save()
```

<br>

### Create *many* new objects, then save

Do the work in a loop. For example: 

```swift
for i in 1...25 {
    // Create and configure an object
    let person = Person(context: m.ds_context)
    person.name = StoreInitializer.randomString(12)
    foo.age = Int32(StoreInitializer.randomInteger(between: 18, and: 35))
}
// Save all
m.ds_save()
```

<br>

### Modify existing object, then save

Call the [context's "save" method](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/1506866-save) (which is surfaced in the data model manager's `ds_save()` method).

```swift
// Assume that "student" object already exists
student.name = "Peter"
m.ds_save()
```

<br>

### Delete existing object

Call the ]context's "delete" method](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/1506847-delete), then [its "save" method](https://developer.apple.com/documentation/coredata/nsmanagedobjectcontext/1506866-save). 

```swift
// Assume that you have a reference to an existing "student" object 
m.ds_context.delete(student)
m.ds_save()
```

<br>

### Count all items in an entity collection

```swift
let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
let personCount = try? m.ds_context.count(for: fetchRequest)
// personCount will have an integer (or be nil if there's an error)
```

<br>

### Count some items in an entity collection

Similar to above, but with a predicate. 

```swift
let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

// Assume "predicate" has already been defined
fetchRequest.predicate = predicate

let personCount = try? m.ds_context.count(for: fetchRequest)
// personCount will have an integer (or be nil if there's an error)
```


<br>

### Fetch all from an entity collection 

We use a *fetch request* object. The results will be an array of zero or more objects. 

```swift
let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

do {
    let results = try m.ds_context.fetch(fetchRequest)
    // Handle the results
} catch let error {
    print(error.localizedDescription)
}
```

<br>

### Fetch some from an entity collection 

Similar to above, but with a predicate. 

```swift
let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

// Assume "predicate" has already been defined
fetchRequest.predicate = predicate

do {
    let results = try m.ds_context.fetch(fetchRequest)
    // Handle the results
} catch let error {
    print(error.localizedDescription)
}
```

<br>

### Fetch one specifically-requested object from an entity collection

We use a *fetch request* object. Similar to above, we use a predicate, but we're looking for exactly one object. 

Therefore, look at the results array. If it has zero objects, then the object was "not found". 

If it has one object, then the object was "found", and you can use it. 

If it has more than one object, and you were expecting only one (or none), then study the data model and then modify the predicate to improve the fetch results. 

<br>

### Fetch for use in a `UITableViewController`

The table view controller must adopt the `NSFetchedResultsControllerDelegate` protocol. 

Then, we create a *fetched results controller* (frc). One of the properties of the frc is a *fetch request*, which is configured to meet the needs of the table view (and would be very similar to the "fetch all" or "fetch some" tasks above). 

Code the controller load and table build methods to use the frc properties and methods. 

<br>
