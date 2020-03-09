###  W09a2LoadV2

Based on Version 2 of the template.

Shows how to load a Core Data store with JSON starter data. 

Look at the JSON file first.  
Then, look at the data model classes, to see how they're described.  
Notice the use of a non-conflicting and meaningful name for the class.  

Next, go to the store initializer. There's a new block of code there.    
It shows how to read a JSON file from the bundle, and  
load its contents into a Core Data store. 

Finally, look at the "list" table view controllers.  
Pay attention to each `viewDidLoad()` method.  

The `ListFetchRequestOnly` controller uses a *fetch request* to get the data. 

Alternatively, the `ListFRCSections` controller uses a *fetched results controller* (frc) to get the data. Notice the use of "section" info.  

Another interesting feature of the app is that the destination `PersonScene` is re-used, and is the destination from either "list" table view controllers.
