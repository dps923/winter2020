---
title: Fetched results controller essentials
layout: default
---

## Core Data fetched results controller essentials

This document introduces you to the essential knowledge needed to understand and use a Core Data *fetched results controller*, abbreviated as "frc". We use an to wrap a fetch request, for use in a table view controller. 

<br>

### Fetched results controller overview 

From the [Apple documentation](https://developer.apple.com/documentation/coredata/nsfetchedresultscontroller), an frc is a "controller that you use to manage the results of a Core Data fetch request and to display data to the user."

Continuing, and adapted from the documentation, an instance of `NSFetchedResultsController` helps with lists. A table view expects its data source to provide cells as an array of sections made up of (arrays of) rows. An frc is configured with a fetch request that specifies the entity, an array containing at least one sort ordering, and optionally a filter predicate. The frc efficiently analyzes the result of the fetch request, and computes all the information about sections (and an index, if used or desired) in the result set. 

In addition, an frc can optionally monitor changes to the data objects, and report on those changes, so that the hosting controller can update the user interface. This is done by making the controller adopt the `NSFetchedResultsControllerDelegate` protocol. 

<br>

### When to use an frc

Assume a scenario where you need a table view to show a list of items. You have a choice:
* Do you use a *fetch request* to get the items?
* Or do you use a *fetched results controller*? 

Here's how to make a decision - ask these questions:
* The list's content - is it dynamic? (i.e. is there a possibility of change during viewing)  
* Is the list editable? (i.e. move, add, delete)  
* Do we need grouped items? (e.g. list of employees, grouped by company)  

If you answered *yes* to any of these, use an frc.  
Otherwise, a fetch request object will do the job.  

<br>

### Creating and using

An frc includes a *fetch request* object. In effect, it's a wrapper for a fetch request. In addition, an frc has a `performFetch()` method that runs the fetch request, and places the results in a property named `fetchedObjects`, which is an array of entity objects. 

While you can create and configure an frc using the class initializer and then properties, students in this course should use the frc "factory" that's included in the project template "TemplateCDv2". The frc factory makes it really easy, in one line of code, to create a typical frc. 

Always create an frc in the table view controller. Almost always, make the controller adopt the `NSFetchedResultsControllerDelegate` protocol. 

Here's a typical coding strategy, assuming a `Person` entity:

```swift
// Declare a local variable in the controller
private var frc: NSFetchedResultsController<Person>!

// Then, in viewDidLoad(), initialize the frc
frc = m.ds_frcForEntityNamed("Person", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: [NSSortDescriptor(key: "province", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:))), NSSortDescriptor(key: "city", ascending: true)], andSectionNameKeyPath: nil)

// Configure; this controller will be the frc delegate
frc.delegate = self;

// Perform fetch, and if there's an error, log it
do {
    try frc.performFetch()
    // If successful, the results will be in the 
    // frc's fetchedObjects property
} catch let error {
    print(error.localizedDescription)
}
```

<br>

#### Using the results, all objects

The frc's `fetchedObjects` property holds the fetched results, as an array of entity objects. 

```swift
// How many items are in the results?
let personCount = frc.fetchedObjects.count
```

<br>

#### Using the results, one specific object 

An frc has an `object(at:)` method. Its parameter is an index path (i.e. a section number and a row number), and it will return one entity object. 

```swift
let item = frc.object(at: indexPath)
```

<br>

#### Using section info

In the frc factory method, the last argument is `andSectionNameKeyPath`. It can be `nil` (i.e. no section info), or its value can be set to the name of an entity property (e.g. "province"). 

If you want sections, then ensure that this table build method is in the controller:

```swift
// What is the section title?
override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    // Get a reference to the section object in the frc
    // And make sure there is a section name
    if let s = self.frc.sections?[section], s.name.count > 0 {
        return "Your custom prompt for \(s.name)"
    }
    return nil
}
```

<br>
