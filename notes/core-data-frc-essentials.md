---
title: Fetched results controller essentials
layout: default
---

## Core Data fetched results controller essentials

<mark>This document is being edited.</mark>

Explain

include apple reference doc 

minimal implementation of the frc delegate...  
controllerDidChangeContent(_:) (can be nil)  

frc = short form for *fetched results controller* 

<br>

### When to use an frc

Assume a scenario where you need a table view to show a list of items:
* Do you use a *fetch request* to get the items?
* Or do you use a *fetched results controller*? 

Here's how to make a decision: Ask these questions:
* The list's contents - dynamic? (i.e. is there a possibility of change during viewing)  
* Editable? (i.e. move, add, delete)  
* Grouped items? (e.g. list of employees, grouped by company)  

If you answered *yes* to any of these, use an frc.  
Otherwise, a fetch request object will do the job.  

etc.

<br>

#### Minor sub-section

etc.

<br>
