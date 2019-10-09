## Week 6 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

###  W06a1FetchIntro

A simple navigation interface app, with a table view and a standard view. 

The data comes from a web API request. The request is done with `URLSession` and `URLSessionTask` techniques. 

> Before you run this code example,  
> update the URL string on line 31 of the CourseList controller 

In this app, we send the request from the table view controller.  
In future apps, we will use the data model manager. 

<br>
