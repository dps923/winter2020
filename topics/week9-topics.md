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
