###  W04a1NavIntro

Introduces you to the *navigation interface*.

This app was built with the single-view application template. Then, the following tasks were done, in sequence (and each was tested as it was done):

Open `ViewController.swift` for editing.  
Select the class name (ViewController), then right-click, refactor, rename, to `First.swift`.  
> You may have to manually update the comment text yourself.  
> Sometimes Xcode's refactor-rename doesn't do this. 

In the project navigator, select the yellow folder that holds the project's code assets.  
Create a new view controller (Cocoa Touch Class), named "Next".  
Create another new view controller, named "Last".

Embed the "First" view controller in a navigation controller:  
Show the `Main.storyboard` in the editor.  
Select the "First" view controller object (in the dock area).  
On the Editor menu, choose "Embed In" a "Navigation Controller".  
Notice the changes in the storyboard.  
> You should move the storyboard items to align them horizontally.  

Still on the storyboard, use the object library to add a view controller, located to the right of the "First" scene.  
On the identity inspector, set the class name to "Next". 

Add another view controller to the storyboard, located to the right of the "Next" scene.  
On the identity inspector, set the class name to "Last".

To the First scene, add and configure a button, and a label to hold data.  
Create an outlet from the label.  

To the Next scene, do the same. (Button, and a label that is an outlet.)

To the Last scene, we do not need a button, but we do need a label that is an outlet. 

Create a "Show" segue from First to Next. Its identifier will be "toNext".    
In the Next controller code, create a variable to hold incoming data.  
In `viewDidLoad()`, set the label outlet's text property to the string value of the incoming data.  
In the First controller code, implement the `segue(for: sender:)` method.  
Get a reference to the next controller, and pass on the desired data.  

Do a similar set of tasks to segue from the Next to Last scenes. 
