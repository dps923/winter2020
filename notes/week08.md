---
title: DPS923 MAP523 Week 8
layout: default
---

## DPS923 MAP523 Week 8 Notes

Core Data is an important technology in iOS apps, and it will be introduced today. 

What is Core Data? It is an *object design, management, and persistence framework*.  

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
* What problem are we trying to solve?
* Key ideas for those new to Core Data 
* Project template for a Core Data enabled app 

We will cover these - discuss, show-and-tell, diagram, etc. - in the Wednesday class. While some brief notes are included below, be prepared to [take your own notes](/standards#taking-notes-in-class). 

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

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* W08a1CDIntro
* W08a2Canada
* TemplateCDv1 (in the templates and solutions folder)

<br>

### Friday plan

Work on the programming assignment, and get help from a classmate or the professor if you need it. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. (to be posted)

<br>
