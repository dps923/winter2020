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

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it periodically. 

This week, to help you get started in the course, some sequenced how-to info will be shown below. In class, you will learn some of the reasons behind the info, and have an opportunity to ask questions, and practice using Xcode. 

<br>

#### App 1, named W01a1Label 

This app gets you started with a simple iOS app, and interaction. Then:

Create a new app, as demonstrated in class  
Run it in the simulator, Cmd+R  
Then, switch back to Xcode, and stop it with Cmd+. (dot/period)  
Select `LaunchScreen.storyboard` for editing  
Show the user interface (UI) object library with Shift+Cmd+L  
Select the label, then click-drag-drop to the storyboard scene  
Edit the label (e.g. "App launch screen"), and edit its attributes if you wish  
Run the app again, notice what happens, then switch back to Xcode and stop it  
Select `Main.storyboard` for editing, add a suitable label  
Run the app again, notice what happens, then switch back to Xcode and stop it  

Next, let's programmatically set the label's content. We need to connect the label on the scene with the source code. In this app, the scene's code is in `ViewController.swift`. The connect task is both visual and tactile, so we must setup the right coding environment. For best results, do the following: 

Select `Main.storyboard` for editing  
Cmd+0 (zero) to hide the left-side navigators area  
Option+Cmd+0 to hide the right-side inspectors area  
On the scene's "dock" (just above the scene), click to select the yellow left-most "View Controller" icon (it will then be highlighted with a blue background)  
Option+Cmd+return to show the Assistant Editor  


![How to create an outlet](/media/outlet-demo-1.mov)


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


