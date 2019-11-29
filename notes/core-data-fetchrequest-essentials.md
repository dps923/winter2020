---
title: Core Data fetch request essentials
layout: default
---

## Core Data fetch request essentials

This document introduces you to the essential knowledge needed to understand and use a Core Data *fetch request*. We use a fetch request to get all, some, or one object, from the peristent store, into memory. 

<br>

### Fetch request overview

From the [Apple documentation](https://developer.apple.com/documentation/coredata/nsfetchrequest), a fetch request is a "description of search criteria used to retrieve data from a persistent store."

Continuing, and adapted from the documentation, an instance of `NSFetchRequest` collects the criteria needed to select and optionally to sort [entity objects] in a persistent store. 

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
* fetch one, to match a unique value 
* and perhaps ordered/sequenced in some way

<br>

#### Return type

A fetch request will return *an array* of results. In the array, there will be zero or more objects. (It's unlikely that the return value will be `nil`. If it is `nil`, then there is a serious problem with the app's data storage, rather than a fetch request problem.)

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

From above, a predicate specifies which properties to filter by, and the constraints on selection. The predicate is an object that includes a *predicate string* and typically some *arguments*. 

The predicate can be simple; for example:
* age less than 25
* age less than the current value of a variable 
* company name equals the current value of a variable 

The predicate can also be complex:
* AND and OR conditions 
* runtime determination of the property to filter on (in addition to the property's value)

Here are a few simple examples:

```swift
// Filter the results
fetchRequest.predicate = NSPredicate(format: "age < 25", argumentArray: nil)

// Alternatively
let age = 25
fetchRequest.predicate = NSPredicate(format: "age < %@", argumentArray: [age])
```

The `%@` symbol represents an *object* that will be provided in the *argument* array. The data type of the object can be anything that inherits from object, including an `Int`, a `String`, or even a more complex object (e.g. `NSManagedObject`). 

<br>

Our experience (in this course) is that there is no single authoritative comprehensive source that will explain and show examples of all possible predicate strings. 

Therefore, there are some online resources, from Apple and others, that will enable you to learn more. Here are some links that we'll refer to in class:

[Creating predicates](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pCreating.html#//apple_ref/doc/uid/TP40001793)

[Predicate string syntax](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax.html)

[NSHipster article on predicates](https://nshipster.com/nspredicate/)

<br>

### Sort descriptors

A fetch request can have - if desired - one or more sort descriptors. (More than one? For example, think about a sort by last name, then by first name.)

The `sortDescriptors` property is an optional array of sort descriptor objects. Each sort descriptor object names a "key" to sort on (the data property name), and a true/false value for "ascending". The typical syntax style is to use the `NSSortDescriptor` initializer inline in the statement. 

For example:

```swift
// Sort the results
fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

// Alternatively
fetchRequest.sortDescriptors = [NSSortDescriptor(key: "lastName", ascending: true), NSSortDescriptor(key: "firstName", ascending: true)]
```
<br>
