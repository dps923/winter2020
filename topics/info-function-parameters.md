---
title: Info Swift function parameters
layout: default
---

## Info: Swift function parameters

Much of the following was based on the [topic in the Swift docs](https://docs.swift.org/swift-book/LanguageGuide/Functions.html#ID166).

A Swift function can sometimes include a _ (underscore character) in the parameter list. What does it mean?

First, let's start with what we know. 

<br>

### Function parameters

A Swift function can have one or more comma-separated parameters. Each has:
1. A parameter label (used by the caller)
2. A parameter name (used in the function scope)
3. A type

However, for beginners, the *parameter label* is often omitted, and in this situation, the parameter label is assumed to be the same as the parameter name. As a result, the typical format of each parameter is:  
```swift
parameterName: Type

// For example:
func example(customerName: String, customerID: Int)
```

The caller must include the parameter name:  
```swift
let result = example(customerName: "Apple", customerID: 123)
```

As noted above, each parameter can ALSO have a "label", if you wish. If present, the caller must use the parameter label (instead of the parameter name). The example above is now a bit different:  
```swift
func example(name customerName: String, id customerID: Int)
```

The caller must include the parameter label:  
```swift
let result = example(name: "Apple", id: 123)
```

<br>

### Omitting parameter labels

If you don’t want an argument label for a parameter, write an underscore (_) instead of an explicit argument label for that parameter. For example:

```swift
// Functions with _ in the parameter names

func labeledYes(friendName name: String, friendAge age: Int) {
    print("name \(name), age \(age)")
}

func labeledNo(name: String, age: Int) {
    print("name \(name), age \(age)")
}

func labelOmitted(_ name: String, _ age: Int) {
    print("name \(name), age \(age)")
}
```

```swift
// Call the functions

labeledYes(friendName: "Ian", friendAge: 36)

labeledNo(name: "Peter", age: 34)

labelOmitted("Joel", 29)
```

<br>
