---
title: DPS923 MAP523 Week 5
layout: default
---

## DPS923 MAP523 Week 5 Notes

The theme for this week is to improve the appearance of the example app. Along the way, a number of app configuration and programming techniques are learned. 

We also get more coverage of the Swift programming language. 

<br>

### Monday plan

Test 1 is today. 

Then, the professor will guide you through the topic hightlights in the textbook. 

Chapter 9: The New Look  
Chapter 10: The Final App  
Chapter 11: The Final App  
Chapter 12: The Final App  

TBA - Swift basics  

```swift

// Create a new "Swift File" named something like
// "ModelClasses.swift" to hold ALL entity model classes

class Person {
    var name: String = ""
    var age: Int = 0
}

// How to use this... assume you're in a Playground 
// or in the viewDidLoad() method

let peter = Person()
peter.name = "Peter"
peter.age = 23

let myriam = Person()
myriam.name = "Myriam"
myriam.age = 25

var people: [Person] = [peter, myriam]

let pavan = Person()
pavan.name = "Pavan"
pavan.age = 23
        
let tiago = Person()
tiago.name = "Tiago"
tiago.age = 25
        
people.append(pavan)
people.append(tiago)

// How many items in the array?
var num = people.count




```

<br>

### Wednesday plan

Hands-on: Your professor will guide you in an interactive activity that introduces you to two important topic areas:  
1. Swift and arrays  
2. Table view in iOS  

The Swift documentation for [info on arrays](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html) (in the Collection Types topic).

See the iOS Human Interface Guidelines documentation for [info on tables](https://developer.apple.com/design/human-interface-guidelines/ios/views/tables/). 

It includes a link to the [Table View Programming Guide for iOS](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/TableView_iPhone/AboutTableViewsiPhone/AboutTableViewsiPhone.html) - all good stuff. 

If there's time remaining, work on Assignment 2.

<br>

#### This week's Swift focus

Arrays

<br>

### Learning resources

iOS Apprentice  
Chapters 7, 8

Swift documentation  
[Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)  
[Guide](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)

<br>
