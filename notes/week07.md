---
title: DPS923 MAP523 Week 7
layout: default
---

## DPS923 MAP523 Week 7 Notes

More networking this week. We learn about a technique to modularize the web API request into an object. This enables scale, reliability, and repeatability. 

Test 2 is on Friday. 

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
* Swift generics
* Web API request factory class 
* Data model manager design and implementation 
* iOS local (on-device) notifications

In the Wednesday class, be prepared to [take your own notes](/standards#taking-notes-in-class). 

Covered in class, and some of the same information about TBA. 

Covered in class:
* TBA

<br>

### Swift generics

This is a foundational topic, as a brief introduction, but not a lengthy discussion. 

The [Swift generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) topic is introduced in the Swift docs. After a brief read/skim, you will see that they're similar to the implementation of generics in other programming languages and frameworks. 

For us, we will use generics to define the data shape (the class) that will be returned by the request. The professor will discuss this technique while covering a code example. 

<br>

### Web API request factory class

Last week, we introduced the *URL Loading System*, and used the `URLSession` and data task objects to create, configure, run, and respond to web API requests. As you probably noticed, each request was about 50+ lines of code. If we had an app that made a dozen requests of all kinds (GET, POST, PUT, DELETE, OPTIONS, HEAD), then we would have lots of repeated code (and all of its problems). 

Many iOS developers would immediately look elsewhere for a library or whatever to handle web API requests. You don't have to do that. (This approach requires you to search for a solution, learn it, have trust or faith in the skills of other developers, and so on.)

As noted, again, you don't have to look beyond the existing URL Loading System. Instead, take advantage of it. 

Here, you will learn about and study a way to design, create, and use a "factory" that will make a web API request object. Apart from the factory class itself, this reduces the amount of code a request needs to about 10 lines of code. 

<br>

### Data model manager design and implementation 

One of parts of the above-described factory class approach is that it changes how we think about our app design. 

The *data model manager* should be the app's central point for interacting with the data model. As a result, we need to: 
* Ensure that controllers do NOT contain any web API request code 
* Write the data model manager in a way that includes data-oriented methods and properties (no surprise here)

Methods and properties - both? Either? Well, probably both. A *property* will hold the data in-memory. Where does it get its data? From the result of the *method* that does the web API request. 

<br>

### Asynchronous nature of the web API request

At this point, we have accepted that the URL Loading System components we use are asynchronous in nature. After a request is sent, we may get an response, or not. It may respond quickly, or not. 

How do we handle this, in the new configuration? 

First, in the factory class:
* In the "happy case" code we continue to do the same task, which often is a decoding task 
* Then, we run/execute a closure function 

What? Where did the closure function come from? We provide it in the data model manager:
* Often, we have one or more properties that hold the result of the web API request 
* We then have a method (that users of the data model manager can call) that will create, configure, execute, and respond to the web API request 

One of its arguments is a closure function, that describes what should be done. 

Why isn't this done in the factory class? Well, it's because it cannot anticipate every possible outcome. It's best (and only appropriate) to do this work in the data model manager class. 

So, after acknowledging the asynchronous nature of the code bits, we must return to the original task, which is that a controller wants/needs data that will get satisfied by the result of a web API request. How does the original caller - the controller - know when the request has successfully completed? 

We use a messaging system or technique known as local notifications. 

<br>

### iOS on-device local notifications 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* W07a1NewFetch
* W07a2NewMore
* W07a3FetchMany

<br>

### Friday plan

In the first part of the timeslot, Test 2 will be written. It is worth 12%. It covers all topics covered since the last test. 

Here is more and general information about [the upcoming test](test-success-info). 

Then, in the remaining time, work on the programming assignment, and get help from a classmate or the professor if you need it. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. (coming soon)

<br>
