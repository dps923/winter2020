//
//  CDStack.swift
//  Purpose - Core Data stack for the app
//

import CoreData

class CDStack {
    
    // MARK: - Properties
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "AppData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                // In a production/shipping app, replace this implementation
                // with code to handle the error appropriately.
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Lifecycle
    
    init(model: DataModelManager) {
        
        // The purpose of this initializer is to get or generate starter data for the app
        
        // Get the path to the persistent store file
        let applicationSupportDirectory = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        let pathToStoreFileInDocumentsDir =  applicationSupportDirectory.appendingPathComponent("AppData.sqlite")
        
        // Uncomment this to view and copy the path and use it in Finder
        //print(pathToStoreFileInDocumentsDir.description)
        
        // If the persistent file does not exist,
        // it means that the app is being launched (run) for the first time
        if !FileManager.default.fileExists(atPath: pathToStoreFileInDocumentsDir.path) {
            
            // Check whether the app is supplied with starter data in the app bundle
            
            // Get the URL to the object store file in the app bundle
            let storeFileInBundle = Bundle.main.url(forResource: "AppData", withExtension: "sqlite")
            
            if storeFileInBundle == nil {
                
                // The bundle does NOT include a store file,
                // so we must create our own starter data
                StoreInitializer.addStarterData(context: persistentContainer.viewContext)
                // Save the new items that were added to the context
                save()
            } else {
                
                // Use the supplied starter data, abort if error copying
                // Copy the persistent store file to the right place
                try! FileManager.default.copyItem(at: storeFileInBundle!, to: pathToStoreFileInDocumentsDir)
            }
        }
    }
    
    // MARK: - Public methods
    
    func save() {
        let managedObjectContext = persistentContainer.viewContext
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                if let details = error.userInfo["NSDetailedErrors"] as? [NSError] {
                    for detail in details {
                        if let badKey = detail.userInfo["NSValidationErrorKey"], let badObject = detail.userInfo["NSValidationErrorObject"] {
                            let msg = "Error on save, check Core Data constraints on '\(badKey)'.\n" +
                                "(A non-optional attribute or relationship in Core Data can cause this.)\n" +
                            "Attempted to save object: \(badObject)"
                            print(msg)
                        }
                    }
                }
                // In a production app, you may not want a fatal error here. Is this something you should
                // warn the user about instead? Perhaps there is a way to recover from a problem saving.
                fatalError("CDStack save error \(error), \(error.userInfo)")
            }
        }
    }
    
    func createFetchedResultsControllerForEntityNamed<T>(_ entityName: String, withPredicateFormat predicate: String?, predicateObject: [AnyObject]?, sortDescriptors: [NSSortDescriptor]?, andSectionNameKeyPath sectionName: String?) -> NSFetchedResultsController<T> {
        
        // This factory method will create and return a fully-configured fetched results controller (frc)
        // Its arguments are simple strings, for entity name, predicate, and sort descriptors
        // sortDescriptors can be nil, or a comma-separated list of attribute-boolean (true or false) pairs
        // After initialization, the code can change the configuration if needed
        // Before using the results in an frc, you must call the performFetch method
        
        let managedObjectContext = persistentContainer.viewContext
        
        // Create the fetch request
        let fetchRequest = NSFetchRequest<T>()
        
        // Configure the entity name
        let entity = NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext)!
        fetchRequest.entity = entity
        
        // Set the batch size to a reasonable number
        fetchRequest.fetchBatchSize = 20
        
        // Configure the predicate
        if let predicate = predicate, let predicateObject = predicateObject {
            fetchRequest.predicate = NSPredicate(format: predicate, argumentArray: predicateObject)
        }
        
        // Configure the sort descriptors
        if let sortDescriptors = sortDescriptors {
            fetchRequest.sortDescriptors = sortDescriptors
        }
        
        // Important note!
        
        // This factory does NOT configure a cache for the fetched results controller
        // Therefore, if your app is complex and you need the cache,
        // replace "nil" with something (e.g. name of the entity) in the following statement
        
        return NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext:managedObjectContext, sectionNameKeyPath: sectionName, cacheName: nil)
    }
    
}
