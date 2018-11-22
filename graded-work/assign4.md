---
title: Assignment 4
layout: default
---

## DPS923 and MAP523 Assignment 4

Assignment 4 gathers a number of topics together in a right-sized piece of work. 

Read/skim all of this document before you begin work.

While you are doing the work, if a *specific task* is not clear, or it seems to require an unreasonable amount of time to complete, contact your professor. 

<p style="color: red;">This document is being edited.<br>This notice will be removed when the edits are complete.</p>

<br>

### Due Date

Wednesday, December 5, 2018, at 11:00pm ET  
Grade value: 20% of your final course grade

*If you wish to submit the assignment before the due date and time, you can do that.*

> It is *VERY IMPORTANT* to submit your work before the due date and time.  
> This assignment *CANNOT* be late.  
> If it is not submitted by the due date and time, your Assignment 4 grade will be zero.  
> Grading will begin the morning after the submission date and time.  

<br>

### Overview and purpose

We need an app that will enable you to capture and store information about the food you eat during the day. 

It is important for everyone to have good nutrition habits. Diet and nutrition issues are too easy for people to ignore and dismiss as unimportant, but good food brings health, both in body and in mind. Modern society and culture have increased interest in food and health, so an app like this could be useful.

In general, the app features include:
* Can capture info about food items consumed
* The food item name or identification can be entered by you, or provided by a public web service 
* Your additional notes/text can be added 
* The new item will have its location info stored (where, when, and so on) 
* Optionally, a photo of the food/meal can be taken 

Here are some sample screen capture images...

> Notice:  
> Some of these images will be refreshed/replaced.  
> They were accumulated during early iterative work on a sample solution by your professor.  
> Some are showing fields or values that have since been changed.  
> Follow the printed instructions below for authoritative info about what your scenes should look like.  

<br>

The "first launch" scene; an empty list, and with some items:

<img class="border1" src="images/a4-first-launch.png" alt="List, empty"><img class="border1" src="images/a4-item-list-3-items.png" alt="List, with items">

Add item scenes:

<img class="border1" src="images/a4-item-add-first-time-permission.png" alt="Location permission"><img class="border1" src="images/a4-item-add-scene.png" alt="Input fields">

Add a photo scenes:

<img class="border1" src="images/a4-item-add-scene-photo.png" alt="Get/take photo"><img class="border1" src="images/a4-item-add-scene-before-save.png" alt="New item, ready to save">

Search for an item, setup, and list of possibles:

<img class="border1" src="images/a4-item-add-search-step1.png" alt="Enter search terms"><img class="border1" src="images/a4-item-add-search-step2-list.png" alt="List of possibilities">

After selecting an item on the list, before saving, and then the result after configuring a photo:

<img class="border1" src="images/a4-item-add-search-step3-before-save.png" alt="Before save"><img class="border1" src="images/a4-item-info-scene.png" alt="Item info scene">

<br>

### Getting started

