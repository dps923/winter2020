---
title: DPS923 MAP523 Week 6
layout: default
---

## DPS923 MAP523 Week 6 Notes

This week and next, we learn how to use the network. 

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
* Review the past interaction we had with the network
* Learn the new / established way 
* Both one-of and a collection 

Covered in class, and some of the same information about [the new / established way](webapi-interaction-intro) to interact with a web API.

Covered in class, and some of the same information about [sending data to a web API](webapi-interaction-more). 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* W06a1FetchIntro 
* W06a2WebApiMore

<br>

### Friday plan

A short time, at the beginning of class, to show-and-tell the "add new" pattern. 

Mostly, time to work on the programming assignment, and get help from a classmate or the professor if you need it. 

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
