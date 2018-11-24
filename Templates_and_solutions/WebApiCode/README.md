## Web API Code

Students in our iOS programming course have permission to use (copy) the code in these examples as-is, and to modify it in any way. Enjoy. 

<br>

### WebApiRequest.swift

Represents an HTTP Request object (for interacting with a Web API). 

A small number of edits will customize the class for your project and situation. Read the code comments to learn more. 

<br>

### DataModelManager+Entity.swift

This DataModelManager extension defines methods to be called in controllers for a specific entity in the app's data model.

THIS is the code that will:
1. Create (and configure if necessary) an instance of the WebApiRequest class 
2. Call that object's `sendRequest(toUrlPath:completion:)` method 
3. Provide a function (callback) that will execute when the response is received 

The callback function essentially does two things: 
1. Saves the response result to a property in the manager 
2. Posts a "notification" so that observers (listeners) know when the response s received

Create one or more methods to meet the needs of your app.

<br>

### DataModelManager.swift

This is an excerpt of a typical manager class. 

The only notable feature, for web API use, is the presence of one or more properties (instance variables) that are intended to hold the results of web API interaction. 

Create one or more properties (objects and/or collections) to meet the needs of your app.

<br>

### DataModelClasses.swift

Purpose - Classes and structs that describe the shape of entities. 

Write a struct or class to describe the shape of each imported or externally-sourced entity. In this example source code file, two related entities are defined as structs. 

<br>
