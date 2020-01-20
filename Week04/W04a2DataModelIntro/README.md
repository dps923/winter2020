###  W04a2DataModelIntro

Introduces you to *data model* essentials.

This app was built by copying the "nav intro" code example (and then cleaning up some names).  
Then, the following tasks were done, in sequence (and each was tested as it was done):

Create `DataModelClasses.swift` as a new "Swift File" item.  
Add structs that define the shape of the data.  
(As you will notice, the data shapes are similar to what you saw in Assignment 1.)  

Create `DataModelManager.swift` as a new "Swift File" item.  
Write an initializer, that creates the data. (In future apps, we'll get the data from a persistent store or a web API.)  
Write a CRUD method; the single method in the file returns a package of data. 

Modify the First controller, and add a variable to hold the data model manager.  

Modify `AppDelegate.swift`, because our *best practices* guidances tells us to do this task.  
Create and initialize the data model manager.  
Modify the `application(_: didFinishLaunchingWithOptions:)` method, which passes the data model manager to the app's first controller. 

Modify the Next controller, and add a variable to hold some data (in this situation, the "course package" object).  
Also modify the code that shows or uses the passed-on data. 

Back in the First controller, modify the `segue(for: sender:)` method, and pass on the desired data. 

Do similar tasks to the Last and Next controllers:  
Modfiy the Last controller, and add a variable to hold some data (in this situation, a single "course" object).  
Also modify the code that shows or uses the passed-on data. 
Back in the Next controller, modify the `segue(for: sender:)` method, and pass on the desired data. 
