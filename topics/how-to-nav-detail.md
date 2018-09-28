---
title: How-to Navigation from table view, detail
layout: default
---

## How-to: Navigation from table view, detail &#9432;

Assumptions:
* Table view scene and controller already exist

We will add a new controller and scene, and a "detail" segue navigation.

In the project navigator, focus on the yellow project folder icon, and create a new file (&#8984;+N).  

It will be a Cocoa Touch Class. Next, make it a subclass of UIViewController. 

> Tip - Use the name "SomethingDetail" for the class name.  
> Leave out the words "view" and "controller".

Show the Main.storyboard in the editor. 

From the library, add a new view controller. On its identity inspector, set its class to the just-created class from above. 

Select the table view scene that will be the navigation source. Select its table view cell object (the white area just below the "Prototype Cells" label). 

On its attributes inspector, set the accessory to either:
* Detail, if we are supporting ONLY detail navigation 
* Detail Disclosure, if we are supporting BOTH detail navigation, and (drill-down) disclosure navigation

Next, create a segue. (Make sure that the table view scene, and its table view cell object is still selected.) Control+click+drag from the table view cell object to the new destination scene. On the pop-up, choose Accessory Action > Show. 

Select the segue object. On its attributes inspector, enter an appropriate value for the Identifier property. We suggest that it begin with the word "to" (because we are navigating "to" this scene) and an appropriate name for the scene. For example, "toFooDetail". 

<br>

**Test your progress**

mod code, section, row  
and cell for row at index path  

<br>
