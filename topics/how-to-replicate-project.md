---
title: How-to Replicate Project
layout: default
---

## How to: Replicate Project

This how-to describes how to replicate an existing project, and use the replicate as a base for a new project. 

<br>

### Summary of the tasks

1. File system, duplicate or copy-paste, then rename folder
1. Xcode, initial name changes
1. Fix-ups

<br>

#### File system duplicate or copy-paste then rename folder 

In Finder, locate the project folder.  
Duplicate (&#8984;D) or copy-paste (&#8984;C, &#8984;V).  
Rename the new folder.  

<br>

#### Xcode, initial name changes

In Xcode, edit the README.md content.  

In the project navigator, select the project item.  
Change its name (press return to enable edit-name mode).  
Respond to the dialog.  

In the center editor panel, change the bundle name (and use the same new name as the project item).  

Navigate to this Xcode menu choice:  
Product > Scheme > Manage Schemes  
Select the item on the list (there should be only one).  
Change its name (and use the same new name as the project item).  

Optionally, if you want to change the name of the top-level yellow folder - the one that holds the source code files - go ahead and do that.  

In the "Find" navigator, search for the old project name, case-sensitive.  
It may return results, because it will find the old project name in the comments of controllers and other source code files.  
In the replacement text field, enter the new project name, case-sensitive, and click the "Replace All" button. 

<br>

#### Fix-ups

Build the project. There will be at least one error.  

`Build input file cannot be found...`  
In the project navigator, select the project item.  
In the center editor panel, ensure that the project target is selected.  
The top section, titled "Identity", should have a button titled "Choose Info.plist file...".  
Click to show the dialog, and choose the Info.plist file.  

On the Product menu, choose "Clean Build Folder".  
Then build (or run) the project.  

The project should now be ready for you. 

<br>
