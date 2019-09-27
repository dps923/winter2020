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

Tuesday, October 8, 2019, at 11:00pm ET  
Grade value: 10% of your final course grade

*If you wish to submit the assignment before the due date and time, you can do that.*

<br>

### Overview and purpose

Here are the point-form specifications (which will be better-explained soon). 

Multi-scene app
* List of friends
* More info about a selected friend
* Add a new friend to the list
  * Will use the camera or photo library 

Navigation interface

Data model, implemented using best practices 
* Local storage of the data

Deployed to an iOS device

<mark>&nbsp;( more to come )&nbsp;</mark>

<br>

### Getting started

Create a new iOS app, using the Single View Application template. The name of the app should be "**MyFriends**".  

Follow best practices about project creation. Ask if you are unsure. 

<br>

### Doing the work

Again, as noted above, read/skim the rest of this document before you begin work. That way you know what's coming. 

<br>

#### Tasks...

Follow best practices and recommended guidance. 

These how-to instructions will be better explained soon. Here they are in point form. 

Build and test a two-scene app that uses the navigation interface. 

The first controller must be a table view controller subclass, and should be named something like "FriendList". 

The second controller must be a standard view controller subclass, and should be named something like "FriendScene". 

Create a data model class (maybe named "Friend"), with a few members to enable you to get started testing. Maybe family name, given name(s), age, city. (Later, we'll add more attributes.)

Create a data model manager class, which will initialize and make available a collection of all "Friend" objects. For testing purposes, create three friends. 

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

When you are ready to submit your work, you will copy some of the code in your project to plain text files, so that the My.Seneca/Blackboard “SafeAssign” tool can do its job. The next section will tell you which files to copy.

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

4. From wherever, copy the three screen captures into the MyCode folder. Rename them to "FriendList" (jpg or png, whatever), "FriendScene", and "FriendAdd". 

5. Select the top-level folders:  
MyFriends  
MyCode  
Right-click, and choose **Compress 2 Items**, which creates a zip file (make sure the zip file is fairly small, around 2MB or less).  

6. Login to Blackboard/My.Seneca, and in this course's Assignments area, look for the upload link, and submit your work there.  

<br>
