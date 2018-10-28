---
title: Info Code templates version 1
layout: default
---

## Info: Code templates version 1

This document describes a version 1 code template that has standardized code for a multi-scene app. 

The app's data model is persisted in a plist file(s), in the app's Documents directory. 

Students in Professor McIntyre's iOS programming course have permission to use, copy, and modify the code in this template. Yes, controllers etc. can be copied (added) to another project as-is and then modified to work in the other project. 

<br>

### Features

The code in this template offers many features in various categories. 

General or overall features:
* Assumes a navigation-based app
* Includes one entity data model class (for a "product")
* Includes a data model manager class, and initialization code for the app delegate 
* Assumes data (and a reference to the manager) is passed on to successor controllers
* Most controllers initially assume the presence of a data model manager class and a "Product" class, and therefore have instance variables for them  

Controllers, workflow features included:
* Table view list controller, for use anywhere in a navigation workflow (start, middle, end) 
* Standard scene controller, for use anywhere in a navigation workflow

Controllers, task features included:
* "Detail" controller for modal use, the presenter will be the delegate
* "Add" controller for modal use, the presenter will be the delegate 
* "Edit" controller for modal use, the presenter will be the delegate 
* Combined "add and edit" controller for modal use, the presenter will be the delegate 
* These controllers include example user interface outlets, which you can use or remove to meet your project's needs
* All these task controllers include sample method implementations that can be copied to the presenter/delegate

<br>

### How-to-use info for students

This how-to info has been tested several times, in new projects, and in existing projects. When you use it, and you think that it needs a fix or an enhancement to work better, please contact your professor. Each controller is designed to have little or no error-generating impact when added to a project. 

Start by downloading or saving this project in a convenient location. 

In another project, use the project navigator, and select/focus on the yellow project folder. Then choose `Add files to "[project]"` (right-click, file menu, keyboard shortcut). 

Select the desired code module, and add it to the project. 

Each code module will need some edits to customize it to your project. Some references and objects may not exist because they're not (yet) in your project, so edit to fix (or comment out the offending statement). 

For the app's data model, add data model classes to meet your project's needs. Add methods to do data service operations (fetch, add, change, etc.) in the manager class. 

For all controllers, change the class name to match the purpose in your project. Remember that there is an easy-to-use procedure: 
1. In the controller code, select the class name
2. On the `Editor` menu, choose `Refactor > Rename...`

Enjoy. 

<br>