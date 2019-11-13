---
title: DPS923 MAP523 Week 9
layout: default
---

## DPS923 MAP523 Week 9 Notes

More work with Core Data this week and next. 

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
* Another project template for a Core Data enabled app 
* Fetch requests explained
* Fetched results controller introduction

We will cover these - discuss, show-and-tell, diagram, etc. - in the Wednesday class. While some brief notes are included below, be prepared to [take your own notes](/standards#taking-notes-in-class). 

<br>

### Topic plan 

Learn via the code examples.

A [version 2](https://github.com/dps923/fall2019/tree/master/Templates_and_solutions) of the project template. 

[Fetch request essentials](core-data-fetchrequest-essentials).

[Fetched results controller essentials](core-data-frc-essentials). 

[Syntax comparisons among data store technologies](core-data-syntax-compare).

[Core Data essentials summary](core-data-essentials). 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* W09a1LoadV1 (programmatic load of some objects)
* W09a2LoadV2 (load from a JSON file in the app bundle)
* TemplateCDv2 (in the templates and solutions folder)

<br>

### Friday plan

Your goal today is to create an app that uses a Core Data store. It will display data based on something that Mockaroo can easily generate. Here's what to do:

1. Use `TemplateCDv2` to create an app. Do the "rename" tasks to a project name that makes sense. 

2. Visit [mockaroo.com](https://mockaroo.com). Generate 150 rows of JSON data. Configure the fields so that you have at least one field that gets values that repeat somewhat (e.g. states, provinces, car makes, etc. - look around; don't be lazy). 

3. Add that JSON file to your project.  

4. Use the code example to learn how to load the JSON data into a Core Data store. 

5. Change the "list" table view controller to display the data. 

In #5 above, we suggest that you use a simpler *fetch request* object first, to fetch the data. 

Then, adapt the code, changing it to use a *fetched results controller* object. Obviously, the cell rendering code will have to change a bit. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. A *fetch request* is an important object in a Core Data app, as you learned last week. 
1. It can be used to fetch all, some (filtered), one (to match a value), and then optionally ordered or sequenced in some way. 
1. A fetch request will return a *typed array* of results. It will typically never have an error, but it's possible that the result array will be empty. 
1. Each generated entity class has a `fetchRequest()` method that will create a fetch request object. 
1. To execute/run the request, use the context's `fetch()` method, and assign the results to a variable. 
1. A *predicate* is an object (in Swift) that enables a developer to filter or constrain the selection, if desired. 
1. A predicate has two important parts, that can be thought of as a conditional statement that you would have anywhere (as in an `if` statment). The first part is the *predicate string*, and the other is the *argument(s)*. 
1. A predicate can be simple, with known and statically-coded string (to identify the filtered property) and argument. For example, "age < 25". 
1. It can also be coded to accept an argument (e.g. "age < %@"). 
1. A predicate can also be dynamic with regards to filter property, and it can be complex by having multiple filter conditions. 
1. The `NSPredicate` class is used to create a predicate. 
1. A *sort descriptor* is an object (in Swift) that enables a developer to order or sequence the selection, if desired. 
1. A fetch request has an array of zero or more sort descriptors. Yes, it's possible to sort results by "age", then by "last name", and finally by "first name". 
1. A sort descriptor has a `key` to identify the property to sort on, and a boolean value to declare whether the results are in `ascending` order. 
1. You should be able to code, almost from memory, the typical create-and-use tasks for a fetch request.
1. In some scenarios (what are they?), it is more useful to use a *fetched results controller* (frc). 
1. Inside a frc, there is a familiar *fetch request* object. 
1. An frc has a convenience method to perform the fetch. The returned results are still a typed array, and put in a `fetchedObjects` property. 
1. The frc is purpose-built to work with a table view controller, as its data source, and listener for events that arise through user interaction. 
1. You should be able to code, almost from memory, the typical create-and-use tasks for an frc.
1. You should be able to learn at least five new coding tasks and strategies by studying the code examples. 

<br>
