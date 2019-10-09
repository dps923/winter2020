---
title: Web API interaction intro
layout: default
---

## Web API interaction intro

The iOS SDK has classes that enable an app to interact with a web API. This document introduces you to the essential knowledge and techniques for fetching data from a web API, and materializing it in an app as Swift objects. 

Another separate document will cover other interaction topics, including sending data to a web API. 

<br>

### Introduction

You will recall a task in Assignment 1, where you fetched data, represented in JSON, from one of your GitHub repos, into your app, to display on a table view. 

That task used a `Data(contentsOf:)` constructor. It was easy to understand, and easy to use:
* It required a URL
* The constructor returned a [Data](https://developer.apple.com/documentation/foundation/data) object 
* We then used a decoder to create an in-memory (Swift) object

Despite its apparent benefits, we will not use this technique any longer. Why?
* It is a synchronous task, and blocks or prevents further execution 
* It is inflexible, because it can be used only for simple fetches 

Instead, we will use URLSession. 

<br>

### URL Loading System, URLSession, and URLSessionTask

In the iOS SDK, the "[URL Loading System](https://developer.apple.com/documentation/foundation/url_loading_system) provides access to resources identified by URLs, using standard protocols like `https`. Loading is performed asynchronously, so your app can remain responsive..." 

> Follow the links to the Apple documentation.  
> Read/skim the contents, and remember to return in the future when needed.

The key component in the URL Loading System is an instance of the [URLSession](https://developer.apple.com/documentation/foundation/urlsession) class. It is an "object that coordinates a group of related network data transfer tasks".

A group? For now, let's just focus on one - fetching data from a web API, and materializing it in an app as Swift objects. 

For that, we will use a *data task*, which is an instance of [URLSessionDataTask](https://developer.apple.com/documentation/foundation/urlsessiondatatask), which "send[s] and receive[s] data using NSData objects. Data tasks are intended for short, often interactive requests to a server." It "returns downloaded data directly to the app in memory." 

In our apps, for each interaction with a web API, we will create a task. The task lifetime is limited - a task gets created, it executes, then handles the response, then is disposed of. For example, if we have an app that needs a collection of "customers" to display in a list (table view), one task will do that. Then, after a navigation interface "drill down" action, if we need a specific "customer", a separate task will do that. 

In summary:

* The URL Loading System is the name of the *collection of techniques and code assets* that provide access to resources identified by URLs.

* In our app, we use an instance of `URLSession` as a container to coordinate tasks. 

* For each request (to a web API), we create, configure, and use an instance of `URLSessionTask`, which executes the request and handles the response. 

<br>

### How to implement

We need the following:
* A URL to the web API resource 
* Data model classes that define the shape of the resource's representation 
* A data task object, with a correct and complete closure (function) as a task completion handler 

Let's get started. We will do this - for now - in a table view controller in a new app that has a navigation interface. Create a function that will hold the logic. Then we can call the function from the controller's `viewDidLoad()` method. 

> Open and study the code example from the repo.  
> It's named `W06a1FetchIntro`. 

<br>

#### URL to the web API resource

As you did in Assignment 1, store a JSON file on a publicly-accessible endpoint. Then get the URL string, and make a URL object. 

```swift
let url = URL(string: "https://raw.githubusercontent.com/your-account/repo-name/master/path-to/data.json")!
```

Obviously, we must also know what the resource's representation is. For most of our web API requests, we can assume JSON (which is "application/json"). 

<br>

#### Data model classes

Study the data structure(s) in your JSON file. Then create classes that match. (For this simple fetch/GET example, we do not need an initializer.) 

<br>

#### Data task object

Before continuing, read this Apple document:  
[Fetching Website Data Into Memory](https://developer.apple.com/documentation/foundation/url_loading_system/fetching_website_data_into_memory)

> Again, follow the links to the Apple documentation.  
> Read/skim the contents, and remember to return in the future when needed.

Create (define) a data task object. 

```swift
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    // more to come
}
```

Notice a few things about this statement:
* It expects a closure (function) as a completion handler 
* Three parameters must be defined, in this order:<br>
data (the actual data), response (HTTP response), error (if any)

Then, as stated in the documentation, your completion handler needs to do three things:
1. Verify that the error parameter is nil. If not, a transport error has occurred; handle the error and exit.
2. Check the response parameter to verify that the status code indicates success and that the MIME type is an expected value. If not, handle the server error and exit.
3. Use the data instance as needed.

The `response` parameter will ALWAYS be present. 

For the other two, one will be nil:
* If there's no `error`, then `data` will have something
* Alternatively, if `error` exists, then `data` will be nil

Continuing:

<br>

##### 1. Verify that the error parameter is nil

```swift
if let error = error {
  // handle, then...
  return
}
```

<br>

##### 2. Check the response parameter

We're going to use a `guard let`:

```swift
guard let httpResponse = response as? HTTPURLResponse,
    (200...299).contains(httpResponse.statusCode)
    else {
        // handle, then...
        return
}
```

It's possible that you haven't seen a `guard let` before. It has one more feature when compared to an `if let` - it MUST include an `else` block, and return from that block. 

It's also possible that you haven't seen *two* conditions in an `if let` (or now a `guard let`) before. It's simply a way to have more than one condition as the test. Here, we have two conditions:
1. The `response` object cannot be nil and must be an `HTTPURLResponse` type, and 
2. The HTTP response status code must be in the range 200 through 299 inclusive.

<br>

##### 3. Use the data instance

We're going to use an `if let` with *three* conditions, before we attempt to use the data instance:

```swift
if let mimeType = httpResponse.mimeType,
    mimeType.starts(with: "text/plain"),
    let data = data {
    
    // handle
    }
}
```

What do we want to do with the incoming data? The answer to that *completely* determines our coding approach. 

Here, we know that the data is a JSON resource, so we want to use a JSON decoder to help us. That gets wrapped in a `do-try-catch` block, as we have done before (when working with the file system). 

Next, if it decodes correctly, we want to save the data (or some of it), in an instance variable. For example:

```swift
// Assuming "items" is an instance variable...
// We MUST use "self." when inside a closure
self.items = result.data
```

Finally, we often use the fetched data in the user interface. Here, we want the data to display in the table view. Can we just call `tableView.reloadData()`?

Nope. Why? The data-fetching task, and its completion handler, execute on a background thread. The closure block must NOT attempt to call a method of a user interface object (i.e. the table view). 

How to fix? Get a reference to the threading system, specifically the `main` thread, and call the method from that block. For example:

```swift
DispatchQueue.main.async {
    self.tableView.reloadData()
}
```

What does this mean?
* We want to `reloadData()` on the `tableView` 
* Where? On the `DispatchQueue.main` 
* When? Now
* Wait? No, because of the presence of the `async` call

From [the docs](https://developer.apple.com/documentation/dispatch/dispatchqueue), `DispatchQueue` is an object that manaes the execution of tasks on your app's main thread or on a background thread.

From [the docs](https://developer.apple.com/documentation/dispatch/dispatchqueue/1781006-main), `main` is the dispatch queue associated with the main thread of the current process. 

From [the docs](https://developer.apple.com/documentation/dispatch/dispatchqueue/2016103-async), `async` schedules a work item for immediate execution on the thread, and returns immediately. 

<br>

#### Make it work

When a task object is defined, it does not execute. (Exactly the same behaviour as variable declaration, or function declaration. No surprise there.)

After the task object has been defined, we can call a method on it to execute it. The method:

```swift
task.resume()
```

<br>

### Summary

We have just learned a pattern for making requests to a web API correctly and confidently. 

We learned something about the URL Loading System and its classes. And, we learned the correct approach to coding a *data task* object, which is the building block for working with web APIs.

<br>
