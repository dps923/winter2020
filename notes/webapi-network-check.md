---
title: Web API network check
layout: default
---

## Web API network check

This document introduces a way to check for internet connectivity BEFORE sending a request to a web API. This makes your code safer. 

<br>

### Check design and logic

The modern way, in the iOS SDK version 12 and later, is to use the `NWPathMonitor` class. 

> The OLD way was to use a "Reachability" class.  
> Don't use that.  

<br>

### Check before segue

etc.

<br>
