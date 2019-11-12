---
title: Core Data model with multiple entities
layout: default
---

## Core Data model with multiple entities

This document presents the highlights of working with a Core Data model that has more than one entity, some of which are related. 

<br>

### Working code example

The code example repo has a `W10a1Entities` code example that you can use when going through this document. The app's data model has three entities:  
1. Company 
2. Employee
3. Product

A company has a collection of employees. And, it has a collection of products. 

When it starts, it shows the logical root data, the list of companies. It enables a disclosure (drill-down) workflow scene. 

<img src="/media/multi-company-list.png" class="border1" alt="Company list" />&nbsp;&nbsp;<img src="/media/multi-company-scene.png" class="border1" alt="Company scene" />

For each company, the scene offers a disclosure workflow to either employees or products. Here's the employees pair of scenes. 

<img src="/media/multi-employee-list.png" class="border1" alt="Employee list" />&nbsp;&nbsp;<img src="/media/multi-employee-scene.png" class="border1" alt="Employee scene" />

Here's the products pair of scenes.

<img src="/media/multi-product-list.png" class="border1" alt="Product list" />&nbsp;&nbsp;<img src="/media/multi-Product-scene.png" class="border1" alt="Product scene" />



<br>

### Highlights and differences

Here are the highlights and differences:

In the model editor:
* tba

Property values
* collection, object 

Click/tap to open full-size in a new tab/window.

<a href="/media/multi-core-data-model.png" target="_blank"><img src="/media/multi-core-data-model.png" alt="Data model" /></a>

<br>

### Learning resources and references

(more to come)

<br>
