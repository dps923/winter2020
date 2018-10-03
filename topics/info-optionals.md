---
title: Swift optionals
layout: default
---

## Swift optionals

This document collects and summarizes content from the Swift Programming Language documentation set, notably the "tour" and "language guide" sections. 

Much of the content is copied as-is and pasted here. So, we acknowledge that the source is the [official documentation](https://swift.org/documentation/#the-swift-programming-language). 

<br>

### In summary...

An optional is a *packaging system* or scheme for a variable.

The contents of the package could be empty (nil), or it could have a value. You must "unwrap" the package to get to the contents. 

Declare or mark a variable as an optional by adding a question mark after the type. For example:

```swift
var myName: String? = "Peter"
```

There are two ways to get to the contents for read/write (get/set) tasks:
1. Safe unwrap - `if let`  
2. Force unwrap - `!`  
(do this only if you are certain that the optional contains a value)

<br>

### From A Swift Tour (documentation) (mostly...)

An optional value either contains a value or contains nil to indicate that a value is missing. Write a question mark (?) after the type of a value to mark the value as optional.

```swift
var surveyAnswer: String?
```

An "if let" block guards your code from nil values. (This is known as "optional binding".)

In other languages, you do this:

```csharp
// C#
var greeting = "";
if optionalName != null {
    greeting = $"Hello, {optionalName}";
}
```

In Swift, you do this:

```swift
if let name = optionalName {
    greeting = "Hello, \(name)"
}
```

In summary, it creates a new scoped name to hold the non-nil value of the optional. 

It is fundamentally the same as explicitly checking for nil values, but the syntax looks a bit cleaner (to some people). 

You can include as many optional bindings AND Boolean conditions in a single if statement as you need to, separated by commas. If any of the values in the optional bindings are nil or any Boolean condition evaluates to false, the whole if statement’s condition is considered to be false. For example:

```swift
if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"
```

Another way to handle optional values is to provide a default value using the ?? operator. If the optional value is missing, the default value is used instead.

```swift
let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
```

When working with optional values, you can write ? before operations like methods, properties, and subscripting. If the value before the ? is nil, everything after the ? is ignored and the value of the whole expression is nil. Otherwise, the optional value is unwrapped, and everything after the ? acts on the unwrapped value. In both cases, the value of the whole expression is an optional value.

```swift
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
```

<br>

### From the Language Guide (documentation) (mostly...)

Swift is a type-safe language, which means the language helps you to be clear about the types of values your code can work with. If part of your code requires a String, type safety prevents you from passing it an Int by mistake. Likewise, type safety prevents you from accidentally passing an optional String to a piece of code that requires a nonoptional String. Type safety helps you catch and fix errors as early as possible in the development process.

Sometimes it’s clear from a program’s structure that an optional will always have a value, after that value is first set. In these cases, it’s useful to remove the need to check and unwrap the optional’s value every time it’s accessed, because it can be safely assumed to have a value all of the time.

These kinds of optionals are defined as *implicitly unwrapped optionals*. You write an implicitly unwrapped optional by placing an exclamation mark (String!) rather than a question mark (String?) after the type that you want to make optional.

Implicitly unwrapped optionals are useful when an optional’s value is confirmed to exist immediately after the optional is first defined and can definitely be assumed to exist at every point thereafter. *The primary use of implicitly unwrapped optionals in Swift is during class initialization.*

An implicitly unwrapped optional is a normal optional behind the scenes, but can also be used like a nonoptional value, without the need to unwrap the optional value each time it’s accessed. The following example shows the difference in behavior between an optional string and an implicitly unwrapped optional string when accessing their wrapped value as an explicit String:

```swift
let possibleString: String? = "An optional string."
let forcedString: String = possibleString! 
// requires an exclamation mark

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString 
// no need for an exclamation mark
```

You can think of an implicitly unwrapped optional as giving permission for the optional to be unwrapped automatically whenever it’s used. Rather than placing an exclamation mark after the optional’s name each time you use it, you place an exclamation mark after the optional’s type when you declare it.

<br>

### Identifying an optional

In code that you write, it's easy. You have either provided a `?` or a `!` after the type name. 

In code that is part of the foundation or a library, you must go to the documentation to learn the answer. 

For example, look at the [UILabel class](https://developer.apple.com/documentation/uikit/uilabel). It has a `text` property, which is defined as follows:

> `var text: String?`  
> The current text that is displayed by the label.

So, it's an optional. 

Now, look at the [UITableViewCell class](https://developer.apple.com/documentation/uikit/uitableviewcell). It has a textLabel property, which is defined as follows:

> `var textLabel: UILabel?`  
> Returns the label used for the main textual content of the table cell.

It too is an optional. 

<br>

### General rules or guidelines

On controller classes, we almost always have one or more variables that hold the controller's data model, or a reference to the app's data model. 

ALWAYS declare these as implicitly unwrapped optionals, and ensure that their values are set immediately after the class is initialized. Setting the values is usually done in the code of another (parent) controller that initializes the new (child) controller. 

If there are other variables that will be initialized in an `init()` method, then it is safe to declare them as implicitly unwrapped optionals, because their values will exist when the class completes its initialization process.

<br>
