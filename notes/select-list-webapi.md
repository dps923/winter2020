---
title: Select list with data from web API
layout: default
---

## Select list with data from web API

In this document, you will learn how to use a table view controller as a "select list". It will display a list of items that were fetched from the network, and enable the user to select one of the items. Upon selection, the selected item will be passed back to the controller that presented the select list. 

This is a modal scene, and therefore will use the well-understood "task" pattern (same as for add, edit, detail). 

Here's a brief video demonstration, for Safari browser users:

<img src="/media/item-select-demo.mov" class="width250" alt="View this in the Safari browser" />

<br>

### Major section

In our app, we need a way to *select an item*. What item? Something *from a list* of search results. 

This is a common task in apps. All students will be familar with the use of `select` and `option` elements in HTML, and how they are used to make a list of items. On a web page, we typically see this kind of feature as a "list box" or a "dropdown list", as shown in the web page example, below left. 

A similar example has been prepared for a list (table view controller) scene in an iOS app, as shown below right.

<img class="border1" src="/media/item-select-example-html.png" alt="Select, HTML"><img class="border1" src="/media/item-select-example-scene.png" alt="Select, iOS">

<br>

How can we do this for our app? There are several ideas involved. 
1. First, we need a list (table view) controller and scene
2. It will be a "task" scene, so it will slide up from the bottom (as other task scenes do), as a result of an action segue in the presenting controller 
3. As a result, it will define a protocol, with a "cancel" method 
4. It will need data, from somewhere (memory, data store, the network; typically by calling a manager method), and data items will render in table view rows
5. When a row is tapped/selected, a handler will call a delegate method, and pass back the data represented by the selected row to the presenting controller
6. The presenting controller can do whatever it needs to with the passed-back data 

<br>

The `egSelect` code example in the [course's code repository](https://github.com/dps923/fall2018/tree/master/Week11) has the essential info needed to understand and use an item-selection list. 

As noted above, we suggest that you first implement the item-selection controller with in-memory data items. (For example, create an array of strings in the controller's `viewDidLoad()` method.) When a user taps a row, pass the data back to the presenting controller (in the delegate method call).

How do we handle #5 above (row tap)? We implement another table view delegate method, `tableView(_:didSelectRowAt:)`. You have probably seen this before in one of the course textbook code examples. Here is the logic for the method:

```swift
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // When the row is tapped, we have the index path value
    // Use it to extract the data-item from the data source 
    // (which is the in-memory array of items)
    // Call the delegate's searchTask(_:didSelect:) method,
    // passing the data-item as a parameter
}
```

<br>

Earlier, on the "add new" scene, you probably configured your food item name text field to span the full width of the scene. We suggest that you reduce its size so that you can fit a "search" button to its right. The button will cause an action segue to show the item-selection controller. 

![Food item name text field and search button](images/a4-item-add-scene-name-and-search-button.png)

How do we handle #6 above (do something with the passed-back data)? Well, in the "add new" (presenting) controller, implement the `searchTask(_:didSelect:)` delegate method. The type of the passed-back data is a string. Set the food item name text field to show the passed-back data. 

At this point, your app should be able to enable the user to add a new food item by entering its name in the text field, or by using the item-selection controller. 

<br>

### Edit the item-selection process to use the data manager

In this section, we will adapt the *add-item controller* and the *item-selection controller* to use the search results collection that's stored in the manager.  

We will start with the *add-item controller*, and think about the segue that happens when the search button is tapped (from the "add new" scene to the "item-select list" scene). There are two related ideas here:
1. We want to prevent a segue if the food item name text field is empty. 
2. However, if it's not empty, we want to execute the search task. 

The design of the `prepare(for:sender:)` segue method does not permit us to cancel it. In other words, when the method gets called, it will execute. 

However, we do have another method - `shouldPerformSegue(withIdentifier:sender:)` - that the iOS runtime calls just *before* `prepare(for:sender:)`. This is ideal, because we now have a way to prevent a segue. 

The `shouldPerformSegue(withIdentifier:sender:)` method returns true or false. That is how we can control whether the iOS runtime calls `prepare(for:sender:)`. 

Here is the suggested logic for handling this situation:

```swift
override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
    if identifier == "name-of-segue-identifier" {

        // Validate the data from the user interface...
        // If the food item name text field is empty,
        //   then show an error message,
        //   and return "false"
        // However, if it is not empty,
        //   call the manager's "foodItem_Search(searchTerms:)" method
    }
    return true
}
```

<br>

Here's what happens now when "Search" is tapped when the food item name text field is empty:

![Empty search](/media/item-add-search-empty.png)

<br>

Before leaving the add-item controller, edit the `searchTask(_:didSelect:)` method. The type of the passed-back data must be updated, and the logic to set/configure the values of the text fields must be updated. (The passed-back data includes the *name* and *manu* values we need in the user interface.)

Now, move on to the item-selection controller. Its `viewDidLoad()` method needs the statement that will observe (listen for) the notification that the manager posts when the fetched web API data is ready. Use the pattern you see in either "list" controller in the "egWebApiGet" code example. 

After adding the statement, it tells you that it needs the `reloadTableView()` method. Write (copy) that too (it simply reloads the table view). 

The number of rows in the data source must be updated. The new data source is (obviously) the property in the manager that holds the web API response. 

The cell content must be updated. We suggest that you change (on the storyboard) the table view cell style to "Subtitle" to show both the food item name and its source ("manu"). 

The `tableView(_:didSelectRowAt:)` method must be updated. Extract the data-item from the data source, and pass that back to the delegate method. 

At this point in time, the item-selection process should be working with the web API. 

<br>

### Multiple select?

Yes, it can be done. 

Change the logic:
* Instead of the tap-to-select interaction, add a check mark to each tapped row 
* Add a "Save" button to the upper-right nav bar
* Code its logic to choose and return all check marked items 

<br>
