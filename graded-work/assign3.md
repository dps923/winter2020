---
title: Assignment 3
layout: default
---

## DPS923 and MAP523 Assignment 3

Assignment 3 builds upon the multi-view navigation-style app idea, by adding coverage of recently-covered topics. 

Read/skim all of this document before you begin work.

While you are doing the work, if a *specific task* is not clear, or it seems to require an unreasonable amount of time to complete, contact your professor. 

<br>

### Due Date

Wednesday, November 7, 2018, at 11:00pm ET  
Grade value: 10% of your final course grade

*If you wish to submit the assignment before the due date and time, you can do that.*

<br>

### Overview and purpose

We need an app that will work with data about Canada's provinces and cities. 

The app's first scene is a list of provinces. The data model manager's initializer code creates two provinces. 

<img class="border1" src="images/a3-province-list-start.png" alt="List">

<br>

Tapping on the `+` "add" (upper-right) button will modally present an "Add Province" scene.

<img class="border1" src="images/a3-province-add.png" alt="List">

<br>

Back on the province list, tapping a province's &#9432; detail accessory shows more detail.

<img class="border1" src="images/a3-province-detail.png" alt="List">

<br>

Alternatively, tapping elsewhere on the row will show the next scene, which is a list of cities in the tapped/selected province.

<img class="border1" src="images/a3-city-list-start.png" alt="List">

<br>

There is a similar workflow for cities (in a province). We'll discuss that later. 

<br>

### Getting started

Create a new single-view project named "Canada". Set the iOS version for deployment at 11.0, and the active scheme for the desired emulated device etc. 

Building the project will probably be easier if you use the code assets in the template (version 1). The how-to instructions below will mostly assume that you are using the template. (If you don't use the template, you will just have to write more code and fill in the gaps a bit more.)

Run the app to prove that it works, before doing any changes. Then, as you make changes, build frequently to ensure there are no errors. 

<br>

### Doing the work, data model classes

Again, as noted above, read/skim the rest of this document before you begin work. That way you know what's coming. 

Let's create and configure the app's data. Add these source code files to the project:
* DataModelClasses.swift
* DataModelManager.swift

Create two new data model classes. Follow the pattern of the existing "Product" class to code the properties and the initializer.

Add at least the following properties to a new "Province" class:
* identifier, integer
* province name, string
* name of the premier, string
* area in square kilometres, integer

Add at least the following properties to a new "City" class:
* identifier, integer
* city name, string
* name of the mayor, string
* population, integer

Before continuing, write the initializers for each class. 

How do we "link" the two classes together? In a way that's similar to other languages, and therefore should be familiar to you. A province can have a collection of cities. Looking the other way, a city belongs to a province. 

Add an array property, of type City, to the Province class. Its initial value is an empty array. Later, when we add City objects, they will be contained within a Province object. 

We should change the City class too. For safety and convenience, it is a good idea to know what province a city belongs to. We can do that by adding an integer property for the province identifier. Yes, we will have to maintain that actively and manually. (Later, when we use a persistence management system - such as a database - some of that work will be done by the system.) Update the City class initializer to require the province identifier. 

Save, build, and run, before continuing. 

<br>

### Doing the work, data model manager

The methods in the manager class assume the use of a "Product" class. In general, follow the pattern of the existing methods, and create new methods for the "Province" class. 

<br>

#### Initializer, load, and save methods

In the initializer, write code to add data for two (2) provinces. Wikipedia is a good source of information. 

> Tip - Comment out the existing code. Then, copy and paste it, and edit the pasted code.

The save and load methods need editing too. Remember from above, our focus is on the province collection. City objects will be contained within each province object, so we do not need a separate data storage file for cities.  

Later (soon), the appropriate code will be copied into the app delegate source code file. We'll do that after the first controller is configured. 

<br>

#### Data service operation tasks (fetch, add, etc.)

Take the time now to write methods for the Province tasks. Maybe do this one method at a time, using a copy-paste and edit workflow. 

> Later (soon), we will add more code to handle city-related tasks.

Save, build, and run, before continuing. 

<br>

### Doing the work, provinces

In the project navigator, delete the "ViewController.swift". On the storyboard, delete the scene. 

Now, we can make the controller that shows a list of provinces. From the template, add the "ProductListBase.swift" source code file. 

Each controller source code file that is added from the template must be edited, to customize it to the current app and its data. Here is a general suggestion about how to make most of the edits. 

First, in the project navigator, rename the added file to better match the current app. For example, here, rename "ProductListBase.swift" to "ProvinceList.swift". 

Next, open it for editing. We will do a *find-replace*. This feature is found on the "Find" menu (and it has a keyboard shortcut, Option+Command+F). 

Turn on (activate) its case sensitivity option (the `Aa` control). It will be blue-colored when activated. 

You will typically do four separate find-replace tasks. For each click the "All" button/control do do the work:
1. Plurals, proper case - "Products" with "Provinces"
2. Plurals, lower case - "products" with "provinces"
3. Singulars, proper case - "Product" with "Province"
4. Singulars, lower case - "product" with "product"

![Find-replace in a controller](/graded-work/images/a3-find-replace-in-file.png)

<br>

#### Add a table view scene to the storyboard

On the storyboard, add a table view controller. Set its class to the above "ProvinceList" class. Set the cell reuse identifier of the prototype table view cell (to match the value used in the ProvinceList class). Other properties can be set/configured now or later. 

Embed this scene in a navigation controller. Set the navigation controller as the initial view controller. 

Save, build, and run, before continuing. If all goes well, your app will show a list of two provinces.

<img class="border1" src="images/a3-province-list-start.png" alt="List">

<br>

( more to come )

<br>

#### Add...

<br>

#### Detail...

<br>

### Doing the work, cities in a province

TBA

<br>

#### TBA

(more to come)

<br>

### Testing your work

Test your work by running it on the simulator. Do this frequently and incrementally, after making any substantial changes. 

Your professor plans to introduce you to the Xcode debugger soon, and that tool may help you troubleshoot problems. 

<br>

### Reminder about academic honesty

When you are ready to submit your work, you will copy some of the code in your project to plain text files, so that the My.Seneca/Blackboard “SafeAssign” tool can do its job. The next section will tell you which files to copy.

> From the Blackboard web site:  
> SafeAssign compares submitted assignments against a set of academic papers to identify areas of overlap between the submitted assignment and existing works.

<br>

### Submitting your work

Follow these instructions to submit your work, before the due date and time:  

1. Locate your projectfolder in Finder (and we suggest that you make a copy of it for yourself).

2. In that folder, add a new folder named "MyCode".

3. Copy these source code files to the "MyCode" folder:  
**Main.storyboard**  
**( more to come )**  
For each of these files, change the file name extension to "txt".

4. Right-click the folder, and choose **Compress “xxxxxxxx”**, which creates a zip file.  

5. Login to Blackboard/My.Seneca, and in this course's Assignments area, look for the upload link, and submit your work there.  

<br>
