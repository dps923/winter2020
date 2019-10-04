---
title: Table view add item pattern
layout: default
---

## Table view add item pattern

At this point in time, you have some knowledge of and experience with:
* navigation interface  
* table view  
* data model manager and classes  
* storage  

What if you want to *add new items* to your app? This document covers that topic. 

<br>

### Getting started

New items can be added from a number of different sources:
* a data entry view that you create as part of the app
* a select list with items fetched from the network
* on-devices sources, including the camera

How is this done? Using the *add/edit item* pattern. A central feature of this pattern is the *modal view* concept. You have seen modal views before, when we covered the Alerts and Action Sheets topic. 

In the add (and edit) patterns, a modal view provides self-contained functionality in the context of the current task or workflow. It typically covers the entire screen. Also, it usually displays a button that triggers task completion, and a Cancel button that abandons the task. 

It is new and interesting to us that these "done" and "cancel" tasks are coded in the *hosting* or *presenting* controller, and NOT in the modal view's controller. How? This controller source code file also declares a *protocol* that must be adopted by the host/presenter. 

<br>

#### Design and coding task overview

Here is the design and coding approach:

1. Create a controller for the modal view
2. Add code that declares a *protocol* (with at least one method), and add a *delegate* property to the controller
3. Add a new scene to the storyboard (and embed it in a nav controller)
4. Alternate between the scene and controller code to build the user interface and handle events
5. In the controller, add code (to validate and) package the user input, and call the delegate method
6. In the presenting controller, adopt the protocol, code the segue, and implement the delegate method(s)

<br>

#### Protocol definition

From [the docs](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html):

> A protocol defines ... methods, properties, and other requirements that suit a particular task or piece of functionality.  
> The protocol can then be *adopted* by a class, structure, or enumeration to provide an actual implementation of those requirements.  
> Any type that satisfies the requirements of a protocol is said to *conform* to that protocol.

Also from [the docs](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID270):

> Protocols can require specific ... methods ... to be implemented by conforming types.  
> These methods are written as part of the protocol’s definition in exactly the same way as for normal instance and type methods, but *without curly braces or a method body*.

Then, a class in your app (typically a controller) can "adopt" the protocol, and provide an implementation for the protocol's members.

> You have seen all this "protocol" thing before.  
> Text field delegate, table view controller delegate, etc.  
> What is new is that YOU write the protocol code.  

<br>

#### Protocols in our apps 

In our scenarios, we will configure some of our controllers to require a protocol. 

Typically, these controllers will manage a view that is presented modally (i.e. it slides up from the bottom). 

The usual tasks for these scenarios include *add new item*, or *edit existing item*, or *show more detail*. We also can use this technique for presenting a table view or picker view, when used as an item-selection UI object. 

We suggest that you write the protocol in the controller source code module, near the top, before the controller's `class` declaration. 

A protocol module looks like the following. The name will typically be a multi-word *Pascal case* name. We suggest that its name include: 
1. the entity name first
1. the task to be done (e.g. Add, Edit, ShowDetail, etc.)
1. the word "Delegate" 

For example:

```swift
protocol ProductAddDelegate: AnyObject {
	// method signatures only - no braces or body
}
```

> Why does the protocol inherit from `AnyObject`?  
> Protocols can be adopted by a class, struct, or enum.  
> When we want to limit adoption *only* to classes, we make the protocol inherit from `AnyObject`. 

Next, ensure that its controller class declares a delegate variable:

```swift
weak var delegate: ProductAddDelegate?
```

Finally, in action methods (typically), gather the user input, and call the appropriate delegate method. For example:

```swift
@IBAction func cancel(_ sender: UIBarButtonItem) {
    // Call into the delegate
    delegate?.addTaskDidCancel(self)
}
```

Why do we need a protocol?  
Can we just write the methods in the presented controller?  

Well, while it's possible, it's not a good idea for a number of reasons.  
It's just not done in real apps. So, get used to the pattern. Accept it.

What do we do next?

In the hosting or presenting controller that will adopt and conform to the protocol, modify its `class` declaration. For example: 

```swift
class ProductList: UITableViewController, ProductAddDelegate {
```

Next, implement (provide a method body) for the protocol's methods. For example:

```swift
func addTaskDidCancel(_ controller: UIViewController) {
    dismiss(animated: true, completion: nil)
}
```

Finally, in the code that presents the modal view controller, ensure that the modal view controller's delegate property value is set. For example, in `prepare(for:sender:)`:

```swift
// Assuming that "vc" is a reference to
// the destination modal view controller, 
// set the delegate 
vc.delegate = self
```

<br>

### Summary - protocol pattern setup

The following image attempts to clarify the typical protocol pattern setup code, in the source code of the modally-presented controller that defines and requires a protocol. Click or tap the image to open it in a new tab/window. 

<a href="https://dps923.ca/media/protocol-pattern-setup.png" target="_blank"><img src="/media/protocol-pattern-setup.png" alt="Protocol pattern setup" /></a>

<br>

### Summary - protocol pattern usage in the presenting controller

The following image attempts to clarify the typical protocol pattern usage code, in the source code of the hosting/presenting controller that adopts and conforms to a protocol. Click or tap the image to open it in a new tab/window. 

<a href="https://dps923.ca/media/protocol-pattern-controller.png" target="_blank"><img src="/media/protocol-pattern-controller.png" alt="Protocol pattern setup" /></a>

<br>
