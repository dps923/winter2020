---
title: Core Data Intro
layout: default
---

## Core Data Introduction

Core Data is an object design, management, and persistence framework.

It enables you manage the lifecycle of objects and [object graphs](https://developer.apple.com/library/ios/Documentation/General/Conceptual/DevPedia-CocoaCore/ObjectGraph.html) that are *in memory*. 

The object graph can be simple (e.g. a variable, or an entity object, or a collection), or it can be complex (e.g. many entity object collections, some of which are related to others). 

> Also, read the brief Wikipedia article on [object graph](https://en.wikipedia.org/wiki/Object_graph).

In our apps, we are always using *objects* and *collections* of objects, in memory. Core Data enables us to focus on these programming constructs, without worrying about storage-related concerns. In our program code, we use built-in Swift language-based querying to do the typical data service operations (e.g. load, fetch, add, change, save, etc.). 

> The file format of Core Data on-device storage is essentially unimportant to us.  
> While it is typically stored in a relational database management system (based on SQLite), we do not, can not, and must not think of Core Data as a database.  
> Comparing and/or equating Core Data and relational database management system technologies (including ORM, object-relational mapping) *is a mistake*.

Designing a class in Swift, and designing an **entity** in Core Data model editor, are very similar.

A Person class in Swift might look like this:

```swift
class Person {
    var firstName: String?
    var lastName: String?
}
```

Similarly, the *Core Data model editor* enables us to design an entity named "Person", and it would have two property attributes named "firstName" and "lastName", both of type String. 

Here's the editor in table view:

![Editor table view](/media/cd-intro-model-editor-table.png)

<br>

Here's the editor in graph view:

![Editor graph view](/media/cd-intro-model-editor-graph.png)

<br>

### How do I get started?

Use a **project template**. In the course's GitHub repository, in the [Templates_and_solutions](https://github.com/dps923/fall2019/tree/master/Templates_and_solutions) folder, 
you will see a project named **TemplateCDv1**.

Make a copy of that, and you will have all you need to start working on a new project.

> How do I make a copy?  
> The "readme" file in the project helps you do this.

<br>

### Where do I go from here

Pay attention to the topic discussion and delivery from your professor. This is a challenging topic set, and your professor will guide you through the thought process and skill acquisition phase. 

Get the "Canada" code example that's in the Week 8 folder of the repository. Study all parts of that app. Use it, add data, notice its features and functionality. 

<br>

### Apple reference info

Apple has a start page for the [Core Data framework](https://developer.apple.com/documentation/coredata). It has an overview, and links to topics. 

Apple also publishes a [Core Data Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html). 

While useful, essential, and authoritative, it does not include the advanced engineering that has been put into the template (above). As a result, when you're going through the Apple programming guide, read critically, in the event that something it covers (e.g. "Initializing the Core Data Stack") sounds different that what you've learned recently. 

> You will notice that the programming guide's most recent revision was a couple of years ago. 

<br>
