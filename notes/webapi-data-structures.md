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
  * And, you will need to do initialization tasks somehow 

The examples below will show typical coding approaches. Each use a `struct`, but the needs of your app may cause you to use a `class` instead. They cover the basics, and then you can build upon them to handle a wide variety of web API responses.

<br>

#### Name of the `struct` or `class`?

To prevent name collisions with entity and other classes that you will create in your app, we recommend that you use a two- or three- character prefix for all your web API data structures. 

That will enable you to have, for example, an `APICustomer` struct that defines the web API data structure, and a `Customer` (entity) class in your app. This naming convention makes the role of each very clear. 

<br>

#### Properties... `var` or `let`? 

Use common sense. If you have all the property values when the object is created, `let` works fine. Otherwise, declare it as `var` (and then you must initialize...).

<br>

#### Initialized with a value?

A property declared with `var` or `let` can be configured with an initial value. Recall the difference:

```swift
let name: String
// ...or...
let name: String = "Peter McIntyre"
// ...or...
var name: String = "Peter McIntyre"
// ...or...
let customers = [Customer]()
```

Alternatively, if you declare a data structure with `var` members, you must write an initializer. 

<br>

#### Property declarations

The type of a property value can be declared as optional. In that situation, the decoder will safely tolerate JSON that is missing that property. 

Must you code all incoming properties in your Swift `struct` or `class`? No. Write code for the properties that are needed. You can ignore the rest. 

> However...  
> For sending (POST or PUT), you MUST send all the data that the web API expects. Otherwise, the request will cause an HTTP 400-series response. 

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
struct APIEmployee: Codable {
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
struct APICustomer: Codable {
  let id: Int
  let firstName: String
  let lastName: String
  let city: String
  let province: String
  let ip_address: String
}
```

Then, the type that's passed in to the closure function will be an array: `[Customer]`

<br>

### Incoming object with collection

Assume that the incoming JSON is a package that includes an array of objects:

```json
{
  "version": "1.0.0",
  "timestamp": "2019-11-22T15:38:55Z",
  "count": 34,
  "data": [
    {"id":1,"firstName":"Ruthie","lastName":"Kellert","city":"Shediac","province":"New Brunswick","ip_address":"194.146.180.248"},
    {"id":2,"firstName":"Calida","lastName":"Tynewell","city":"Stonewall","province":"Manitoba","ip_address":"52.163.147.254"},
    {"id":3,"firstName":"Cordy","lastName":"Woolham","city":"Ucluelet","province":"British Columbia","ip_address":"39.20.8.60"}
    ]
}
```

<br>

What is the Swift `struct`? First, define any nested or embedded object or collection. Then, define the package.

```swift
struct APICustomer: Codable {
  let id: Int
  let firstName: String
  let lastName: String
  let city: String
  let province: String
  let ip_address: String
}

struct APICustomerPackage: Codable {
  let version: String
  let count: Int
  let timestamp: Date
  let data: [APICustomer]
}
```

<br>

### Incoming object with nested/embedded object

Assume that the incoming JSON is a package that includes a nested/embedded object (or objects):

```json
{
  "version": "1.0.0",
  "timestamp": "2019-11-22T15:38:55Z",
  "count": 34,
  "token": {
    "required": false
  },
  "link": {
    "href": "https://example.com/api/customers",
    "rel": "self",
    "method": "GET"
  }
  "data": [
    {"id":1,"firstName":"Ruthie","lastName":"Kellert","city":"Shediac","province":"New Brunswick","ip_address":"194.146.180.248"},
    {"id":2,"firstName":"Calida","lastName":"Tynewell","city":"Stonewall","province":"Manitoba","ip_address":"52.163.147.254"},
    {"id":3,"firstName":"Cordy","lastName":"Woolham","city":"Ucluelet","province":"British Columbia","ip_address":"39.20.8.60"}
    ]
}
```

The "token" property's value is an object.  
And, the "link" property's value is an object.

What is the Swift `struct`? First, define any nested or embedded object, then, define the packaging.

```swift
// Define the embedded object
struct APICustomerPackageToken: Codable {
  let required: Bool
}

// Define the embedded object 
struct APICustomerPackageLink: Codable {
  let href: String
  let rel: String
  let method: String
}

// As before, define the embedded collection 
struct APICustomer: Codable {
  let id: Int
  let firstName: String
  let lastName: String
  let city: String
  let province: String
  let ip_address: String
}

// Finally, define the package 
struct APICustomerPackage: Codable {
  let version: String
  let count: Int
  let timestamp: Date
  let token: APICustomerPackageToken
  let link: APICustomerPackageLink
  let data: [APICustomer]
}

```

<br>

### Anything else I should know?

Yes, plenty. Consult the Apple guides and reference documentation for a complete treatment.

<br>
