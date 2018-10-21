---
title: Info General items
layout: default
---

## Info: General items

General items not yet in (or ready for) a note/document.

<br>

### Protocol (and delegate) work 

It seems challenging to define *optional* methods in Swift-defined protocols. Huh.

When defining (writing) a protocol, *make sure* that it inherits from `class`. 

<br>

### Array work

[Swift docs topic](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html#ID107)

Assume that we have an array of objects.  

Attempt to ensure that the objects have a unique identifier property, so that you have at least one way of definitely finding a desired object. 

When passed as a value to a function, a *copy* is made. Passed by value, not by reference. 

> In Swift, Array, String, and Dictionary are all value types. ([source](https://developer.apple.com/swift/blog/?id=10))

**Find by identifier**

```swift
    func productById(_ id: Int) -> Product? {
        // Search for matching identifier
        return products.first(where: {$0.id == id})
    }
```

Discussion: 

[Dev docs topic on `first(where:)`](https://developer.apple.com/documentation/swift/array/1848165-first) (includes links to other ways of finding elements).

> (placeholder for now - i recently read a really good explanation)

**Other finds (string, index)**

By string:

```swift
    func productByName(_ name: String) -> Product? {
        
        // Search for matching name
        return products.first(where: {$0.name.lowercased() == otherName})
    }
```

By index: 

```swift
    private func productIndexById(_ id: Int) -> Int? {
        
        // Look for the index of the desired item
        return products.firstIndex(where: {$0.id == id})
    }
```

**Sort by a property**

```swift
    // Sort by identifier, which is an integer
    func productsSortedById() -> [Product] {
        
        let sortedProducts = products.sorted(by: { (p1: Product, p2: Product) -> Bool in return p1.id < p2.id })
        
        return sortedProducts
    }
```

Discussion: 

Closure is `{ (Any, Any) -> Bool in return value < value }`. 

```swift
    // Sort by name, which is a string    
    func productsSortedByName() -> [Product] {
        
        let sortedProducts = products.sorted(by: { (p1: Product, p2: Product) -> Bool in return p1.name.lowercased() < p2.name.lowercased() })
        
        return sortedProducts
    }
```

Discussion:  

Closure is similar to the first example. Not much different from the first sort-by-integer example. 

**Use the "reduce" function**

From [the dev doc](https://developer.apple.com/documentation/swift/array/2298686-reduce):

> Returns the result of combining the elements of the sequence using the given closure.

The doc is *really good*. Read anytime we need to. 

```swift
    // Look for the maximum "id" value, and return the next usable value
    private func nextId() -> Int {
        return products.reduce(0, { max($0, $1.id) }) + 1
    }
```

Discussion: 

Could also use the `min` function to look for the smallest value.

<br>

### Number-string conversions

Int to/from String, typically easy.

Double to/from String? A bit tricky. Here it is in a `UITextField` validator:

```swift
// Check numeric value
// Create a temp variable
var cost: Double = 0.0
// Attempt to get the numeric value
if let value = Double(productCost.text!) {
    // Yes, successful, save it for later
    cost = value
    // Make one more check, must be a number that makes sense
    if value <= 0.0 {
        errorMessage.text = "Invalid cost"
        return
    }
}
```

[Here's a post](https://supereasyapps.com/blog/2015/9/28/how-to-convert-strings-into-double-and-float-values-using-swift-2) that discusses this trickiness. 

<br>

### User interface, user interaction

[Dismiss keyboard by tapping on the view background](https://stackoverflow.com/questions/24126678/close-ios-keyboard-by-touching-anywhere-using-swift) (one of many). 

<br>

### iOS app architecture (design)

[Patterns to avoid massive view controller (MVC)](http://khanlou.com/2014/09/8-patterns-to-help-you-destroy-massive-view-controller/).




<br>
