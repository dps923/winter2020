###  W03a3FetchMany

Shows the ability to use a web API to fetch data, using many requests.   

> This code example was created in November 2018 (a year ago),  
> and lightly freshened for use in this current course.  
> It has minor differences - the newer code is a bit better, but the technique is similar.  

A `WebApiRequest.swift` source code file has a class for a "request".  
A WebApiRequest object is instantiated in a manager class (extension).  
The object is configured with a URL and any variable data for the URL.  
An expected response data type is provided, as is a completion handler closure function.  

The `DataModelClasses.swift` source code file has structs  
that define the *shape* of the response data. 
