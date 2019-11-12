###  W10a1Entities

Based on the TemplateCDv2 project. 

This loads a multi-entity data model, from a JSON file in the app bundle.  
The data model has three entities:  
1. Company 
2. Employee
3. Product

A company has a collection of employees. And, it has a collection of products. 

This is an overview of the app-building process:
1. Add the JSON file to the project.
2. Write data model classes (structs actually) for the incoming data.
3. Use the Core Data model editor to define new entities and relationships. 
4. In the store initializer, write code that loads the data into the Core Data store.
5. For the following, alternate between coding the controller, and the storyboard scenes.
6. Rename ExampleList controller to CompanyList, and edit it to show a list of companies.
7. Add a CompanyScene scene and controller, and edit CompanyList to segue to it. 
8. Copy the CompanyList code to a new ProductList controller, and edit its code.
9. Do the same, CompanyScene to ProductScene. 
