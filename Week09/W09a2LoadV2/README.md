###  W09a2LoadV2

Based on Version 2 of the template.

Shows how to load a Core Data store with JSON starter data. 

Look at the JSON file first.  
Then, look at the data model classes, to see how they're described.  

Next, go to the store initializer. There's a new block of code there.    
It shows how to read a JSON file from the bundle, and  
load its contents into a Core Data store. 

Finally, look at the "list" table view controller.  
Pay attention to its `viewDidLoad()` method.  
Its fetched results controller (frc) has all the goodness to display the data.  
Notice the use of "section" info.  
