---
title: DPS923 MAP523 Week 11
layout: default
---

## DPS923 MAP523 Week 11 Notes

> Thursday, March 26 - online lecture  
> Monday, March 30 - online help

A brief introduction to mapping services. And, more app-building topics.

<br>

### Thursday plan

We will cover these - discuss, show-and-tell, diagram, etc. - in the Thursday class. While some brief notes are included below, be prepared to [take your own notes](/standards#taking-notes-in-class). 

[Introduction to mapping services](location-map-essentials). 

[Using a table view as a select list](select-list-webapi).

[Core Data and photo](core-data-photos) storage.

A reminder to learn via the code examples.

<br>

### Monday plan

Work on the programming assignment, and get help from a classmate or the professor if you need it. 

<br>

### Code examples

The course's GitHub repo has code examples for many topics and techniques. You can download a zip of the code repo, or clone it. 
* W11a1Select
* W11a3Map
* W11a4MapTask
* W11a5Camera

<br>

### Summary

Here's a list of topics that we learned something about this week:
1. MKMapView is the user interface object that can be placed on a scene. 
1. To use it on a scene, some configuration must be done, an outlet, and other settings. 
1. MKMapView needs a coordinate for its center point and a scale. 
1. The coordinate can be provided, or the current user location can be used, as the center point. 
1. If a map view is to be a full-screen viewer (or selector), then use the *task pattern* to present it modally. 
1. It is fairly easy to add a *map annotation*, which appears as a red pin-drop. 
1. Any coordinate (provided, current user location, map annotation) can also include title info that appears when tapped. 
1. The documentation links have many nore interesting facts and guidance items. 
1. Item-selection is a commonly done task, and the base iOS SDK has many built-in item selectors (name them - there are eight). 
1. In addition, a *table view* can be used as an item selector, and is preferred for many scenarios. 
1. In that scenario, use a *task pattern* to present it modally. 
1. Its source of data can be anything - static, programmatically-generated, or fetched from the data store of from the network. 
1. Configure the cell with enough data to enable the user to make a selection with confidence. 
1. Optionally, you can support (disclosure or detail) workflow to even more detailed data, if required. 
1. Multiple select can be configured, if required. 
1. Core Data enables the management and storage of byte-oriented data, like photos, audio, or video. 
1. For the entity attribute, the Core Data type is "Binary Data", and it should (must?) be configured as "Allows External Storage". 
1. For a photo, we write code to marshal it back-and-forth to-and-from `UIImage` and `Data`. 
1. The code examples offer several learning opportunities, so make sure they are carefully studied and executed. 

<br>
