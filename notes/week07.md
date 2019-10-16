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
