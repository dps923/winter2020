###  W08a2Canada

Based on the `TemplateCDv1` project template. 

It is a multi-scene app with a navigation interface.  
Its first scene is a list of *provinces* in Canada. The list starts out empty - you must add the raw data yourself. (Use Wikipedia or another source for data item values.)    
Its next scene is another list, of *cities* in a selected province. Again, the list starts out empty, and you must add the raw data yourself.  
It also has scenes to support drill-down (workflow), add, and detail.  

Its data model includes `Province` and `City` entities, defined in the Core Data model editor.  
There is a relationship between the entities - one province to many cities.  
Notice the use of a *predicate* in the city list controller. 
