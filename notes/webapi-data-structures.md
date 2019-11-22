---
title: Web API and data structures
layout: default
---

## Web API and data structures

This document has the general rules and guidelines for writing Swift structs or classes that enable JSON to be decoded or encoded. 

Read/skim (then refer to when you need to) the [Structures and Classes](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html) section of the Swift Language Guide. 

<br>

### `struct` or `class`?

In general:
* If you are decoding only - incoming JSON to Swift objects - a `struct` can be used 
* For simple encoding, when you have all the property values to create the object, a `struct` can be used here too 
* For more complex encoding, or when doing encoding and decoding, or when setting or modifying the property values over time, a `class` should be used
  * Note that some (most?) of its properties will end up being declared as `var`
  * Ane, you will need to do initialization tasks somehow 

The examples below will show typical coding approaches. Each use a `struct`, but the needs of your app may cause you to use a `class` instead. They cover the basics, and then you can build upon them to handle a wide variety of web API responses.

<br>

#### `var` or `let`? 

Use common sense. If you have all the property values when the object is created, `let` works fine. Otherwise, declare it as `var` (and then you must initialize...).

<br>

#### Initialized with a value?

A property declared with `var` or `let` can be configured with an initial value. Recall the difference:

```swift
let name: String
// ...or...
let name: String = "Peter McIntyre"
```

Alternatively, if you declare a data structure with `var` members, you must write an initializer. 

<br>

### Incoming object

Assume that the incoming JSON is an object:

```json
{
  "version": 2.3,
  "timestamp": "2019-11-22T15:38:55Z",
  "id": 345,
  "name": "Peter McIntyre",
  "jobTitle": "Professor",
  "schoolIdentifier": 37
}
```

What is the Swift `struct`?

```swift
struct Employee: Codable {
  let version: Double
  let timestamp: Date
  let id: Int
  let name: String
  let jobTitle: String
  let schoolIdentifier: Int
}
```

<br>

### Incoming collection

Assume that the incoming JSON is an array (of objects):

```json
[{"id":1,"firstName":"Ruthie","lastName":"Kellert","city":"Shediac","province":"New Brunswick","ip_address":"194.146.180.248"},
{"id":2,"firstName":"Calida","lastName":"Tynewell","city":"Stonewall","province":"Manitoba","ip_address":"52.163.147.254"},
{"id":3,"firstName":"Cordy","lastName":"Woolham","city":"Ucluelet","province":"British Columbia","ip_address":"39.20.8.60"}]
```

<br>

What is the Swift `struct`?

```swift
struct Employee: Codable {
  let version: Double
  let timestamp: Date
  let id: Int
  let name: String
  let jobTitle: String
  let schoolIdentifier: Int
}
```
