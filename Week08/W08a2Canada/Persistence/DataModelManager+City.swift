//
//  DataModelManager+City.swift
//  Purpose - Properties and methods for a specific entity in the app's data model
//

import CoreData

extension DataModelManager {
    
    // Methods included:
    // Count all or some
    // Fetch all
    // Fetch some
    // Fetch one by object identifier
    // Fetch one by matching another attribute
    // Create new item
    // Delete item
    // Delete all items
    
    // Count all (nil predicate) or some (non-nil configured predicate)
    func city_Count(withPredicate: NSPredicate) -> Int {
        
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        fetchRequest.predicate = withPredicate
        
        do {
            let count = try ds_context.count(for: fetchRequest)
            return count
        } catch let error {
            print(error.localizedDescription)
        }
        return 0
    }
    
    // Fetch all
    func city_GetAll() -> [City]? {
        return city_GetSome(withPredicate: nil)
    }
    
    // Fetch some
    func city_GetSome(withPredicate: NSPredicate?) -> [City]? {
        
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        fetchRequest.predicate = withPredicate
        
        // Optional, configure one or more sort descriptors here
        //fetchRequest.sortDescriptors?.append(NSSortDescriptor(key: "name", ascending: true))
        //fetchRequest.sortDescriptors?.append(NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.caseInsensitiveCompare(_:))))
        
        do {
            let results = try ds_context.fetch(fetchRequest)
            return results
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
    
    // Fetch one, by its unique object identifier
    func city_GetByObjectId(_ objectId: NSManagedObjectID) -> City? {
        
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "self == %@", objectId)
        
        do {
            let results = try ds_context.fetch(fetchRequest)
            if results.count == 1 {
                return results[0]
            } else {
                return nil
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    // Fetch one, by another attribute that has unique values (e.g. "name")
    func city_GetByName(_ name: String) -> City? {
        
        let fetchRequest: NSFetchRequest<City> = City.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name ==[c] %@", name)
        
        do {
            let results = try ds_context.fetch(fetchRequest)
            if results.count == 1 {
                return results[0]
            } else {
                return nil
            }
        } catch let error {
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    // Create new
    func city_CreateItem() -> City? {
        
        guard let newItem = NSEntityDescription.insertNewObject(forEntityName: "City", into: ds_context) as? City else {
            print("Cannot create a new item")
            return nil
        }
        return newItem
    }
    
    // Delete item
    func city_DeleteItem(item: City) {
        ds_context.delete(item)
        ds_save()
    }
    
    // Delete all
    func city_DeleteAll() {
        if let result = city_GetAll() {
            for obj in result {
                ds_context.delete(obj)
            }
            ds_save()
        }
    }

}
