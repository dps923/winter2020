---
title: Info Week 9 topics
layout: default
---

## Info: Week 9 topics

<br>

### Do-try-catch error handling

do-try-catch  
do-catch is the swift version of try-catch in other languages  
any function call that may fail must be called with try  
how will you know? check its definition; if it throws, then it must be called with try  
two try variations...  
try! - we know with certainty that the function call will not fail  
try? - if it fails, nil will be returned  
<br>

### JSON reading

Easy from a file in the bundle.  
More complicated when a network is involved.  

<br>

### Network access

<br>

### Core Data

An instance of NSFetchRequest collects the criteria needed to select and optionally to sort a group of managed objects held in a persistent store.

A fetch request must contain an entity description (an instance of NSEntityDescription) or an entity name that specifies which entity to search.

includesSubentities default is true, change to false if you do NOT want related objects.

includesPropertyValues default is true.

fetchLimit and fetchOffset can work together for "take" and "skip" functionality. 

NSManagedObject uses dynamic class generation to support the Objective-C 2 properties feature (see Objective-C 2 Support) by automatically creating a subclass of your class appropriate for your entity.

Maybe create an "extension" to the manager class for the entity-related methods. Kind of a clever code container (if it works). 

In the table below, "Collection" is an array of zero or more entity objects. "Object" is an entity object. Fetch errors will return `nil`. 

Fetch request kind | Prop or<br>method | Returns | Predicate | Pred is an<br>identifier | Sortable | tba
--- | --- | --- | --- | --- | --- | ---
Count (all) | Prop | Int | no | no | no | 
Count (some) | Method | Int | maybe * | no | no | 
All | Either | Collection<br>(or in an frc) | no | no | usually | 
Some | Method | Collection <br>(or in an frc) | yes | no | usually | 
One, by identifier | Method | Object | yes | yes | no | 
One, by other value(s)<br>(could be many) | Method | Object | yes | no | no | 
Add | Method | Object | no | no | no | 
Edit / update<br>(could be many) | Method | Object | yes | yes | no | 
Delete | Method | ? | yes | yes | no | 

Can approach the "Count" problem (above) in different ways...
1. Count, no predicate, for total number 
2. Count, with predicate, for a different number, or 
3. Standard "get some" and just count the result size 

<br>

All task controllers - detail, add, etc. - will also get the manager passed in.

<br>

### Using the template

Copy, rename, manage scheme.  
Run to make sure it works. It should.  
Clean your simulator.  

Core Data model editor, add a new entity.  
Duplicate file - ...Manager+Example, to "...Manager+XXXX...", where "XXXX" is the name of your new entity.  
Find-replace in the file... (Option+Command+F)  
Look for case sensitive replacements. "Example" and "example".  

Clear existing storyboard items.  
Delete existing ExampleList controller.  

Duplicate file - ExampleListBaseCD, to "XXXXList", where "XXXX" is the name of your new entity. Put it in the "SourceCode" group.   
Find-replace in the file... (Option+Command+F)  
Look for case sensitive replacements. "Example" and "example".  
Ensure that the class name is "XXXXList".  
Edit the cell-for-row-at-index-path to set the cell's label(s) to the correct values.  
Edit app delegate with the name of the new controller.  

Open ExampleListBaseCD.storyboard. Copy to Main.storyboard.  
On Main.storyboard, set the nav controller as the initial view controller (the entry point). Set its Storyboard ID too (to "XXXXList", where "XXXX" is the name of your new entity).  
Select the table view controller. Set the class name to "XXXXList" (as above).  

**Add notes...**  
Edit the outlets  
Edit the `save` method to logically work  
Open ExampleAddCD.storyboard, copy paste  
Work with Main.storyboard. Edit the Storyboard ID, class name, controls to match, make the outlet connections  
Make a segue from the presenting controller  
In the presenting controller source code file, adopt the "add" protocol, copy in the stub methods, code the segue, by passing the manager and setting the delegate.  

**Detail notes...**  
Duplicate the file, into the SourceCode group.  
Find-replace in the file... (Option+Command+F)  
Look for case sensitive replacements. "Example" and "example".  
Ensure that the class name is "XXXXList".  
Declare the needed outlets, and configure them in `viewDidLoad()`.  
Copy the protocol method to the presenting controller, and make that controller adopt the protocol.  
Open ExampleDetailCD.storyboard, copy, paste to Main.storyboard.  
Work with Main.storyboard. Edit the Storyboard ID, class name, controls to match, make the outlet connections.  
Make a segue (Accessory Action > Present Modally) from the presenting controller. Set its identifier.  
In the presenting controller source code file, adopt the "add" protocol, copy in the stub methods, code the segue, by passing the manager and setting the delegate.  

**City support**  
Edit Core Data model carefully.  
Duplicate the ...Manager+Province/Example code.  
Find-replace.  
Duplicate the ExampleListBaseCD code.  
Find-replace.  
Probably comment out the Edit button support for now.  
Add a predicate to the frc, to refer back to the parent. Predicate string, then array of args.  
Back to the presenting controller.  
Add a segue, workflow.  
Storyboard support, you have a choice:  
1. New table view controller  
2. Copy existing list controller  

I chose copy-paste. Change class name.  
From presenting controller, make a segue (Selection Segue > Show). Set its identifier.  


<br>

**Fixes...**  
Manager+Example, find by name, ==[c] added  
Look for "for example" and avoid using the word "example"  
"Example method implementations" (protocol too)  
"topViewController" vs. controllers[0]  
Maybe fix the segue code comment samples, replace "Product" with "Example"  


<br>
