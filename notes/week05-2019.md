---
title: DPS923 MAP523 Week 5
layout: default
---

## DPS923 MAP523 Week 5 Notes

Last week, we introduced the foundations of a typical substantial iOS app, including the ability to work with multiple scenes, the navigation interface, and using a data model. 

This week, we begin in-depth coverage, and introduce another foundation topic, storage (persistence). 

FYI, a number of new and useful documents have been published in the [Topics](/topics) area of this web site. 

<br>

### Wednesday plan

Discussions, and demonstrations.  
Three segments:
5:10pm - topics  
5:40pm - 5-minute break  
5:45pm - topics  
6:15pm - 5-minute break  
6:20pm - topics  
6:50pm - done  

During the breaks, please get up and move around. It's important for your health, and for mental performance. 

Plan for this week:
* Storage (persistence) introduction
* Data model design and implementation 
* Substantial app design 
* Table view and cell configuration 
* Interaction pattern - add new item 

Covered in class, and some of the same information about [data model storage](data-model-storage). 

Covered in class:
* Substantial app design 
* Table view and cell configuration 

Covered in class, and much the same information about the [table view add item](table-view-add-item) pattern. 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* File system storage, simple text file 
* File system storage, JSON, load from app bundle
* Multi-scene app, nav interface, table view, etc. 

<br>

### Friday plan

Come to class prepared to deploy an app to an iOS device, and demonstrate that to the professor. 

Mostly, time to work on the programming assignment, and get help from a classmate or the professor if you need it. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. An app starts up using a specific (7-step) sequence 
1. As developers, we can respond to the app launch by ensuring that there's a launch screen, and nicely-coded components (including the appropriate app delegate methods)
1. We will cover three kinds of on-device *data model* storage for our apps, 1) file system, 2) web API, and 3) Core Data 
1. Other types include Apple iCloud storage, or a local database engine (both with or without sync)
1. A typical app can use more than one of these 
1. We use the data model manager to handle the storage (read/write) 
1. We can also take advantage of app delegate lifecycle methods (which ones?) to save the data model safely
1. The file system is the easiest technique for a simple data model and a simple storage format (e.g. text, JSON, image, etc.)
1. Each installed app gets its own private "sandboxed" area of the file system 
1. The iOS SDK provides us with a URL to the file system storage location 
1. The `Data` class and its methods provide a way to read (and write) - then we must transform (convert) the object into the format we need (e.g. string or an object from JSON)
1. If necessary, the app developer can include starter data in the app's "bundle" 
1. The data model manager has specific design and functionality features 
1. Its implementation includes properties and methods (and be prepared to explain what, how, etc.)
1. There is a defined and rigourous *add item pattern* for an iOS app 
1. Its primary feature is a *custom-written* protocol that defines the behaviour, and conformance to that protocol (by a controller), to *implement* the methods defined in the protocol 
1. This design ensures that the "add new" controller + view can be reused in other parts of the app (and in other apps) without customization
1. "Add new" scenes re ALWAYS presented modally (slide up from the bottom), and should ALWAYS be embedded in a navigation controller 
1. An add new scene ALWAYS has two control buttons, cancel and save
1. The main jobs of the add new scene include 1) handle user interaction, 2) respond to cancel/save, 3) if save, validate and prepare the data, and 4) if save, call the delegate "save" method and pass on the data to be used 
1. The delegate (i.e. the controller) will then use its reference to the data model manager to do whatever it needs to do to persist the new item 

<br>
