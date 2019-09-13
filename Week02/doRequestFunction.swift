// Web API requestor, returns a "Courses" object (or nil)
// This is simple example, and is NOT a best practice
// The function is synchronous and will block the UI
// Students can use this code as-is,
// but it assumes the "package" struct is named "PackageCourses"
func doRequest(url: URL) -> PackageCourses? {
    
    // A do-catch statement handles errors
    // For the following, if there is an error, "catch" returns nil
    do {
        
        // Attempt to get the data from the web API
        let data = try Data(contentsOf: url)
        
        // Create and configure a JSON decoder
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        // Attempt to decode the data into a "PackageCourses" object
        let result = try decoder.decode(PackageCourses.self, from: data)
        
        // If it gets this far, it has been successful
        return result
    }
    catch {
        // Uh oh, error
        print("Request error: \(error.localizedDescription)")
        return nil
    }
}
