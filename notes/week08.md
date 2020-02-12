---
title: DPS923 MAP523 Week 8
layout: default
---

## DPS923 MAP523 Week 8 Notes

> Thursday, February 20 - classroom, Test 2  
> Monday, March 2 - topic lecture in the computer-lab

Test 2 is TODAY, Thursday, February 20. 

Next week is study week, and there are no classes.

When we return on Monday, March 2, we will have a topic lecture in the computer-lab room. Core Data is an important technology in iOS apps, and it will be introduced that day. 

What is Core Data? It is an *object design, management, and persistence framework*.  

<br>

### Thursday plan

*Thursday, February 20*

In the first part of the timeslot, Test 2 will be written. It is worth 12%. It covers all topics covered since the last test. 

Here is more and general information about [the upcoming test](test-success-info). 

> Between the Thursday class and the Monday class,  
> there is a week without classes, study week. 

<br>

### Monday plan

*Monday, March 2*

Plan for this week:
* What problem are we trying to solve?
* Key ideas for those new to Core Data 
* Project template for a Core Data enabled app 

We will cover these - discuss, show-and-tell, diagram, etc. - in the Monday class. While some brief notes are included below, be prepared to [take your own notes](/standards#taking-notes-in-class) too. 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* W08a1CDIntro
* W08a2Canada
* TemplateCDv1 (in the templates and solutions folder)

<br>

### Problem? Solution!

What problem are we trying to solve? 

Well, recall our work with on-device storage (using JSON files). It worked for our small-scale simple scenarios. For vast amounts of data, it does not scale well. Nor does it offer a rich way to handle complex and interrelated data. 

Also, recall our work with web API resources. All data is remote, over a network. If we are offline (i.e. airplane mode), then we don't have data. 

So, the problem - or problems really - that we're trying to solve include on-device storage, of potentially vast amounts of data, perhaps complex in its organization. 

The Core Data technologies offer a solution. 

> Are there other solutions?  
> Yes, but coverage is beyond the scope of this course.  
> It is important, in this academic course, to cover the built-in Apple-provided iOS SDK technologies.  
> Learning these will enable you to learn others when you need to later in your remaining academic and then professional careers. 

<br>

### Core Data intro

Read [this document](core-data-intro), which is an introduction to Core Data. 

<br>

#### Key ideas, concepts, terms 

Where do we see Core Data in our app? An important component is the **stack**, which has the code that sets up and configures Core Data for the app. Most of this code is static, and will not need changes or editing. 

One of the important objects that gets configured is the **context** (or more fully, the managed object context). We use the context everywhere in our app (data model manager, controllers). 

The data shapes and interrelationships are defined in a **Core Data model**, which has both a table-driven and graphical way to define and configure our data entities. The Xcode Core Data model editor then generates Swift classes that we can use everywhere in our app. 

Data to-and-from the Core Data store is done with **fetch request** objects. Conceptually, they're similar to the recently learned web API request objects, in that they enable data service operations (e.g. fetch, add, change, etc.). 

Finally, when we're working with a table view controller, we use a wrapper around a fetch request, known as a **fetched results controller**. It is purpose-built to work with a table view controller, and offers many benefits. 

<br>

#### Where can I learn more?

Use the *project template* to create a new project and then become familiar with its features. 

A new document in the Topics area of this web site has [information about the project template](/topics/info-project-template-core-data). 

Another new document in the Topics area of this web site describes [how to use the project template](/topics/how-to-core-data-template). 

Incidentally, usage of Core Data in our apps will continue for the rest of this academic course. In other words, it's not just a topic for the current week. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. Simple data model, few updates? It's OK to persist data as plist or JSON. 
1. Complex data model? Related data entities? Large amounts of data? Core Data technology is the answer. 
1. Core Data is like a database (in that it persists data, acts as an engine or interface to the data, supports querying, etc.). 
1. However, it is not a database like MongoDB or MySQL. It is closer conceptually to language-embedded technologies (like [LINQ](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/concepts/linq/) or [mongoose](https://mongoosejs.com)). 
1. A working definition is that Core Data is *an object design, management, and persistence framework*. 
1. In an app, the presence of a *Core Data "stack"* enables the app to use Core Data technology. 
1. A Core Data *model editor* is used to define entities and their attributes, and relationships among entities. 
1. An awesome feature of the model editor is that it generates Swift classes for the defined entities. 
1. Arguably, the *most important* object in a Core Data app is the *managed object context* (also just known as the *context*). It is a work area for objects that are in memory. 
1. The context supports typical operations like fetch (from the persistent store), add new (programmatically), edit existing, and delete item. 
1. It also supports "save changes", which persists the state of the context to storage. 
1. From the *fetch* perspective, a *fetch request* is an object that works with an entity collection. We can configure results filtering (using a predicate) and ordering (using a sort descriptor). 
1. A *fetched results controller* is a purpose-built object, designed to work with a table view controller. More about that next week. 
1. An app with Core Data can be built from scratch, but you would typically never do that. You would use a project template. 
1. The Xcode-provided templates that use Core Data have a stack that works, but is not suitable for well-designed and architected app. 
1. Most developers use a template, and this course offers `TemplateCDv1` (and `...v2` etc.) templates. Use a template as a base for any new app. 
1. Useful features include the surfacing of the context in the data model manager, and a save task. 
1. It also includes a *fetched results controller* factory, which enables the developer to easily and quickly define one of these objects. 
1. You should be able to learn at least five new coding tasks and strategies by studying the code examples. 

<br>
