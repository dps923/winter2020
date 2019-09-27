---
title: Data model essentials
layout: default
---

## Data model essentials

Developers build iOS apps by following the MVC pattern. 

> Read about MVC in [this older Apple Developer document](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Model-View-Controller/Model-View-Controller.html).  
> Read the first third for sure, down to the "Types of Cocoa Controller Objects".  
> Do this before continuing. Yes, it's important.  
> Then you can skim-read some of the remaining sections.  

Welcome back. 

This document helps you get started with the "M" part, the data model. 

<br>

### V = view, C = controller

At this point in your learning experience, you have a good-enough understanding of views and controllers. In an iOS app, when running, is an object that renders a screen of content. Its matching or managing controller is an object that provides some of the content for the view, handles user interaction events. 

<br>

### M = model

In some previous single-scene apps, we have created a model object as either a simple string variable, or as a collection (of strings or some other kind of objects). That was done right in the controller code. 

In a normal and substantial app, we have a separate source code file - implemented as a Swift class - that holds and manages the data. It has public variables (properties) that make the data available to external users of the data model. It also has public functions (methods) that enable data service operations (e.g. create, read, update, delete, transform, etc.). 

When the data model's complexity grows - for example, two or more entities - we typically have another separate source code file - implemented as Swift classes and/or structs - to hold the data entity's shape or structure definition. 

<br>

#### What are the benefits of this design?

It's good design, and implements the [separation of concerns](https://en.wikipedia.org/wiki/Separation_of_concerns) principle. 

The data model design becomes the single place in an app to describe and manage its data. It centralizes and is responsible for this task. Controllers do not need to worry about data management, and you won't have data-related code scattered around your app. 

It enables easier maintenance and enhancements. For example, adding another entity will not break the existing code. We just 1) add the new data shape classes or structs, and 2) add methods that do data service operations. 

And similar to other programming environments, the design enables an object-oriented way to look at the real-world data we use in an app.

<br>

#### What does this look like? 

Open and study the "data model intro" code example in the repo (W04a2DataModelIntro). 

Notice that it has a `DataModelClasses.swift` source code file, with classes or structs that define the data shape. 

The app also has a `DataModelManager.swift` source code file, which is the data model, with methods that do data service operations (init, CRUD, transform, etc.). 

Another important feature is that we modify the `AppDelegate.swift` source code file for the first time. Why? We create a single instance of the data model manager for the app, and then pass it along to the other objects (e.g. controllers) that need access to the data model. 

Study the code in the controllers, to learn something about the flexible way in which you can use the data model manager, and its properties and methods. 

<br>
