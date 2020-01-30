###  W06a2WebApiMore

Based on this week's app #1. 

In its navigation interface app, there is one more standard view. 

The new view has a data entry form, to make a new `TCPost` object (see the data model classes source code, and notice that the new class has an initializer), and then sending it in an HTTP POST request to the free [JSONPlaceholder](https://jsonplaceholder.typicode.com) web API. 

Notice the "Save" button on the scene's nav bar, on the right. (We first have to add a "Navigation Item" to the scene, to enable us to click-drag-and-drop a bar button item on it.)

Remember your web programming techniques for interacting with a web service. Each request must have:
* the HTTP method 
* a resource URL
* headers (accept and/or content type, etc.)
* a body, if necessary

The requirements are exactly the same, no matter what programming language or platform you are working with.

The data task code is in the "Save" button handler method. When compared to the "get all" code in the app's table view controller, this has some additional code and some differences:

1. We create a new object, based on the info in the data entry form (this will become the body)

2. A custom `URLRequest` object is created and configured, with the HTTP method, a resource URL, headers, and body

3. The data task is created, using the new request object

4. In the data task, notice that a few error messages are configured

Incidentally, the incoming data is not saved or used; it's just sent to the debug console with the `dump()` statement.

Read the comments in the code.  
And, read and study (and then try to code it yourself) the how-to in the course notes.  
