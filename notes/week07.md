---
title: DPS923 MAP523 Week 7
layout: default
---

## DPS923 MAP523 Week 7 Notes

The theme for this week is to work with data in iOS apps. 

<br>

### Modified weekly topic plan

After previewing some of the upcoming topics in the textbook, we will modify the weekly topic plan, and remove some chapters. 

The following chapters will *NOT* be covered by us in any depth in the next few weeks:
* Chapter 16: Lists  
* Chapter 18: User Defaults
* Chapter 19: UI Improvements
* Chapter 20: Local Notifications  

We may defer them until later in the course, or designate them as *self-study* or as *resources* which can be used later in the course and afterwards. 

<br>

### Monday plan

The professor will guide you through the topic hightlights in the textbook. 

Review, best practices and wrap-up for...  
Chapter 12: Add Item Screen  
Chapter 13: Delegates and Protocols  
Chapter 14: Edit Items  
Chapter 15: Saving and Loading  

New content...  
Chapter 17: Improved Data Model

Test 2 is on Wednesday.

<br>

#### iOS app objects diagram

In class, we discuss the objects in an iOS app, with help from a diagram.

The *app delegate*, drawn on the left of the diagram with black lines, is the first object that loads when an app starts. It typically has a property (instance variable) to hold the data model manager. It passes on a refererence to the manager to the first controller. It also has many lifecycle methods that are called by the iOS runtime. 

The *data model manager* is drawn in the bottom-middle area of the diagram. It has properties (and often private instance variables) to hold the app's data. It also has methods that do tasks (fetch, add, change, etc.). 

The *entity classes* group is drawn in the middle-right area of the diagram. It has classes that describe the shape (i.e. properties) of the app's entity data. Classes in this group are visible and usable by all other objects. 

Familiar objects - *controllers* and *views* (scenes on the storyboard) - are in the upper-right area of the diagram, drawn with dark blue lines. Each controller may have properties to hold a reference to the data model manager and a copy of a data object item or collection. 

![iOS app objects version 1](/media/ios-app-objects-v1.jpg)

<br>

### Wednesday plan

The Wednesday class begins with Test 2, and then there will be time to work on the next assignment. 

<br>

#### Test 2

Test 2 is today, at the beginning of the timeslot.

It will cover past content (from the "navigation controllers" Chapter 11 through to "saving and loading" Chapter 15), and new content this week ("improved data model" Chapter 17). 

Review the relevant info about tests on the [week 3 notes page](week03#practice-test) and on the graded work page.

The test will begin at the start of the class timeslot, at 3:20pm, and its duration will be about 40 minutes. It is worth 12%, which means that you will answer any questions worth a total of 12 marks. Most questions are worth one mark, and a few may be worth more.

<br>

#### Other

In the time remaining, work on the next ssignment.

<br>

#### This week's Swift focus

TBA

<br>

### Learning resources

iOS Apprentice  
Chapters 12, 13, 14, 15, 17

Swift documentation  
[Tour](https://docs.swift.org/swift-book/GuidedTour/GuidedTour.html)  
[Guide](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)

<br>
