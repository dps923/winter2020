---
title: Core Data operations, compare
layout: default
---

## Core Data operations, compare

Students in this course are new to Core Data technologies. However, all students have some knowledge of and experience with other data store technologies. This document attempts to compare some syntax forms among technologies. 

Assume a "Person" entity for all examples. (The plural form is used with MongoDB via Mongoose and SQL.)

<br>

### Select / fetch / get from the store

Core Data  
```swift
let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

do {
    let results = try m.ds_context.fetch(fetchRequest)
    // Handle the results
} catch let error {
    print(error.localizedDescription)
}
```

MongoDB via Mongoose  
```js
let results = db.people.find()
```

SQL  
```sql
select * from people
```

<br>

### Select / fetch / get from the store, filtered, sorted

Core Data  
```swift
let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest()

// Filter the results
fetchRequest.predicate = NSPredicate(format: "age < 25", argumentArray: nil)

// Sort the results
fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]

do {
    let results = try m.ds_context.fetch(fetchRequest)
    // Handle the results
} catch let error {
    print(error.localizedDescription)
}
```

MongoDB via Mongoose  
```js
let results = db.people.find(
  { age: { $lt: 25 } }
).sort(
  { name: 1 }
)
```

SQL  
```sql
select * from people where age < 25 order by name asc
```

<br>

### Add / insert into store

Core Data  
```swift
// Assume m is the data model manager
let peter = Person(context: m.ds_context)
peter.name = "Peter"
peter.age = 23
m.ds_save()
```

MongoDB via Mongoose  
```js
var result = db.people.insertOne(
  { name: "Peter", age: 23 }
)
```

SQL  
```sql
insert into people values ("Peter", 23)
```

<br>

### Update existing item 

Core Data  
```swift
// Assume m is the data model manager
// and "peter" is a reference to an existing fetched object
peter.name = "Peter"
peter.age = 23
m.ds_save()
```

MongoDB via Mongoose  
```js
let result = db.people.updateOne(
  { _id = "5dc1aa2dfc13ae7900000007" },
  {
    $set: { name: "Peter", age: 23 },
    $currentDate: { lastModified: true }
  }
)
```

SQL  
```sql
update people set name = "Peter", age = 23 where _id = "5dc1aa2dfc13ae7900000007"
```

<br>
