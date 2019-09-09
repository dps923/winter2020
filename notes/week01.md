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
Then, switch back to Xcode, and stop the app with Cmd+. (dot/period)  
Select `LaunchScreen.storyboard` for editing  
Show the user interface (UI) object library with Shift+Cmd+L  
Select the label, then click-drag-drop to the storyboard scene  
Edit the label (e.g. "App launch screen"), and edit its attributes if you wish  
Run the app again, notice what happens, then switch back to Xcode and stop the app  
Select `Main.storyboard` for editing, add a suitable label  
Size the label so that it is the full width of the view, and center its content (by using the [attributes inspector](https://help.apple.com/xcode/mac/current/#/dev31645f17f))  
Run the app again, notice what happens, then switch back to Xcode and stop the app  

Next, let's programmatically set the label's content. We are going to do the following tasks:
1. Connect the UI object to an "outlet" variable in the source code of the scene's view controller class 
2. Declare and initialize a class variable in the source code 
3. In the `viewDidLoad()` event-handling function, update the UI object with the value from the class variable

Task 1: We must connect the label on the scene with the source code. In this app, the scene's code is in `ViewController.swift`. The connect task is both visual and tactile, so we must setup the right coding environment. For the best results, do the following: 

Select `Main.storyboard` for editing  
Cmd+0 (zero) to hide the left-side navigators area  
Option+Cmd+0 to hide the right-side inspectors area  
On the scene's "dock" (just above the scene), click to select the yellow left-most "View Controller" icon (it will then be highlighted with a blue background)  
Option+Cmd+return to show the Assistant Editor  

At this point, the storyboard editor panel is on the left half of the display, and the code editor panel is on the right side. Then:

Click to select the UI label  
Press-and-hold the keyboard's "control" key  
Click-drag-drop the UI label to the source code, then release the "control key" and the pointing device actions  
A connection dialog will appear; configure it as follows...  
The Connection is an Outlet  
The Name is whatever you want (e.g. topLabel)  
The Type is UILabel  
Press return or click the Connect button, and notice the new source code statement  

```swift
@IBOutlet weak var topLabel: UILabel!
```

Here is a short video clip that shows this technique to create an outlet connection:

![View the video clip in the Safari browser](/media/outlet-demo-1.mov)

What is `@IBOutlet`?  
It is a *type qualifier* for the variable. From the [Apple docs](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Outlets/Outlets.html):

> The type qualifier IBOutlet is a tag applied to an property declaration so that the Interface Builder application can recognize the property as an outlet and synchronize the display and connection of it with Xcode.

What is `weak`?  
It is an option for the variable. From the [Apple docs](https://developer.apple.com/library/archive/documentation/General/Conceptual/CocoaEncyclopedia/Outlets/Outlets.html):

> An outlet is declared as a weak reference (weak) to prevent strong reference cycles.

More information about connecting UI objects to code is in the [Xcode docs](https://help.apple.com/xcode/mac/current/#/devc06f7ee11). 

Task 2: Declare and initialize a class variable in the source code. For example:

```swift
// Variables
var labelText = "App"
```

Task 3: In the `viewDidLoad()` event-handling function, update the UI object with the value from the class variable. For example:

```swift
topLabel.text = labelText
```

Remember our in-class discussion:  
* Most text-oriented UI objects have a "text" property.  
* Many number-oriented UI objects have a "value" property.  

Bonus task: Write a function that does task 3. Why? Just to prove that you can add your own function to an existing view controller class. Then, edit the `viewDidLoad()` code to call the function. For example:

```swift
// New function
func setLabelText(text: String) -> String {
    return "This is \(text) \(labelText)"
}
```

```swift
// In viewDidLoad(), old code...
//topLabel.text = labelText
// New code...
topLabel.text = setLabelText(text: "Peter's")
```

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


