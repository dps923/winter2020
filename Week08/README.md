## Week 8 code examples

These were created with: 
* Xcode version 10.3
* Project format Xcode 9.3 compatible
* Swift 5

Each code example should run on your computer. After opening, "Clean Build Folder" (Shift+Cmd+K) and then "Run" (Cmd+R). 

<br>

### W08a1CDIntro

Based on the `TemplateCDv1` project template. 

It is a two-scene app with a navigation interface.  
Has a list of objects, which can be added to.  
The drill-down workflow scene displays data for the selected item on the list.  

The app uses Core Data technologies.  
Data will survive app unloads and reloads, because it gets persisted to the app's private sandbox file system area. 

<br>

### W08a2Canada

It is a multi-scene app with a navigation interface.  
Its first scene is a list of *provinces* in Canada.  
Its next scene is another list, of *cities* in a selected province.  
It also has scenes to support drill-down (workflow), add, and detail.  

Its data model includes `Province` and `City` entities, defined in the Core Data model editor.  
There is a relationship between the entities - one province to many cities.  
Notice the use of a *predicate* in the city list controller. 

<br>
