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

[Swift docs topic on error handling](https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html), was good/useful 

[Hacking with Swift](https://www.hackingwithswift.com/example-code/language/how-to-use-try-catch-in-swift-to-handle-exceptions) article on the same topic, was good/useful

[Try, Try!, Try?](https://medium.com/@JoyceMatos/error-handling-in-swift-3-try-try-and-try-f19705e32ff4) - good article 

<br>

### JSON reading

Easy from a file in the bundle.  
More complicated when a network is involved.  

[Decoding explained](https://medium.com/swiftly-swift/swift-4-decodable-beyond-the-basics-990cc48b7375). Check out [Basics](https://medium.com/swiftly-swift/swift-4-decodable-beyond-the-basics-990cc48b7375#d169) and [More Complex Structs](https://medium.com/swiftly-swift/swift-4-decodable-beyond-the-basics-990cc48b7375#ef2d).

Apple [Working with JSON in Swift](https://developer.apple.com/swift/blog/?id=37) is from September 2016. Does not use the new Decoding. However, it is useful because it's similar to what we have done recently. 

YouTube [Parsing JSON with Swift 4 in One Line!](https://www.youtube.com/watch?reload=9&v=WwT2EyAVLmI) - watched it a few times, worth seeing again. Uses Decoder. 

Another good Decoding article - [Encoding and Decoding JSON with Swift 4](https://medium.com/@phillfarrugia/encoding-and-decoding-json-with-swift-4-3832bf21c9a8)

<br>

### Network access

[Winter 2017 intro notes on the network](https://github.com/dps923/winter2017/blob/master/notes/week_08/monday.md)

<br>

### Location services, media, motion, split view controller

[Winter 2017 Week 11 notes](https://github.com/dps923/winter2017/blob/master/notes/week_11/monday.md) on location services

[Week 12 notes](https://github.com/dps923/winter2017/blob/master/notes/week_12/monday.md) on media and motion

[Week 13 notes](https://github.com/dps923/winter2017/blob/master/notes/week_13/monday.md) on split view controller

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

#### Relationships

[Good coverage here](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/HowManagedObjectsarerelated.html#//apple_ref/doc/uid/TP40001075-CH17-SW1)  
Includes "delete rules", what should happen when related objects are deleted  

Nice, [object validation](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/ObjectValidation.html#//apple_ref/doc/uid/TP40001075-CH20-SW1)

<br>

### Working with the TemplateCDv1

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

### Core Data and related entities

[Winter 2017 Week 10 notes](https://github.com/dps923/winter2017/blob/master/notes/week_10/monday.md)

<br>

### Miscellaneous info and links

[Property validation](  
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/KeyValueCoding/ValidatingProperties.html)  
Typically don't do it in Swift - instead, can use willSet and didSet property observers (huh?)

[Winter 2017 Core Data intro notes](https://github.com/dps923/winter2017/blob/master/notes/week_06/monday.md)

Guidance from the [Winter 2017](https://github.com/dps923/winter2017/blob/master/notes/week_09/monday.md#guidance) course about fetch request support. Publish an "execute" method in the manager, and use that. Hmmm.

Good info that follows that about fetch requests and so on.

[Comparing structures and classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)  
Structs have built-in auto-initializer, easy to use  
"All structures have an automatically generated memberwise initializer"  
Good for data only situations (no behaviour)  
Value types, pass by value (i.e. a copy of the value)  
Most of our custom data types will be structs and enums  

[Excellent SO answer](https://stackoverflow.com/a/24232845)

[Segue code using switch (with a default case)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/CoreDataandStoryboards.html#//apple_ref/doc/uid/TP40001075-CH10-SW1) - safer



<br>
