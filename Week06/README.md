## Week 6 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

### W06a1FetchIntro

A simple navigation interface app, with a table view and a standard view. 

The data comes from a web API request. The request is done with `URLSession` and `URLSessionTask` techniques. 

> Before you run this code example,  
> update the URL string on line 31 of the CourseList controller 

In this app, we send the request from the table view controller.  
In future apps, we will use the data model manager. 

<br>

### W06p1FetchCode

A Swift Playground. 

The simplest URLSession fetch example possible.  
Clearly shows the closure syntax envelope that our web API code uses.  

<br>

### W06a2WebApiMore

Based on app #1 above, its navigation interface app has one more standard view. 

> Before you run this code example,  
> update the URL string on line 31 of the CourseList controller 

The new view has a data entry form, to make a new `TCPost` object. 

Then, it is sent in an HTTP POST request to the free [JSONPlaceholder](https://jsonplaceholder.typicode.com) web API. 

<br>
