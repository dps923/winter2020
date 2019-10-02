---
title: DPS923 MAP523 Week 4
layout: default
---

## DPS923 MAP523 Week 4 Notes

This week, we begin to learn how to design and create a substantial app with many features, now that you have some good foundation skills and techniques. 

If your Mac automatically updated Xcode to version 11, and you want to continue to use the previous version 10, [this document can help](xcode-previous-version). 

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

Tentative plan for this week:
* Info about and prepare for the first written test
* Apple Developer and deploy app to device 
* Designing a substantial multi-scene app 
* The "navigation" style of app 
* Data model design and implementation 

Here is information about [the upcoming test](test-success-info). 

Here is information about [deployment](xcode-deploy). 

Here is information that introduces a [navigation style app](navigation-controller-essentials). 

Here is information that introduces the [data model essentials](data-model-essentials) topic. 

<br>

#### Designing and implementing a substantial multi-scene app

Until today, the apps we have created, and the apps that you have coded, have had one "scene". 

> From [the docs](https://developer.apple.com/library/archive/documentation/ToolsLanguages/Conceptual/Xcode_Overview/DesigningwithStoryboards.html), a *scene* represents an onscreen content area.  
> As a code asset, it is a custom XML syntax, and is managed by Xcode during development, and by iOS at runtime, so we never have to work directly with the code asset as programmers. 
> On iOS, a scene fills the screen.  
> And, you have learned that a scene is paired with a controller. 

From now on, it is likely that all of the apps will have multiple scenes. App design is more important now.

> When we write "app design", we do NOT mean its visual or graphic design. Instead, we are interested in how the app's code is designed in a way that conforms to guidance, best practices. That typically means a modular design, with known responsibilities, separation of concerns, and well-defined interfaces. 

As a result, BEFORE we begin coding, we must perform some tasks. After a few weeks, you have learned how to code the basics, and you're ready for this topic. The tasks include: 

* Think before you code. 

* Sketch out your app design, using actual paper-and-pencil or with a whiteboard. 
  * Use rectangles to represent scenes, and arrows to connect the scenes. 
  * Use rectangles to represent notable code modules (e.g. data model manager), and lines to connect them to scenes. 

* Know about and depend on the standard way to support scene transitions. 

* Then write code, a scene + view controller at a time. 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* Navigation intro
* Data model intro 

<br>

### Friday plan

In the first part of the timeslot, Test 1 will be written. Here is information about [the upcoming test](test-success-info). 

Then, in the remaining time, work on the programming assignment, and get help from a classmate or the professor if you need it. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. App "design" refresher; modular code, separation of concerns
1. The value of sketching (hand drawing) the scenes in an app 
1. Navigation interface style of app intro and characteristics 
1. Apple's definition of a scene 
1. Segues between scenes
1. Navigation controller introduction 
1. Nav controller is a "container", and manages a sequence of view controllers, organized as a stack 
1. Nav controller manages the navigation bar, with three standard areas (left, center, right) 
1. Setting the title that appears in the nav bar center; the procedure for the first controller is a bit different from the others 
1. Navigation interface segue kind/type is "Show"
1. On the storyboard, the nav controller is the app's "entry point" 
1. Segue must be triggered by a user interaction event (button, table view row selection)
1. We must follow a "prepare pattern" before segueing (transitioning) to the next controller
1. This preparation is done in the hosting/triggering controller, in the `prepare(for: sender:)` method 
1. Developers build iOS apps by following the MVC pattern 
1. Controllers can "mediate" (e.g. our view controller subclasses), "coordinate" (e.g. app delegate), or "model" (e.g. data model manager)
1. Data model communicates with a controller 
1. Data model is implemented in code with typically two source code files; one defines the data entity shapes, and the other manages the data service operations (setup, import/export, persist, CRUD, transform) 
1. iOS app creates a single instance of a data model manager, and ensures that it is passed among controllers 

<br>