Use the TemplateCDv1 as a base - it's in the [course's code repository](https://github.com/dps923/fall2018), in the templates and solutions folder. Follow it's how-to instructions in the "read me" document. 

At this point, the app will load and run correctly, and enable you to create and delete "example" entity objects. These objects are persisted in a Core Data store. All the base / infrastructure programming bits are provided in the template. 

Reminders:

The template's design and code is explained in this document:

[Info: Project Template for Core Data projects](/topics/info-project-template-core-data)

How-to-use information is in this document:

[How-to: Template for Core Data apps](/topics/how-to-core-data-template)

<br>

#### App building tasks, in sequence

Here's a list of the anticipated tasks to be done to build the app:
1. Design and define the data entity
2. Create and configure a data manager for the entity
3. Create a list controller and scene
4. Create an add-new controller and scene
5. Add location services (including reverse geocoding)
6. Add camera (and photo library) handling
7. Create and test an item-selection controller, protocol, and scene  
  
Then, add the ability to work with a web API:  
<ol start="8">
<li>Get the web API templated code</li>
<li>Study and interact with the web API</li>
<li>Design and define structs that match the shape of the data from the web API</li>
<li>Create, configure, and test a data manager</li>
<li>Edit the item-selection controller to use the data manager</li>
</ol>

Fine-tuning and appearance improvement:
* Photo thumbnail
* Number formatting
* Date formatting

<br>

### Doing the work, data model

Again, as noted above, read/skim the rest of this document before you begin work. That way you know what's coming. 

<br>

#### Design and define an entity

Open the Core Data model editor. (In other words, click on the `AppData.xcdatamodeld` item in the project navigator.) 

Add an entity (probably named FoodItem). Add some attributes. All are strings, unless noted otherwise:
* name - for the food item's name
* source - the source or maker of the food item
* quantity - quantity consumed (in grams) (Integer 32 type)
* notes - this can hold your notes or comments about the food item
* timestamp - this holds the object's creation date-and-time (Date type)
* lat - latitude (Double type)
* lon - longitude (Double type)
* location - holds the address result of the reverse geocode task
* photo - holds the food item's photo (Binary Data type)
* photoThumbnail - holds a smaller lower-resolution version of the photo (Binary Data type)

After you complete this work, Xcode will generate, and make available to your code, a class named FoodItem. 

<br>

#### Create and configure a data manager

As you know from the ["how to use" document](https://dps923.ca/topics/how-to-core-data-template), the next task is to create and configure a data manager. Follow the instructions to create a manager extension, probably named: 

`DataModelManager+FoodItem.swift`

<br>

### Add a "list" controller and scene

If you have followed the "how to use" document, then the ExampleList controller and storyboard scenes were deleted. Therefore, we need a controller to show food items. 

Follow the guidance to [create a controller and scene to view the list of food items](https://dps923.ca/topics/how-to-core-data-template#create-controllers-and-scenes-to-view-the-apps-data). 

<br>

### Add a controller and scene to add an item

This scene and controller enables the user to add a new food item to the list. Do the work in three parts: 

Some data will be provided by the user: 
* name
* source
* notes
* quantity
* photo 

The first three should use standard text fields. 

The "quantity" UI should be a segmented button, with segments for these values:  
25, 50, 100, 125, 250, 500

> Tips about the segmented control:  
> The `selectedSegmentIndex` property has the tapped/touched segment.  
> The `titleForSegment(at:)` method has the text title for a segment index.  
> You can convert that text to the number that you need.  

Some data will be generated by the device:
* timestamp
* latitude, longitude, and location 
* photo thumbnail

Follow the guidance to [create a controller and scene to view the data about a food item](https://dps923.ca/topics/how-to-core-data-template#create-controllers-and-scenes-to-modify-the-apps-data).

> Don't worry about storing data that you will want to delete eventually.  
> Remember, when you delete an app, all of its data is deleted too, so an easy way to clear all data is to delete the app from the simulator or your device.  
> Alternatively, if you did the "add list controller" task successfully (above), the table view "delete" task should work correctly, and enable you to delete items one at a time.  

<br>

<mark>( more to come )</mark>

Reverse geocoding done after a location is found  
`placemarks` is an array of CLPlacemark  

<br>

### Testing your work

Test your work by running it on the simulator. Do this frequently and incrementally, after making any substantial changes. Use the debug tool when it's useful to do so.

<br>

### Reminder about academic honesty

When you are ready to submit your work, you will copy some of the code in your project to plain text files, so that the My.Seneca/Blackboard “SafeAssign” tool can do its job. The next section will tell you which files to copy.

> From the Blackboard web site:  
> SafeAssign compares submitted assignments against a set of academic papers to identify areas of overlap between the submitted assignment and existing works.

<br>

### Submitting your work

Follow these instructions to submit your work, before the due date and time:  

1. Locate your project folder in Finder (and we suggest that you make a copy of it for yourself).

2. In that folder, add a new folder named "MyCode".

3. Copy these source code files to the "MyCode" folder:  
**Main.storyboard**  
**DataModelClasses.swift**  
**DataModelManager.swift**  
<mark>( more to come )</mark>  
For each of these files, change the file name extension to "txt".

4. Right-click the folder, and choose **Compress “xxxxxxxx”**, which creates a zip file.  

5. Login to Blackboard/My.Seneca, and in this course's Assignments area, look for the upload link, and submit your work there.  

<br>
