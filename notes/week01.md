---
title: DPS923 MAP523 Week 1
layout: default
---

## DPS923 MAP523 Week 1 Notes

The theme for this week is to get comfortable with the iOS programming environemnt. 

<br>

### Wednesday plan

We plan is to do the following:

* Course introduction and preview 

* Mac and macOS (re)introduction 

* Xcode development environment tour 

* Swift language introduction
  * Using the Swift Playground
  * Using the Swift language and programming docs  
  [docs.swift.org](https://docs.swift.org)

* Creating simple one-screen iOS apps
  * Hello world, launch screen, and text label on storyboard
  * Keyboard handle, text field, button, label, delegate
  * Slider and interaction, more delegate

<br>

### Learning resources

Your professor will introduce you to some getting-started learning resources.

And, how to use a search engine to locate authoritative reference information. 

<br>

#### Dismiss the keyboard

Today, you will learn that a text field's `resignFirstResponder()` function will dismiss the keyboard. You saw us use that in a button-handling function. We have another way to dismiss the keyboard.  

We will now introduce you - gently - to delegation. We will add a function that will handle the on-screen keyboard's "return key" button tap. In effect, the text field is *delegating* the responsibility of handling that event, to some new code that we will write.  

There are two steps to complete:  
1. Set the text field 'delegate' property to the view controller  
2. Write code to handle an event  

On the storyboard, select the text field. Then, make a connection (press and hold Control, then click-drag-drop) to the "View Controller" icon in the dock at the top of the scene. A connection popup will appear. In the Outlets area, select "delegate".

In the view controller code, edit the class declaration to look like this, by adding a "protocol declaration":  

```swift
class ViewController: UIViewController, UITextFieldDelegate {
```
<br>

Then, add the following function to the view controller:

```swift
func textFieldShouldReturn(_ textField: UITextField) -> Bool {

    // add code to do things, if desired

    return textField.resignFirstResponder()
}
```
<br>
