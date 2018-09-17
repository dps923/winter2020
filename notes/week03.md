---
title: DPS923 MAP523 Week 3
layout: default
---

## DPS923 MAP523 Week 3 Notes

The theme for this week is to (TBA). 

<br>

### Monday plan

The professor will guide you through the topics in the textbook. 

Chapter 4: Outlets  
Chapter 5: Rounds and Score  
Chapter 6: Polish

<br>

#### Code organization in a view controller

During last week's computer-lab session, the professor briefly discussed a suggested *code organization* technique for use in a view controller class. 

In a view controller, we suggest the following top-to-bottom organizational scheme:
1. Local variables
2. Outlet declarations
3. Lifecycle functions
4. Action functions

When your controller code grows to hundreds of lines, this scheme will help. 

Here's how to implement this scheme: Add specially-formatted comments to separate each of the four groups/sections. Each comment begins with the string "MARK: - ". For example:

```swift
// MARK: - Local variables
```

<br>

Here's a full example of a controller that implements this scheme:

```swift
class ViewController: UIViewController {

    // MARK: - Local variables
    
    var message = "Hello, world!"
    var currentValue = 12
    
    // MARK: - Outlets
    
    @IBOutlet weak var gpaValue: UITextField!
    @IBOutlet weak var gpaTitle: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // this function was included in the new project template
        // add more code here
    }
    
    func doSomething(_ input: String) -> String {
        // this function was added by the programmer
        // add code here
        return ""
    }

    // MARK: - Actions
    
    @IBAction func programChanged(_ sender: UISegmentedControl) {
        // add code here
    }
    
}
```

<br>

When you do this, you will enjoy one more benefit while writing code. Xcode will nicely format the list of class members when you click (or Ctrl+6) the "document items" part of the jump bar. 

![Jump bar > document items](/media/xcode-jump-bar-doc-items.png)

<br>

Each group/section is separated by a horizontal line, and has a bold title. 

Incidentally, this list is searchable. Just begin typing, and it will filter the list to include only those members that match the typed text.

Sweet.

<br>

#### Runtime crash caused by connection problems

The introduction of the *outlets* topic brings the increased possibility of runtime crashes/errors. New iOS programmers can get their progress stopped, and can become frustrated because the error info may not be very helpful. 

We can help. 

First, let's begin with the assumption that the problem is often "connection" related - a connection between code (an action or an outlet) and an object in the view or user interface. 

Next, let's create this kind of problem. Using the just-learned Assistant Editor technique, create a new outlet connection:
1. Add an object to the view. Almost any kind will be OK, a button, text field, slider, or segmented control. 
2. Make sure you are looking at the two-pane Editor and Assistant Editor arrangement. 
3. Create an outlet (click/select the object in the view, then Control+click-drag to the outlets group/section of the view controller code). Deliberately, configure the outlet with a bad name (temporarily). 
4. Now notice and decide that the name was bad, so delete the statement from the code file. 
5. Re-create an outlet, and this time, configure the outlet with the name you want it to have.

Build (compile). Notice that the task succeeded.

Now, run the app in the simulator. Boom. 

Notice that Xcode shows you a nasty message in the debug area, and the left-side nav area shows the debug navigator. 

![Xcode exception](/media/xcode-outlet-conn-problem.png)

<br>

Scroll to the top of the message area. The top-most text is useful to us:

```text
2018-09-14 10:03:38.301062-0400 sep14v1[24431:1427553] 
*** Terminating app due to uncaught exception 'NSUnknownKeyException', 
reason: '[<sep14v1.ViewController 0x7fa10b410200> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key badName.'
```

<br>

The part of the message *"this class is not key value-coding compliant"* is a hint to us that the problem is caused by an outlet connection problem. 

The key piece of info that we need is at the end of that message: "for the key **badName**". We need that to locate it in the storyboard's utilities panel area called "Connections Inspector". On the top strip, it's the right-most icon. 

Now that you have that key piece of info, you can close the simulator app, and back in Xcode, stop the app from running, show the storyboard, and the utilities panel's Connections Inspector. 

If you remember which object that had its outlet recreated, then click on it. Otherwise, you may have to click on each object and then look at the Connections Inspector, looking for a double enties in the Referencing Outlets part of the list.

![Xcode exception](/media/xcode-outlet-conn-problem-found.png)

<br>

See the "badName" item? Delete it by clicking the "x" icon. Run your app again, and it should load correctly. 

<br>

### Wednesday plan

Continue work on Assignment 1.

<br>

#### Gentle introduction to debugging

(more to come)

<br>

#### This week's Swift focus

(walk through updateResultText function)

<br>

### Learning resources

iOS Apprentice  
Chapters 4, 5, 6

<br>
