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
// For example, it doesn't let us do this...
let emp = employees[0]
let emp = employees.first
// The following idea will also fail; it won't find "name"
print(emp.name)
```

In that form, it isn't very useful to us. Let's transform it into something we can use better. 

```swift
let employees = c.employees as Set<Employee>
```

Now we can do some tasks with this typed set, but it still isn't useful to us. We recommend that it be transformed into a sorted array:

```swift
let employees = c.employees?.sortedArray(using: [NSSortDescriptor(key: "name", ascending: true)]) as? [Employee]
```

Do you see what happened? The set has a `sortedArray()` method, and we transform it into an array of `Employee` objects. Sweet. Now we can work with "employees" as we have in the past, because it's now an array. 

<br>

### Learning resources and references

(more to come)

<br>
