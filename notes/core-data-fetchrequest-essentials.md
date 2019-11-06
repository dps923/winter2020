---
title: Core Data fetch request essentials
layout: default
---

## Core Data fetch request essentials

This document introduces you to the essential knowledge needed to understand and use a Core Data *fetch request*. 

<br>

### Fetch request overview

From the [Apple documentation](https://developer.apple.com/documentation/coredata/nsfetchrequest), a fetch request is a "description of search criteria used to retrieve data from a persistent store."

Continuing, and adapted from the documentation, an instance of NSFetchRequest collects the criteria needed to select and optionally to sort [entity objects] in a persistent store. 

It frequently also contains:
* A predicate that specifies which properties to filter by and the constraints on selection. If you don’t specify a predicate, then all instances of the specified entity are selected.
* One or more sort descriptors that specify how the returned objects should be ordered.

There are also other aspects of a fetch request that can be configured. 

> In summary,  
> This is like a `find...()` method in MongoDB (or Mongoose),  
> or a SQL `select` statement.

<br>

#### Use cases

As with other database-like storage technologies, the use cases are varied, and include:
* fetch all 
* fetch some, filtered 
* fetch one
* and perhaps ordered/sequenced in some way

<br>

#### Return type

An array of results. Zero or more. (It's unlikely that the return value will be `nil`. If it is `nil`, then there is a serious problem with the app's data storage, rather than a fetch request problem.)

<br>

### Creating and using

Here's a typical "fetch all" use case, assuming a `Person` entity:

```swift
let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

do {
    let results = try m.ds_context.fetch(fetchRequest)
    // Handle the results
} catch let error {
    print(error.localizedDescription)
}
```

The `results` variable is an array with zero or more `Person` objects. 

<br>

### Predicates

(more to come)

The predicate can be simple:
* age less than 25
* age less than the current value of a variable 
* company equals the current value of a variable 

The predicate can also be complex:
* AND and OR conditions 
* runtime determination of the property to filter on (in addition to the property's value)

For example:

```swift
// Filter the results
fetchRequest.predicate = NSPredicate(format: "age < 25", argumentArray: nil)

// Alternatively
let age = 25
fetchRequest.predicate = NSPredicate(format: "age < %@", argumentArray: [age])
```

<br>

Links that we'll refer to in class:

[Creating predicates](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pCreating.html#//apple_ref/doc/uid/TP40001793)

[Predicate string syntax](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html)

[NSHipster article on predicates](https://nshipster.com/nspredicate/)

<br>

### Sort descriptors

(more to come)

A fetch request can have - if desired - one or more sort descriptors. (More than one? For example, think about a sort by last name then by first name). 

For example:

```swift
// Sort the results
fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

// Alternatively
fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastName", ascending: true), NSSortDescriptor(key: "firstName", ascending: true)]
```
<br>
