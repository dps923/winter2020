---
title: DPS923 MAP523 Week 7
layout: default
---

## DPS923 MAP523 Week 7 Notes

> Thursday, February 13 - classroom lecture  
> Monday, February 17 - NO CLASS TODAY - it's the Family Day holiday

More networking this week. We learn about a technique to modularize the web API request into an object. This enables scale, reliability, and repeatability. 

Test 2 is NEXT Thursday, February 20. 

<br>

### Thursday plan

*Thursday, February 13*

Plan for this week:
* Swift generics
* Web API request factory class 
* Data model manager design and implementation 
* iOS local (on-device) notifications

We will cover these - discuss, show-and-tell, diagram, etc. - in the Thursday class. 

While the [topic notes](webapi-interaction-foundations) are included [here](webapi-interaction-foundations), be prepared to [take your own notes](/standards#taking-notes-in-class) too. 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* W07a1NewFetch
* W07a2NewMore
* W07a3FetchMany

<br>

### Monday plan

*Monday, February 17*

Monday, February 17, 2020 is the Family Day holiday here in Ontario. The College will be closed, and there are no classes. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. Swift has generics, which enable code to handle objects that are based in different types 
1. We will use generics to define the data shape that will be returned by a web API request factory class method 
1. Swift generics use a familiar coding style seen in other languages, e.g. `<T>` and `T` as type placeholders (depending on the usage context)
1. The size of the code base in an app with a dozen or more web API requests can grow unless we use a factory, which is a code-saving technique 
1. Our first factory is the `WebApiRequest` class, which does as its name suggests 
1. It is used (created, configured, executed) by callers, which are methods (one or likely more) in the data model manager (in our recommended architecture) 
1. The design of the factory is as generic and reusable as possible 
1. For a single-use request, the request code can be written in the controller 
1. For complex scenarios and those with reusable or repeatable requests, the data model manager now takes over - from last week's simple web API request code examples - the job of communicating with the web API (and making response data available somehow)
1. Manager properties are typically used to make the data model available 
1. Manager methods are used to execute requests 
1. Each request defines its own instance of the factory class, with custom configuration (e.g. path/segment, response data type expected)
1. The configuration of a factory class instance for a POST request - when compared to what we must do for a GET request - requires more configuration (set the HTTP method, and prepare/encode the entity body data to be sent with the request)
1. In this new design, URL Loading System requests are *still* asynchronous, which is challenging, and implemented with two design-and-coding actions
1. In the factory class, the generic code simply calls a closure function (that gets passed in)
1. In the data model manager class, the function call includes the closure function (completion handler code) 
1. We still need a way to tell the caller when the web API request completes - we use a *notification* 
1. Notifications are design patterns for broadcasting info and subscribing to broadcasts 
1. There is one broadcaster, and zero or more subscribers 
1. The "message" that's posted by a broadcaster can be custom and unique, when compared to other broadcasts 
1. The broadcaster posts a notification after completing a piece of work 
1. At the subscriber end, one of its startup tasks includes a statement that subscribes to a specific / custom / unique broadcast, and specifying a closure function to execute if/when the notification comes in 

<br>
