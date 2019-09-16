---
title: How-to Controller code organization
layout: default
---

## How-to: Controller code organization

Recently, the professor briefly discussed a suggested *code organization* technique for use in a view controller class. 

In a view controller, we suggest the following top-to-bottom organizational scheme:
1. Instance variables
2. Outlet declarations
3. Lifecycle functions (your functions, overrides, and delegate and data source functions)
4. Action functions 

When your controller code grows to hundreds of lines, this scheme will help. 

Here's how to implement this scheme: Add specially-formatted comments to separate each of the four groups/sections. Each comment begins with the string "MARK: - ". For example:

```swift
// MARK: - Instance variables
```

<br>

Here's a full example of a controller that implements this scheme:

```swift
class ViewController: UIViewController {

    // MARK: - Instance variables
    
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

As you can see, each group/section is separated by a horizontal line, and has a bold title. 

Incidentally, this list is searchable. Just begin typing, and it will filter the list to include only those members that match the typed text.

Sweet.

<br>
