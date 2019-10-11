//
//  TypicodePost.swift
//  W06a2WebApiMore
//
//  Created by Peter McIntyre on 2019-10-10.
//  Copyright © 2019 SICT. All rights reserved.
//

import UIKit

class TypicodePost: UIViewController {
    
    //MARK: - Variables
    
    // https://jsonplaceholder.typicode.com
    var postResult: TCPost!
    
    //MARK: - Outlets
    
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    
    @IBOutlet weak var commentTitle: UITextField!
    @IBOutlet weak var commentContent: UITextView!
    
    @IBOutlet weak var commentStepper: UIStepper!
    @IBOutlet weak var userIdStepper: UIStepper!
    
    @IBOutlet weak var saveResult: UILabel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the labels
        commentLabel.text = "Comment number \(Int(exactly: commentStepper.value)!)"
        userIdLabel.text = "User identifier \(Int(exactly: userIdStepper.value)!)"
        
        // Draw a nice-looking border around the UITextView
        // to make it look similar to a UITextField
        commentContent.layer.borderWidth = 0.4
        commentContent.layer.cornerRadius = 5.0
        commentContent.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
    }
    
    // MARK: - Actions
    
    // Handle comment number stepper value change
    @IBAction func commentStepperChange(_ sender: UIStepper) {
        commentLabel.text = "Comment number \(Int(exactly: sender.value)!)"
    }
    
    // Handle user identifier stepper value change
    @IBAction func userIdStepperChange(_ sender: UIStepper) {
        userIdLabel.text = "User identifier \(Int(exactly: sender.value)!)"
    }
    
    // Handle save button (in the nav bar)
    @IBAction func saveItem(_ sender: UIBarButtonItem) {
        
        // Force the keyboard to disappear
        commentTitle.resignFirstResponder()
        commentContent.resignFirstResponder()
        
        // Three tasks to be done:
        // 1. Assemble the data, into an object
        // 2. Create a custom "request" object
        // 2. Perform the data task with the new request
        
        // Assemble the data that we are going to send
        
        let newComment = TCPost(id: Int(commentStepper.value), userId: Int(userIdStepper.value), title: commentTitle.text!, body: commentContent.text)
        // Incidentally, your professor has learned that the value
        // for the TCPost "id" property is not echoed back by the web API
        // Instead, no matter what we send, it returns "101" as the value
        
        // Create and configure a custom request object
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        // Create (define) a task; remember that we are just defining it
        // After the multi-line statement executes, "task" exists,
        // but it is in a "suspended" state
        
        // The task requires a callback parameter, which is a Swift closure
        // When the task completes, it will call the closure (function),
        // and pass some arguments; all three are optional; see the docs...
        // https://developer.apple.com/documentation/foundation/urlsession/1410330-datatask
        
        // NEW
        // Create and configure a request object
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Prepare the data to be sent
        let encoder = JSONEncoder()
        // For this example, we will disable error-handling with try!
        request.httpBody = try! encoder.encode(newComment)
        
        // Perform the data task
        
        // NEW
        // The "with" parameter value is now the request object created above
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Do two checks BEFORE attempting to extract the data from the response
            // 1. Check whether an "error" object was passed in
            // 2. Check that the HTTP response status is what we expect
            
            // If there is an error, then "error" will have something in it
            // Otherwise, it will be nil
            if let error = error {
                print(error)
                // NEW
                DispatchQueue.main.async {
                    self.saveResult.text = "Error, communication"
                }
                return
            }
            
            // We want to ensure that we have a good HTTP response status
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
                else {
                    print(response?.url?.path ?? "Status code error")
                    // NEW
                    DispatchQueue.main.async {
                        self.saveResult.text = "Error, invalid response"
                    }
                    return
            }
            
            // If we're here, we can get started on
            // extracting the data from the response
            
            // Ensure that three conditions are met (multiple if-let)...
            // 1. Non-nil Content-Type header
            // 2. Content-Type starts with "application/json"
            // 3. Data is non-nil
            if let mimeType = httpResponse.mimeType,
                mimeType.starts(with: "application/json"),
                let data = data {
                
                // Create and configure a JSON decoder
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                // Attempt to decode the data into a "TCPost" object
                do {
                    let result = try decoder.decode(TCPost.self, from: data)
                    
                    // Diagnostic
                    dump(result)
                    
                    // Save the data (in memory)
                    //self.items = result.data
                    self.postResult = result
                    // Then reload the table view; must be done this way
                    DispatchQueue.main.async {
                        self.saveResult.text = "Save was successful"
                    }
                }
                catch {
                    print(error)
                }
            }
            else {
                DispatchQueue.main.async {
                    self.saveResult.text = "Error, unexpected response"
                }
            }
        }
        
        // Now that "task" has been fully defined, execute it...
        task.resume()
        
    }
    
}
