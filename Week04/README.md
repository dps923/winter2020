## Week 4 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

###  W04a1NavIntro

Enables you to learn how to create an app that uses the *navigation interface*. 

There are three scenes. Transition from one scene to the next with a simple button. Use the "back" feature of the navigation controller's *navigation bar* to transition back to the previous scene. 

<br>

### W04a2DataModelIntro

Enables you to learn how to get a data model into an app. 

We need a source code file to hold classes or structs that define the shape or structure of our data. 

Then we need another source code file to hold properties and methods that enable other objects to get to the data. This is the *data model manager*. 

When the app starts, we create a single instance of the data model manager, and pass it to the app's first controller. Then it is passed on (or whatever) to other controllers in the app. 

<br>
