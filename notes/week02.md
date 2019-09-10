---
title: DPS923 MAP523 Week 2
layout: default
---

## DPS923 MAP523 Week 2 Notes

The theme for this week is to learn and experience a number of user interaction capabilities and techniques.  

<br>

### Wednesday plan

Demonstrations.  
Three segments.  

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it periodically. 

This week, to help you get started in the course, some sequenced how-to info will be shown below. In class, you will learn some of the reasons behind the info, and have an opportunity to ask questions, and practice using Xcode. 

<br>

### Friday plan

TBA

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


