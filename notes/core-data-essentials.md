---
title: Core Data Essential Techniques
layout: default
---

## Core Data Essential Techniques

This document briefly summarizes the essential and often-used data service operations in an app that uses Core Data technologies. 

Assume that the current scope has a reference to the app's data model manager object, which in turn has:
* a reference to the Core Data managed object context, 
* a "save" method (which saves changes to the context), and
* a fetched results controller factory. 

<br>

### Create new object, then save

```swift
let peter = Person(context)
peter.name = "Peter"
peter.age = 23
m.context.save()
```

<br>

### Modify existing object, then save

```swift
// Assume that "student" object already exists
student.name = "Peter"
m.context.save()
```

<br>

### Delete existing object

TBA

### Fetch all from an entity collection 

We use a *fetch request* object. The results will be an array of zero or more objects. 

TBA

### Fetch some from an entity collection 

We use a *fetch request* object. Similar to above, but with a predicate. 

TBA

### Fetch one specific object from an entity collection

We use a *fetch request* object. Similar to above, with a predicate, but we're looking for exactly one object, or nil. 

TBA

### Fetch for use in a `UITableViewController`

The table view controller must adopt the xxx protocol. Then, we create a *fetched results controller* (frc). One of the properties of the frc is a *fetch request*, which is configured to meet the needs of the table view (and would be very similar to the "fetch all" or "fetch some" tasks above). 
etc.

TBA

<br>

### Common predicates

I have a separate note about this.

<br>
