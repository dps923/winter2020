---
title: 2D Graphics and Touch intro
layout: default
---

## 2D Graphics and Touch intro

A series of four code examples has been published in this week's repo folder. They introduce you to apps that works with graphics and touch:
1. Create shapes from code 
2. Add the ability to move a shape 
3. Add the ability to reposition, grow, and shrink a shape 
4. Do the above with images (instead of shapes), and add pinch-and-zoom, and rotation

<br>

### Graphics in iOS apps

The iOS SDK has five frameworks that can be used for graphics and animation:

**[UIKit](https://developer.apple.com/documentation/uikit)** provides basic 2D drawing, image handling, and ways to animate user interface objects.

**[Core Graphics](https://developer.apple.com/documentation/coregraphics)** is a C-based API that supports vector graphics, bitmap images, and PDF content. (Core Graphics is also known as **Quartz 2D**.)

**[Core Animation](https://developer.apple.com/documentation/quartzcore)** is part of the iOS graphics engine that adds smooth motion and dynamic feedback to the user interface. UIKit provides a simple API to animate views, this is using Core Animation. 
 
**[OpenGL ES](https://www.khronos.org/opengles/)** is the mobile version of OpenGL for high-performance 2D and 3D drawing.

**[Metal](https://developer.apple.com/metal/)** for high performance 3D graphics; combines OpenGL and [OpenCL](https://www.khronos.org/opencl/) concepts.

Today, you will use some **UIKit** and **Core Graphics** capabilities.

<br>

### Programmatically creating a view

Our user interfaces have included views that are defined on the storyboard.

Occasionally, we have added content views programmatically, but not often. 

The important idea today is that we will be programmatically creating graphics objects, and placing them on the apps’s visible surface.

For the explanation that follows, it will help if you think about the iOS device resting flat on a horizontal surface. We will then build a "view hierarchy" as "layers" that we place on top of the iOS device.

The *window* object is the first and bottom layer. An iOS app has one window object. Then, the iOS runtime typically adds a status bar, which you can see when viewing the home screen, and in many apps.

On top of the window object, a typical app adds another layer, which is a *view*. The size of the view typically matches the window size. In other words, full screen.

On top of the active full-screen view, your app (storyboard scene, or programmatically) can add more view objects. These are placed in layers, "on top" of the view and window layers.

From the Apple Developer documentation: 

<img src="https://docs-assets.developer.apple.com/published/7f180a9ffc/c05af6a2-c616-482b-8f65-98013d40bb05.png" class="border1" alt="Web API request intro sync app" />

<br>

### Graphics context for drawing bitmap graphics

iOS, like other computer graphics platforms, uses the concept of a [graphics context](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/dq_context/dq_context.html) for creating bitmap graphics.

The graphics context is an in-memory storage area, which gets configured with the graphical properties needed for your situation. We get a reference to the graphics context this way:

```swift
// Get the graphics context
let context = UIGraphicsGetCurrentContext()
```

The type of the graphics context is [CGContext](https://developer.apple.com/documentation/coregraphics/cgcontext). From its documention intro:

> The CGContext type represents a Quartz 2D drawing destination. A graphics context contains drawing parameters and all device-specific information needed to render the paint on a page to the destination, whether the destination is a window in an application, a bitmap image, a PDF document, or a printer.

Where do we use and code the graphics context? In a subclass of UIView. When you study today’s code examples, you will see a "Shape.swift" class, which is a subclass of UIView. This class is the graphical object that gets created programmatically.

<br>

#### Coordinate system of the graphics context

UIKit uses an *upper-left origin* coordinate system. You will see mentioned in Core Graphics / Quartz 2D documentation that this API uses a different *lower-left origin* coordinate system. This is rarely a problem in practice.

To make life easier for iOS developers, in the `UIView.draw(_:)` function, the context that is acquired there is setup to have a *upper-left origin*. In nearly all cases, `draw(_:)` is where an iOS app does its custom drawing using Core Graphics / Quartz 2D.

In summary, for the purposes of this course and for most apps you would work on, UIKit's *upper-left origin* is the coordinate system origin you will be using.

<br>

### Touch

The Apple iOS Human Interface Guidelines document discusses [Gestures](https://developer.apple.com/design/human-interface-guidelines/ios/user-interaction/gestures/).

Single tap (select)

Double tap (same finger) (often used to ‘zoom in’)

Tap + drag, one finger (move)

Two-finger tap (often used to ‘zoom out’)
*  a view is configured for one-finger touch, so you must enable multi-touch
*  on the simulator, must do this:
  1. Press and hold Option  
  2. Move pointer to move dots close to each other  
  3. Press and hold Shift  
  4. Move pointer to move dot over top of whatever you want to two-finger tap  
  5. Tap/click your pointer once 

Pinch, two fingers, bring them closer together  
Zoom, two fingers, move them farther apart

Rotate, two fingers, move at least one of them, keeping them the same distance from each other 

The [UIGuestureRecognizer](https://developer.apple.com/documentation/uikit/uigesturerecognizer) base class (and its subclasses) is used to detect and act upon guestures. There are specific versions for tap, pinch, and so on. 

<br>

### Views, and its base class, UIView

Take some time to learn more about views from the [Human Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/ios/overview/interface-essentials/), and then follow the [Views](https://developer.apple.com/design/human-interface-guidelines/ios/views/) link. 

Also, skim the document [View and Window Architecture](https://developer.apple.com/library/ios/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/WindowsandViews/WindowsandViews.html). It's a few years old, but is still good content. 

Finally, the [UIView reference documentation](https://developer.apple.com/documentation/uikit/uiview) is a full treatment of what you should eventually know. 

A view has a property named [subviews](https://developer.apple.com/documentation/uikit/uiview/1622614-subviews). It holds a collection of views. (Remember the "layers" discussion from above.)

You can use the "tag" property to identify a view with an integer. The view has a method "viewWithTag()" that enables you to get a reference to a subview using its integer identifier.

There are a number of UIView methods that enable you to modify the view hierarchy (i.e. the layers), including:
* bringSubviewToFront(_:)
* sendSubviewToBack(_:)
* insertSubview(_: at:)
* exchangeSubview(at: withSubviewAt:)
* removeFromSuperview()

<br>

#### Creating a UIView programmatically

Create a new item in your project, a "Cocoa Touch Class", which inherits from UIView. 

Then, it needs at least one initializer (i.e. "constructor" in other languages), and a `draw(_:)` method. Here is a good starting point for subclassing a UIView:

```swift
class CustomView: UIView {

  // This is required
  override init(frame: CGRect) {
    super.init(frame: frame)
      commonInit()
  }

  // This is also required
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
      commonInit()
  }

  // Here is where you write your custom initializer code
  private func commonInit() {
    // put initialization code here
  }

  // This too is required
  override func draw(_ rect: CGRect) {
    // your custom code here
  }

}
```

<br>

#### Drawing in the `draw(_:)` method

The pattern for this task is to first access a graphics context with `UIGraphicsGetCurrentContext()`, and then to use its methods. For example:

```swift
    // Draw a diagonal line using new syntax
    override func draw(_ rect: CGRect) {

        if let context = UIGraphicsGetCurrentContext() {

            context.setStrokeColor(UIColor.red.cgColor);
            context.setLineWidth(2.0);
            context.move(to: CGPoint(x: 0, y: 0))
            context.addLine(to: CGPoint(x: 100, y: 100))
            context.strokePath()
        }
    }
```

<br>

### More info

Apple does have a fairly recent document, the [Quartz 2D Programming Guide](https://developer.apple.com/library/mac/documentation/GraphicsImaging/Conceptual/drawingwithquartz2d/Introduction/Introduction.html).

Ray Wenderlich has [a series of tutorials](https://www.raywenderlich.com/library?q=core+graphics&sort_order=relevance) on this topic. Content from that web site is typically good quality.

[Here](http://www.techotopia.com/index.php/An_iOS_8_Swift_Graphics_Tutorial_using_Core_Graphics_and_Core_Image) is a decent tutorial on this topic, using Swift.


<br>
