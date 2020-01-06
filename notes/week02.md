---
title: DPS923 MAP523 Week 2
layout: default
---

## DPS923 MAP523 Week 2 Notes

> Thursday, January 9 - classroom lecture
> Monday, January 13 - hands-on in the computer-lab  

The theme for this week is to learn and experience a number of user interaction capabilities and techniques. Along the way, you will work with more/new UI objects, and the lifecycle of an iOS app.  

<br>

### Thursday plan

Continue getting comfortable with the iOS developer environemnt and tools. 

To start the session, we will probably briefly cover the leftover topic(s) from Monday, [UI object table view](https://dps923.ca/notes/interaction-essentials#ui-object---table-view) (and any other leftover topic(s)). 

Here's a link to the [interaction essentials notes](interaction-essentials).

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* Text field, button, label 
* More text field interaction; delegation
* Picker view, data source and delegate 
* Table view

<br>

### Monday plan

Then, we discuss a new topic in the first programming assignment - requesting data from a web API. The [topic notes are linked here](webapi-request-intro-sync). 

We will also get a gentle [introduction to debugging](debug-intro). 

Then, your professor will discuss the grading expectations for the programming assignment. 

There will be time available to work on the programming assignment, but not enough to complete it. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. Xcode code "re-indent" (select, then Ctrl+I)
1. Role of the iOS "runtime" as the code that is in control of your device, and the app that is currently running on it 
1. The code we write does NOT control the logic flow and workflow, it merely reacts to it 
1. iOS apps are *stateful*, and remain in memory until forcibly removed (by the user or iOS)
1. The role of a delegate in an iOS app (definition, meaning, interpretation)
1. Examples of delegating objects include text field, picker view, table view 
1. The coding technique(s) to implement delegation 
1. Another UI object, text field
1. Many string-like UI objects have a `.text` property, while number-like UI objects have a `.value` property 
1. Text field and delegation, and some of its useful delegate methods 
1. Dismissing the on-screen keyboard when appropriate 
1. Another UI object, picker view 
1. The idea or concept of a "data model", and our initial implementation of it as a simple array 
1. Building a picker view from a data source 
1. Handling picker view events with delegate methods, and NOT with action connections 
1. Another UI object, table view, and creating a new Cocoa Touch Class, as a subclass of UITableViewController 
1. Building a table view from a data source (i.e. a data model), and handling table view events with delegate methods 
1. The idea of a "prototype cell" to define the layout / format / content of each cell in a table view 
1. Gentle introduction to the role of a "navigation controller" and what it gives us (now - title area, and other features in the future including workflow and action buttons)
1. The relationship between the prototype cell's "Identifier" (in the attributes inspector) and the "identifier" value in the cell-building delegate method (i.e. the string values MUST match)
1. Apple's UIKit Catalog code example 
1. Gentle introduction to debugging 
1. Using documentation in the code editor (cursor to a symbol, then Option+click for help pop-up)

<br>
