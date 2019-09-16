---
title: How-to Debug an outlet connection problem
layout: default
---

## How-to: Debug an outlet connection problem

The introduction of the *outlets* topic brings the increased possibility of runtime crashes/errors. New iOS programmers can get their progress stopped, and can become frustrated because the error message may not be very helpful. 

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

**Use the Search Navigator**

If you do not remember which object had its outlet recreated - maybe you have dozens of objects, or made many changes over a longer period of time - then you can use the Search Navigator. 

Open it, type the "badname" text (from above), and press enter. 

![Xcode exception](/media/xcode-outlet-conn-problem-search-setup.png)

<br>

Then double-click the result in the storyboard. The Connections Inspector in the right-side utilities panel will open, and show it. 

![Xcode exception](/media/xcode-outlet-conn-problem-search-result.png)

<br>

As you did above, click the "x" icon to delete it.

<br>
