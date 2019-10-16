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

We will cover these - discuss, show-and-tell, diagram, etc. - in the Wednesday class. While some brief notes are included below, be prepared to [take your own notes](/standards#taking-notes-in-class). 

<br>

### Swift generics

This is a foundational topic, as a brief introduction, but not a lengthy discussion. 

The [Swift generics](https://docs.swift.org/swift-book/LanguageGuide/Generics.html) topic is introduced in the Swift docs. After a brief read/skim, you will see that they're similar to the implementation of generics in other programming languages and frameworks. 

For us, we will use generics to define the data shape (the class) that will be returned by the request. This will be done in a function that does the web API request work. The professor will discuss this technique while covering a code example. 

In the function, here's some essential coding techniques (mostly from the docs). First, the name of the function is followed by a placeholder type name in angle brackets, `<T>`. If we want the type to conform to a specific protocol (e.g. `Decodable`), then the form is `<T:Decodable>`. Bottom line, it's a type name in angle brackets. For example:

```swift
// It needs two parameters, a string path/segment, and a closure function
func sendRequest<T:Decodable>(toUrlPath... //etc.
```

The angle brackets tell Swift that T is a placeholder type name within the function definition. Because T is a placeholder, Swift doesn’t look for an actual type called T. Here's the full declaration of the `sendRequest(...` method:

```swift
// It needs two parameters, a string path/segment, and a closure function
func sendRequest<T:Decodable>(toUrlPath urlPath: String, completion: @escaping (T) -> Void) {
```

The last argument must be a closure function. The `(T)` indicates that the caller will pass in a object of the desired type. For example, this is from the caller code, and you will see that it has declared a function parameter named `result`, and its type is `CoursePackage`: 

```swift
request.sendRequest(toUrlPath: "/Templates_and_solutions/mycourses.json") { (result: CoursePackage) in
  // More code here
}
```

Back in the `sendRequest(...` function, when you are ready to use the incoming object, then it's done this way:

```swift
// Declare an object to hold the incoming data
var results: T? = nil
```

Assuming that (as above) we specified `CoursePackage` as the type when we called the `sendRequest(...` method, this `results` object in this line of code will be a `CoursePackage`. 

<br>

### Web API request factory class

Last week, we introduced the *URL Loading System*, and used the `URLSession` and data task objects to create, configure, run, and respond to web API requests. As you probably noticed, each request was about 50+ lines of code. If we had an app that made a dozen requests of all kinds (GET, POST, PUT, DELETE, OPTIONS, HEAD), then we would have lots of repeated code (and all of its problems). 

Many iOS developers would immediately look elsewhere for a library or whatever to handle web API requests. You don't have to do that. (This approach requires you to search for a solution, learn it, have trust or faith in the skills of other developers, and so on.)

As noted, again, you don't have to look beyond the existing URL Loading System. Instead, take advantage of it. 

Here, you will learn about and study a way to design, create, and use a "factory" that will make a web API request object. Apart from the factory class itself, this reduces the amount of code a request needs to about 10 lines of code. 

The factory class essentially looks like a wrapper for the web API request method code. It has some configurable properties, and one method, `sendRequest(...`

```swift
class WebApiRequest {
  // Define some configurable properties 

  // Send request function
  func sendRequest<T:Decodable>(toUrlPath urlPath: String, completion: @escaping (T) -> Void) {
    // Essentially the code that we learned about
    // for handling a web API request
  }
}
```

The user of the factory class (which is the data model manager, as you will learn) will create an instance of the factory class. Then, if necessary, its configurable properties are set. Finally, the `sendRequest(...` method is called. 

The method takes two arguments:
* A string, representing the path/segment that follows the *base URL* to the web API 
* A closure function (explained below)

<br>

### Data model manager design and implementation 

One of parts of the above-described factory class approach is that it changes how we think about our app design. 

The *data model manager* should be the app's central point for interacting with the data model. As a result, we need to: 
* Ensure that controllers do NOT contain any web API request code 
* Write the data model manager in a way that includes data-oriented methods and properties (no surprise here)

```swift
class DataModelManager {
  // Define properties to hold the data model 

  // Web API request method
  func courseGetAll() {
    let request = WebApiRequest()
        
    // Send the request, and write a completion method to pass to the request
    request.sendRequest(toUrlPath: "/path-to/data.json") { (result: CoursePackage) in

      // Perform some tasks
      // Notify listeners that we're done
    }
  }
}
```

Methods and properties - both? Either? Well, probably both. A *property* will hold the data in-memory. Where does it get its data? From the result of the *method* that does the web API request. 

<br>

### Asynchronous nature of the web API request

At this point, we have accepted that the URL Loading System components we use are asynchronous in nature. After a request is sent, we may get an response, or not. It may respond quickly, or not. 

How do we handle this, in the new configuration? 

First, in the factory class:
* In the "happy case" code we continue to do the same task, which often is a decoding task 
* Then, we run/execute a closure function 

```swift
// Handle the response data
results = try decoder.decode(T.self, from: data)

// Call the closure function (completion)
completion(results!)
```

What? Where did the closure function come from? We provide it in the data model manager:
* Often, we have one or more properties that hold the result of the web API request 
* We then have a method (that users of the data model manager can call) that will create, configure, execute, and respond to the web API request 

One of its arguments is a closure function, that describes what should be done. 

```swift
// Save the result in the manager property
self.coursePackage = result
self.courses = self.coursePackage!.data

// Post a notification
NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
```

Why isn't this code asdded the factory class? Well, it's because it cannot anticipate every possible outcome. The factory class is meant to serve all kinds of requests. As a result, it's best (and only appropriate) to do this work in the data model manager class. 

So, after acknowledging the asynchronous nature of the code bits, we must return to the original task, which is that a controller wants/needs data that will get satisfied by the result of a web API request. How does the original caller - the controller - know when the request has successfully completed? 

We use a messaging system or technique known as local notifications. 

Oh, and one more question: How does the original caller - the controller - know when the request is in progress? By using the network activity indicator, which is an animated spinning wheel glyph, typically located in the device's status bar. 

> Beyond the scope of this course is the use of a full-screen indicator.  
> There are implications of and rules for this approach.  
> For our work here, they're not relevant or useful.  

<br>

### iOS on-device local notifications 

We have used *delegation* before, as a way for an object to notify another object (by calling a method) in response to an event. Delegation requires a reference (whether weak or strong). 

Is there another way? Yes, with *[notifications](https://developer.apple.com/documentation/foundation/notifications)*, which are "design patterns for broadcasting information and for subscribing to broadcasts.

Essentially, notifications work like this:

1. One object, the listener or subscriber (our controller), registers with an iOS runtime service, to listen for a specifically-named notification 

```swift
// Listen for a notification that new data is available for the list
NotificationCenter.default.addObserver(forName: Notification.Name("WebApiDataIsReady"), object: nil, queue: OperationQueue.main, using: { notification in

  // ...see below...    
})

```

2. Another object, the sender or publisher (the data model manager), in response to whatever processing logic, posts a notification with a specific name 

```swift
// Post a notification
NotificationCenter.default.post(name: Notification.Name("WebApiDataIsReady"), object: nil)
```

3. Upon receiving the notification, the listener or subscriber object performs one or more pre-configured tasks 

```swift
// Code that runs when the notification happens
self.tableView.reloadData()
```

This is a "broadcast" or "subscribe and publish" model or pattern. One "broadcaster", and zero or more "subscribers". 

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
