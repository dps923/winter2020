## Week 7 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

### W07a1NewFetch

Based on last week's W06a1Fetchintro app.

It is different in these ways:
* It has a data model manager 
* It has a "web API request" factory class
* It relies on the iOS on-device "notification" system 

> Before you run this code example,  
> update the URL string on line 21 of the WebApiRequest class,   
> and the path/segment string on line 28 of the DataModelManager class  

<br>

### W07a2NewMore

Based on last week's W06a2WebApiMore app.

Notice that the POST request sets/updates the `baseUrl` and the `httpMethod` properties.  

> Before you run this code example,  
> update the URL string on line 21 of the WebApiRequest class,   
> and the path/segment string on line 28 of the DataModelManager class  

<br>

### W08a3FetchMany

Shows the ability to use a web API to fetch data, using many requests.   

> This code example was created in November 2018 (a year ago),  
> and lightly freshened for use in this current course.  
> It has minor differences - the newer code is a bit better, but the technique is similar.  

<br>
