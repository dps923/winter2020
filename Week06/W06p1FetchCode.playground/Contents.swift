import UIKit
import PlaygroundSupport

// W06p1FetchCode
// This is the simplest URLSession fetch example possible

PlaygroundPage.current.needsIndefiniteExecution = true

let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
    // Get JSON as an untyped value (from the "/users" URL, it will be an array of objects)
    // In other words, for this quick example, we do not need a struct or class to define the data shape
    // (we just want to dump the JSON, not decode it)
    let json = try? JSONSerialization.jsonObject(with: data!, options: [])
    
    print("\ndata\n", data ?? "data is nil")
    print("\ndata (as JSON)\n", json ?? "data is nil, no JSON")
    print("\nresponse\n", response ?? "response is nil")
    print("\nerror\n", error ?? "error is nil")
}
task.resume()
