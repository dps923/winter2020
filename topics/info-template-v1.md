---
title: Info Code templates version 1
layout: default
---

## Info: Code templates version 1

Standardized code for a multi-scene app.

<br>

### Topic discussion

UITextField `text` property is an optional string. Don't know why, but it seems to be non-nil, always. The docs even say it's `@""` by default. 

```swift
// This proves that the value of text is NOT nil
if let pn = productName.text {
    print(pn.count)
}
```

Docs say to use the `isEmpty` property, instead of looking at count. It's faster and better. Use it like this - force-unwrap the `text` property to avoid awkward ( )! syntax:

```swift
if productName.text!.isEmpty {
  errorMessage.text.append("Invalid product name. ")
}
```

<br>

### Interesting things

The app delegate includes this code at the top just before the `class` definition...

`@UIApplicationMain`

See the explanation [here](https://stackoverflow.com/a/30081440). Very interesting. It effectively synthesizes the C-language `main` entry point/functionality. 

Remember (reinforce) that the table view "rows" is NOT the same as the table view "data source". 

<br>
