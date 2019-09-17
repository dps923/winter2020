---
title: Alert, action sheet
layout: default
---

## Alert, action sheet

In an app's workflow or usage flow, how can you get the attention of the user? Maybe you want to tell them or warn them about something. Or, maybe you want to ask a question and get an answer from the user. 

The solution is to use an *alert* or an *action sheet*. 

An alert is a rectangle that appears (i.e. pops up) in the center of the screen. Read more about [alerts](https://developer.apple.com/design/human-interface-guidelines/ios/views/alerts/).

An action sheet is a rectangle that slides up from the bottom of the screen. Read more about [action sheets](https://developer.apple.com/design/human-interface-guidelines/ios/views/action-sheets/). 

Learn how to [implement them here](https://developer.apple.com/documentation/uikit/windows_and_screens/getting_the_user_s_attention_with_alerts_and_action_sheets). 

<br>

### Code example

Study this code example:  
* W03a1Alerts

<br>

#### New idea - programmatically-created view

This topic is the first to feature a *programmatically-created view*. Up until now, we have used the storyboard to define and configure content for the screen. 

As you will learn:
* We create an instance of the new view 
* Then, we tell the hosting view to "present" (show) the new view

<br>

#### New idea - modal view

Both alerts and action sheets are *modal* views. What does that mean?

It means that the view interrupts the workflow or usage flow in an app, and requires the user to interact with the alert or action sheet. The area outside the alert or action sheet is dimmed, and unavailable for interaction. (The exception to this rule is that when an action sheet is displayed, tapping outside the action sheet area is considered to be the action sheet's "cancel" action, if one is configured.)

<br>

#### New idea - Swift closure

We start this coverage by acknowledging that every student has had some past experience with closures, likely in JavaScript and C++ lambdas. 

As you would expect, Swift has closures too. 

In alerts and action sheets, each button/choice action must have a function. Therefore, you must learn Swift's syntax for writing this function. Here it is - it is the *curly-brace block* that is the value of the `handler` parameter:

```swift
let defaultAction = UIAlertAction(title: "Confirm", style: .default, handler: { (alert) in
    let msg = "Alert, default was tapped"
    print(msg)
    self.alertResult.text = msg
})
```

The important part is this generalized syntax:

```swift
{ (parameter: Type) -> Type in
  // the symbol "in" separates the parameter(s) and return type
  //   from the closure body statements
  // closure body...
  // write your code statements here
  // if a return type is required, then "return" something
}
```

It is possible that a closure will have one or more parameters. The function/method that hosts the closure will provide values when the closure is called/invoked. 

It is also possible that a closure will return a value. Therefore, in the body of the closure, there will be one or more `return` statements (depending on its logic). If the closure does not return a value, then we can omit the &nbsp;`-> Type` symbols. 

The `UIAlertAction` initializer [documentation is here](https://developer.apple.com/documentation/uikit/uialertaction/1620097-init). Its declaration includes a `handler` parameter, and its value is:

```swift
((UIAlertAction) -> Void)? = nil
```

Here's how to interpret this:
* It is expecting a *closure* 
* That means that its value is a *curly-brace block of code* 
* When the closure is called, it receives a `UIAlertAction` object 
* The closure returns nothing, so your syntax can omit the &nbsp;`-> Type` symbols
* The default value of the handler is `nil` if a closure is not provided or defined

<br>

#### But wait - there's more...

Apple's UIKit Catalog code example shows a few more typical use cases involving alerts and action sheets. 

> This code example is located in the "Templates and solutions" folder of the repo. 

One that's interesting is an alert that includes a text field, in which the user can provide content. 

Another is an alert that has more than two buttons. In this situation, the buttons are vertically stacked, instead of side-by-side. 

Finally, it shows how to implement alerts and action sheets on an iPad when using a "popover". 

<br>
