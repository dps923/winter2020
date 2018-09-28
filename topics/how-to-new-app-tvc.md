---
title: How-to - New app with table view controller
layout: default
---

## How-to: New app with table view controller

Create a single view app.

In the project navigator, delete ("Move to Trash") the ViewController.swift file.

With the focus on the yellow project folder icon, create a new file (&#8984;+N).  

It will be a Cocoa Touch Class. Next, make it a subclass of UITableViewController.  

> Tip - Use the name "SomethingList" for the class name.  
> Leave out the words "table", "view" and "controller".

Show the Main.storyboard in the editor. Delete the view controller (scene). 

From the object library, add a new table view controller. Then:
* On its identity inspector, set its class to the just-created class from above
* Embed this controller in a navigation controller (use the Editor menu to do this)

Select the just-added navigation controller. On its attributes inspector, check (select/mark) the "Is Initial View Controller" checkbox.

On the document outline, in the table view controller hierarchy, select the "Navigation Item". On its attributes inspector, enter an approprate value for the Title property.

Next, select its table view cell object. On its attributes inspector, enter an appropriate value for the Identifier property (something short like "cell"). 

Open the just-added table view controller code in the editor. Locate the commented-out [```tableView(_:cellForRowAt:)```](https://developer.apple.com/documentation/uikit/uitableviewdatasource/1614861-tableview) method. Then: 
* Uncomment the method
* Replace the "reuseIdentifier" text with the value you entered above for the Identifier property 

At this point, the app should successfully build, and show an empty list. 

<br>

#### Test your progress

If you want the list to show one or more items (just to prove that it works), do the following, and then build-and-run:

1. In the ```numberOfSections(in:)``` method, return 1, instead of zero

2. In the ```tableView(_:numberOfRowsInSection:)``` method, return 1 (or more if you wish), instead of zero

3. In the ```tableView(_:cellForRowAt:)``` method, add a line of code to configure the cell's textLabel property...  
```cell.textLabel?.text = "Hello, world!"```

<br>
