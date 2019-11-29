---
title: Core Data model with multiple entities
layout: default
---

## Core Data model with multiple entities

This document presents the highlights of working with a Core Data model that has more than one entity, some of which are related. 

<br>

### Working code example

The code example repo has a `W10a1Entities` code example that you can use when going through this document. The app's data model has three entities:  
1. Company 
2. Employee
3. Product

A company has a collection of employees. And, it has a collection of products. 

When it starts, it shows the logical root data, the list of companies. It enables a disclosure (drill-down) workflow scene. 

<img src="/media/multi-company-list.png" class="border1" alt="Company list" />&nbsp;&nbsp;<img src="/media/multi-company-scene.png" class="border1" alt="Company scene" />

For each company, the scene offers a disclosure workflow to either employees or products. Here's the employees pair of scenes. 

<img src="/media/multi-employee-list.png" class="border1" alt="Employee list" />&nbsp;&nbsp;<img src="/media/multi-employee-scene.png" class="border1" alt="Employee scene" />

Here's the products pair of scenes.

<img src="/media/multi-product-list.png" class="border1" alt="Product list" />&nbsp;&nbsp;<img src="/media/multi-product-scene.png" class="border1" alt="Product scene" />

<br>

### Highlights and differences

Here are the highlights of a multi-entity data model, and the differences from a single-entity data model.

<br>

### In the model editor

Related entities have a *relationship* item. The *name* of the relationship should be meaningful. For example:
* From the perspective of the `Company` entity, the *employees* relationship means that it is related to the `Employee` entitity. And, in its plural form, it implies *to-many*. 
* From the perspective of the `Employee` entity, the *company* relationship means that it is related to the `Company` entity. And, in its singular form, it implies *to-one*. 

In summary, `Company` has a *one-to-many* relationship with `Employee`. 

Make sure you use the inspectors to configure the properties of all attributes and relationships. 

After configuring the entities, attributes, and relationships, the graphical view of the model editor will look something like the following:

![Data model](/media/multi-core-data-model.png)

<br>

#### Property values

Continuing the `Company` and `Employee` example from above, let's look at the `Company` entity. 

You already know the types of the standard attributes (name, country, yearStarted, ceo). They're strings or numbers. 

What type is the "employees" relationship? Well, as a *to-many*, it's a collection. What type of collection. Generically, it's a `Set`. 

