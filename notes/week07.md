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

Monday, February 17, 2020 is the Family Day holiday here in Ontario. The College will be closed, and there are no classes. 

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. The `Data(contentsOf:)` initializer is *blocking*, and it's for fetch (HTTP GET) only, so it should NEVER be used in a real app 
1. The URL Loading System is the name of the collection of techniques and code assets that provide access to resources identified by URLs 
1. Loading is an async task, done on a background thread 
1. *The* key component is an `URLSession` object, a "container" which coordinates network tasks 
1. Each task is a `URLSessionDataTask`, which represents the lifetime of ONE specific network task 
1. A data task can be configured to send OR receive
1. It expects and works with in-memory data structures 
1. The data structures are always defined by data model classes 
1. The data task - for fetch (HTTP GET) - needs a URL at a minimum 
1. The data task initializer needs a URL and a closure function (that will execute when the data task completes)
1. Upon completion, the data task calls the closure function, with values for three parameters (data, response, error) 
1. Inside the closure function, we must do three tasks...
1. The first task is to check for an error 
1. The second task is to ensure that the response is what we expect 
1. The third task is to unpack the data
1. Assuming success, the unpacked data is saved (copied or assigned) to an in-memory object (and then used in whatever way you want)
1. Often, we will update the user interface (UI)
1. To update the UI, we must get a reference to the main thread, because the data task is running on a background thread 
1. After the statement that creates and configures a data task, the task does not execute - instead, we must add a statement that executes the task 
1. If we want to *send* data to the web API, we must modify our approach 
1. We use a `URLRequest` object, and configure it with all four things that it needs (URL, method, headers, body) 
1. Other minor changes are needed to prepare the data to be sent and handle the response 

<br>
