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

#### Test your progress

First, make sure that your table view shows one or more items. If not, [complete this task](how-to-new-app-tvc#test-your-progress).

Then, build-and-run. Tapping (clicking) on the &#9432; (detail accessory) should navigate to your new detail view.

<br>

#### Pass data to the detail view

Almost always, when a specific row is tapped, you will want to pass its data to the detail view. 

First, make sure that the detail view controller has a property (instance variable) to hold the data. You can choose its data type to fulfill your use case. (Sometimes the data will be a simple value like a string. In other scenarios, an object or collection will be passed on.) For example:

```swift
// Simple string
var nameThing: String!
```

...or...

```swift
// Product object
var selectedProduct: Product!
```

<br>

> This technique is described in the document  
> [How to: Controller with a data model reference]()

Next, in the table view controller, uncomment the [`prepare(for:sender:)`](https://developer.apple.com/documentation/uikit/uiviewcontroller/1621490-prepare) method. 

Write an ```if``` statement to match the segue identifier. 

```swift
if segue.identifier == "toFooDetail" {
  // your code here
}
```

Inside the `if` statement, set the segue destination to the appropriate controller type.

```swift
let vc = segue.destination as! FooDetail
```

Now, we need to discover which row was tapped, so that we can go back to the data model (source) and fetch the data to be passed on. 

> Remember, the table view itself is NOT the data source - it is simply displaying some content from the data source. 

<br>

Add an `if let` statement that attempts to get the tapped row.

```swift
if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
  // your code here
}
```

Inside the `if let` statement, 

```swift
// use the index path to fetch what you want from the data model

// pass it on (set the destination controller's data property)

// set the destination controller's title property
```

<br>