> Apple reference document for [Set](https://developer.apple.com/documentation/swift/set).  
> Swift language guide document for [Set](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html#ID484)

Ah, we have not yet worked with a set. Can we use it like an array? Yes, for some tasks. However, for our purposes (mostly in table view controllers), we should probably create or generate an array from the set. Let's get started. 

Assume that we have a reference to a company object:

```swift
let c = fetchedResults[2]
```

We know how to get to its basic property values:

```swift
let companyName = c.name  // string
let companyCeo = c.ceo    // string
// etc.
```

What about its collection of employees?

```swift
let employees = c.employees
// The type of employees will be NSSet
// This is the base class for sets, and is very generic
// For example, it does not let us do this...
let emp = employees[0]
let emp = employees.first
// The following idea will also fail; it won't find "name"
print(emp.name)
```

In that form, it isn't very useful to us. Let's transform it into something we can use better. 

```swift
let employees = c.employees as Set<Employee>
```

Now we can do some tasks with this typed set, but it still isn't very useful to us. We recommend that it be transformed into a sorted array:

```swift
let employees = c.employees?.sortedArray(using: [NSSortDescriptor(key: "name", ascending: true)]) as? [Employee]
```

Do you see what happened? The set has a `sortedArray()` method, and we transform it into an array of `Employee` objects. Sweet. Now we can work with "employees" as we have in the past, because it's now an array. 

<br>

#### Adding a new object, and setting the relationship

Assume that you have a reference to a `Company` object already; its variable name is `c`. 

How do you add a new `Employee` or `Product`?
1. Create the new object 
2. Set its relationship

The relationship can be configured from either direction. In this section, we will configure it from the perspective of the just-added new object. For example:

```swift
// As noted above, assume that you have a reference
// "c" to an existing Company object...

// Create and configure a new employee
let peter = Employee(context: m.ds_context)
peter.name = "Peter McIntyre"
peter.age = 23
// etc.

// Now, set the relationship
peter.company = c

m.ds_save()
```

That's it. If it seems too easy, well, it is easy. 

In the next section, we'll configure the relationship from the other perspective, using functions.

<br>

#### Functions, to set (or remove) the relationship

In addition to the generated properties (above), an entity class will also have generated functions for the related entity. 

For example, a `Company` that has a one-to-many relationship with `Employee` will have the following functions available. Guess what they do? Sweet. 

```swift
// Add one
@objc(addEmployeesObject:)
@NSManaged public func addToEmployees(_ value: Employee)

// Remove one
@objc(removeEmployeesObject:)
@NSManaged public func removeFromEmployees(_ value: Employee)

// Add one or more in a single request
@objc(addEmployees:)
@NSManaged public func addToEmployees(_ value: NSSet)

// Remove one or more in a single request
@objc(removeEmployees:)
@NSManaged public func removeFromEmployees(_ value: NSSet)
```

How would you use these functions? Well, re-using some of the code from above:

```swift
// As noted above, assume that you have a reference
// "c" to an existing Company object...

// Create and configure a new employee
let peter = Employee(context: m.ds_context)
peter.name = "Peter McIntyre"
peter.age = 23
// etc.

// Now, set the relationship
c.addToEmployees(peter)

// Alternatively, if you had just created several
// new employee objects, e.g. "peter" and "jason"...
c.addToEmployees(NSSet(array: [peter, jason]))

m.ds_save()
```

Again, easy.

<br>

#### Fetch requests

The [Core Data fetch request essentials](core-data-fetchrequest-essentials) document introduced fetch requests, and since then you have used them on their own or as part of a fetched results controller (frc). 

In multi-entity related scenarios, is there anything different or new? Yes, but it builds on what you know. There are two situations to learn something about.

First, assume that you have fetched one or more objects (e.g. a `Company`). Then, for one of those objects, you want the collection of related objects (e.g. a collection of `Employee`). Does the fetch request configuration change? *No.* The only thing that changes is that Core Data will behave in an efficient way (performance, processor time, memory usage). How? By delaying the fetching of the related objects (in the collection) until they're actually needed. The programmer or user doesn't see this happen, as it's automatic. The benefit is that the programmer sees lower memory usage and better performance, and the user sees good response time and the data when it is actually needed. 

Next, consider this scenario: 
* There is a scene, a list of `Company` objects 
* It has a segue to an info scene, that displays detailed information about a selected/specific `Company` 
* This info scene has a segue to another list, of `Employee` objects in that `Company` 

What is the *data source* for that `Employee` list scene? 

**One alternative** is that we could pass the collection from the company info scene. For example, if `item` was the `Company` object in the info scene controller, we pass `item.employees`, or pass in the full `item`, and then pull out the employees collection in the employee list scene.

In that situation, the `Employee` list scene would use the collection (as an array) to create the list. This works OK in a display-only scenario, because the data on the list will not change. 

The **other alternative** is to use a fetched results controller to manage the data for the `Employee` list scene. That's a good idea if the data on the list will change (add, delete, edit). 

In this scenario, you want the frc's fetch request to get the *employees* for a specific *company*. What do you do? First, pass the `Company` object from the company info scene to the employee list scene. The, create and configure an frc. 

What's the predicate? Well, you want to ask for all the employees where the employee's "company" property matches a specific company. You already know how to do this if you're string matching, so just do the same for this kind of matching. 

In pseudocode, in the employee list controller, it looks like this:

```
// Assume "c" is the "company" object that was passed in
// The fetch request with predicate is... 

// Fetch all employee objects
// where the "company" property
// matches the passed-in "c" object
```

In actual code, it's going to look something like this:

```swift
// Assume "item" is a "Company" object...
frc = m.ds_frcForEntityNamed("Employee", withPredicateFormat: "company == %@", predicateObject: [item], sortDescriptors: [NSSortDescriptor(key: "lastName", ascending: true), NSSortDescriptor(key: "firstName", ascending: true)], andSectionNameKeyPath: nil)
```

Ah, interesting. 

<br>

### Learning resources and references

[Core Data](https://developer.apple.com/documentation/coredata) topic introductory document. 

[Modeling Data](https://developer.apple.com/documentation/coredata/modeling_data) document. 

[Configuring Relationships](https://developer.apple.com/documentation/coredata/modeling_data/configuring_relationships) document. 

[Generating Code](https://developer.apple.com/documentation/coredata/modeling_data/generating_code) document.  
> Note:  
> The default is to generate code, but we do not see the generated source code files in the project navigator.  
> If [we decide](https://developer.apple.com/documentation/coredata/modeling_data/generating_code#3039135) to generate code, Xcode *will* add source code files to our project, which you can then edit.  
> Totally optional - not necessary for simple scenarios.  

<br>

Older / archive:  
[Creating Managed Object Relationships](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/HowManagedObjectsarerelated.html#//apple_ref/doc/uid/TP40001075-CH17-SW1) document. 

<br>
