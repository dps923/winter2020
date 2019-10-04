---
title: Assignment 2
layout: default
---

## DPS923 and MAP523 Assignment 2

Assignment 2 has many goals, which result in a useful app with many features. 

Read/skim all of this document before you begin work.

While you are doing the work, if a *specific task* is not clear, or it seems to require an unreasonable amount of time to complete, contact your professor. 

<br>

### Due Date

Friday, October 11, 2019, at 11:00pm ET  
Grade value: 10% of your final course grade

*If you wish to submit the assignment before the due date and time, you can do that.*

<br>

### Overview and purpose

Here are the point-form specifications (which will be expanded on in the sections that follow). 

It's a multi-scene app:
* A list of your friends
  * The list will be nicely-formatted
* You can "drill down" to get more info about a selected friend
* A new friend can be added to the list
  * The task will use the camera or photo library 

Also, the app: 
* Has a navigation interface
* And a data model, implemented using best practices 
  * On-device storage of the data 
* And is deployed to an iOS device 

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

Create a package that will hold a collection of Friend objects. Use the familiar packaging format that we have been using this term. 

Create a data model manager class, which will initialize and make available (via a property or method) a collection of a all "Friend" objects. For testing purposes, create three friends objects. 

Implement or use the data model, as you have learned. (Obviously, replace/remove the array of strings data source that you used in the "getting started" section above.) 

Then test the navigation interface by displaying some data on the friend list scene, and then passing on a selected friend object to the next friend scene. 

<br>

#### Implement on-device storage 

After testing, to confirm that the tasks above are working correctly, we can move on to storage. 

Here are the factors to consider and implement:
* On-device storage in the file system 
* The friend data is persisted as JSON 
* The app must both load and save the data 
* It must also save the data when the app is put into the background 

For this app, you do NOT have to create "starter data" and put it into the bundle. (You saw that in one of the code examples. Not needed in this app.)

<br>

#### Add new item workflow

Next, implement the "add new item" workflow. As you have learned, it requires a modal controller, and a custom-written protocol. 

Its user interface will enable data about a friend to be gathered and validated. 

Then, the FriendList controller must adopt and conform to the protocol. 

<br>

#### Camera and photo library

Your app will include the ability to display and gather a photo of a friend. As you have learned, this task is done by using a code-created modal "image picker" controller. 

The photo will be stored in the file system. The following is the design-and-code approach. 

Think about how this feature will be used by the user:
1. A the list of friends is showing on the screen 
1. The user decides to create a new friend, so the `+` plus button is tapped (upper right), and an "Add Friend" scene slides up from the bottom 
1. Information about the user is entered 
1. The user taps a button that opens the camera (preferred) or photo library (simulator); the image picker scene slides up from the bottom 
1. A photo is taken or chosen, and the image picker scene disappears (slides down) 
1. The user taps the "Save" button (upper-right) 
1. A code-generated unique file name is generated 
1. All data - user and photo - is passed back to the delegate method that can do the saving 

We want to use a unique name for the stored photo. This code will generate a random name, of a length that you choose:

```swift
func generateFilename(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
```

> There is a code example that implements most of this behaviour. 

The code is designed to generate a random name, but not a unique name. It is possible - although almost impossible - that it could return a non-unique name. Therefore, it might be a good idea to check for the existence of a file with the same name. If yes, generate another, and check again. 

The filename will be used when you save it in the file system. We must also associate the filename with the friend, so the `Friend` class must be modified to include a string for the filename. 

The idea is that we can get the data for a specific Friend object, and be able to get/read the image file from the file system. 

It should be apparent that you should modify your "friend info" scene by adding an image view, to displaying the friend's photo. 

<br>

#### Table view cell format 

Use the "Detail" cell style, so that it displays two lines of text. 

Show a small ("thumbnail") version of the photo in the cell's image area. Remember that you have the data for a friend when the cell is being rendered, and that data includes the photo file name. Use it to get/read the image. 

How to get a small image? You can use the code provided in the code example in the repository. 

<br>

#### Table view sorting 

It would be nice (and expected) that the list of friends be sorted alphabetically. That can be done by creating a sorted copy of the friends array, and using it as the table view's data source. 

If your `Friend` class has a birth date property (and it probably should), format the date nicely. 

See the code provided in the repo for how-to. 

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
