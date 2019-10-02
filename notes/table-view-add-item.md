---
title: Table view add item pattern
layout: default
---

## Table view add item pattern

At this point in time, you have some knowledge of and experience with:
* navigation interface
* table view
* data model manager and classes 
* storage

What if you want to *add new items* to your app? This document covers that topic. 

<br>

### Getting started

New items can be added from a number of different sources:
 	* a data entry view that you create as part of the app
 	* a select list with items fetched from the network
 	* on-devices sources, including the camera

How is this done? Using the *add/edit item* pattern. A central feature of this pattern is the *modal view* concept. You have seen modal views before, when we covered the Alerts and Action Sheets topic. 

In the add (and edit) patterns, a modal view provides self-contained functionality in the context of the current task or workflow. It typically covers the entire screen. Also, it usually displays a button that triggers task completion, and a Cancel button that abandons the task. 

It is new and interesting to us that these "done" and "cancel" tasks are coded in the *hosting* or *presenting* controller, and NOT in the modal view's controller. How? This controller source code file also declares a *protocol* that must be adopted by the host/presenter. 

<br>

#### Design and coding task overview

Here is the design and coding approach:

1. Create a controller for the modal view
2. Add code that declares a *protocol* (with at least one method), and add a *delegate* property to the controller
3. Add a new scene to the storyboard (and embed it in a nav controller)
4. Alternate between the scene and controller code to build the user interface and handle events
5. In the controller, add code (to validate and) package the user input, and call the delegate method
6. In the presenting controller, adopt the protocol, code the segue, and implement the delegate method(s)

A *protocol* is a source code module that declares properties and methods for a task. Then, a class in your app can "adopt" the protocol, and provide an implementation for the protocol's members.

> You have seen all this before.  
> Text field delegate, table view controller delegate, etc.  
> What is new is that YOU write the protocol code.  

[Protocols topic](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html) in The Swift Programming Language guide

<br>

(more to come)

<br>
