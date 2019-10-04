---
title: Assignment 2
layout: default
---

## DPS923 and MAP523 Assignment 2

Assignment 2 has many goals, which result in a useful app with many features. 

Read/skim all of this document before you begin work.

<mark>This document is being edited.<br>This notice will be removed when the edits are complete</mark>

While you are doing the work, if a *specific task* is not clear, or it seems to require an unreasonable amount of time to complete, contact your professor. 

<br>

### Due Date

Friday, October 11, 2019, at 11:00pm ET  
Grade value: 10% of your final course grade

*If you wish to submit the assignment before the due date and time, you can do that.*

<br>

### Overview and purpose

Here are the point-form specifications (which will be better-explained soon). 

Multi-scene app:
* List of your friends
  * The list will be nicely-formatted
* More info about a selected friend
* Add a new friend to the list
  * Will use the camera or photo library 

Also: 
* The app has a navigation interface
* And a data model, implemented using best practices 
  * On-device storage of the data 
* Deployed to an iOS device 

<br>

### Getting started

Create a new iOS app, using the Single View Application template. The name of the app should be "**MyFriends**".  

Follow best practices about project creation. Ask if you are unsure. 

<br>

### Doing the work

Again, as noted above, read/skim the rest of this document before you begin work. That way you know what's coming. 

Follow best practices and recommended guidance in all parts of your work. 

Test your work incrementally. Do one small task, and then test it to ensure that it works, before continuing. 

<br>

#### Sketch the app's scenes 

Before completing this task, make sure that you read/skim the rest of this document - that way you will know what to include in the sketch. 

As you learned in [Week 4](https://dps923.ca/notes/week04#designing-and-implementing-a-substantial-multi-scene-app), and as you have seen demonstrated by the professor in-class a number of times, create a sketch of the app's design. Include the scenes that you expect to have, both storyboard-based and code-created. Also include rectangles that aren't scenes, for example, the app delegate etc. 

After sketching it out, save it (by scanning it or taking a photo of it). You will submit this sketch. Then, as you work on the assignment, you can modify or fix the sketch if you wish. 

> Don't do this task at the end of your work on the assignment.  
> The professor wants to see the sketch before you begin.  
> It will help him understand your thought process, and your current level of understanding. 

<br>

#### Getting started

Build and test a two-scene app that uses the navigation interface. 

The first controller must be a table view controller subclass, and should be named something like "FriendList". 

The second controller must be a standard view controller subclass, and should be named something like "FriendScene". 

For testing purposes only, create a very simple array of strings (two or three names of your friends) in the FriendList controller, so that you can test the essential data display and navigation features. 

<br>

#### Data model 

Create a data model *class* (maybe named "Friend"), with a few members to enable you to get started testing. Maybe family name, given name(s), age, city. (Soon, we'll add more attributes.)

> Make sure it's a `class`, and NOT a `struct`.  
> You must write an initializer for the class.  

Create a data model manager class, which will initialize and make available (via a property or method) a collection of a all "Friend" objects. For testing purposes, create three friends objects. 

Implement or use the data model, as you have learned. Then test the navigation interface by displaying some data on the friend list scene, and then passing on a selected friend object to the next friend scene. 

<br>

#### Implement on-device storage 

Briefly: 
* on-device storage in the file system 
* the friend data is persisted as JSON 
* the app must load and save the data 

( more to come )

<br>

#### Add new item workflow

Next, implement the "add new item" workflow. As you have learned, it requires a modal controller, and a custom-written protocol. 

Its user interface will enable data about a friend to be gathered and validated. 

Then, the FriendList controller must adopt and conform to the protocol. 

<br>

#### Camera and photo library

Your app will include the ability to display and gather a photo of a friend. As you have learned, this is done by using a code-created modal "image picker" controller. 

The photo will be stored in the file system. 

( custom-generated name )

<mark>&nbsp;( more to come )&nbsp;</mark>

<br>

#### More tasks beyond these


Camera and photo library usage, and then store/save the photo in the app's data model. 

Table view cell styles that support the display of an image (in addition to the text). 

Using more or different UI objects in the interface, just for fun. 

Storing/saving the data model, in general, in the app's persistent storage area (i.e. its area/part of the file system). 

Swift language features (e.g. data formatting, sorting a collection of objects, etc.). 

<mark>&nbsp;( more to come )&nbsp;</mark>

<br>

### Testing your work

Test your work by running it on the simulator. Do this frequently and incrementally, after making any substantial changes. And, use the Xcode debugger to help. 

When the app is complete, create three screen captures. Here's what each scene will show:
1. List of friends
2. More info about one friend selected from the list
3. The "add friend" scene

<br>

### Reminder about academic honesty

When you are ready to submit your work, you will copy some of the code in your project to plain text files, so that the My.Seneca/Blackboard "SafeAssign" tool can do its job. The next section will tell you which files to copy.

> From the Blackboard web site:  
> SafeAssign compares submitted assignments against a set of academic papers to identify areas of overlap between the submitted assignment and existing works.

<br>

### Submitting your work

Follow these instructions to submit your work, before the due date and time:  

1. Locate your project folder in Finder (and we suggest that you make a copy for yourself).

2. At the same level, create a new folder named "MyCode".

3. From the MyFriends folder(s), copy these source code files to the "MyCode" folder:  
**FriendList.swift**  
**FriendScene.swift**  
**FriendAdd.swift**  
**DataModelClasses.swift**  
**DataModelManager.swift**  
**Main.storyboard**  
For each of these files, change the file name extension to "txt".

4. From wherever, copy the sketch you made of the app's scenes into the MyCode folder. Its name can be something like "SketchAppUI". 

5. From wherever, copy the three screen captures into the MyCode folder. Rename them to "FriendList" (jpg or png, whatever), "FriendScene", and "FriendAdd". 

6. Select the top-level folders:  
MyFriends  
MyCode  
Right-click, and choose **Compress 2 Items**, which creates a zip file (make sure the zip file is fairly small, around 2MB or less).  

7. Login to Blackboard/My.Seneca, and in this course's Assignments area, look for the upload link, and submit your work there.  

<br>
