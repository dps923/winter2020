---
title: User interface layout fundamentals
layout: default
---

## User interface layout fundamentals

Until January 2010, the task of user interface layout was an easy task (ha ha). The only issue was portrait vs. landscape orientation on the iPhone. Since 2008, when the iOS SDK was released, Xcode and Interface Builder provided a way to use layout "constraints" (and scrolling views) to handle these situations. 

Then, the iPad was introduced, and its larger screen. Up next, in September 2012, with the release of iPhone 5 and its larger screen, changed this task for iPhone apps. Since then, chaos. (Ha ha.)

The current approach is Auto Layout. Before continuing, read/skim these sections of the *Auto Layout Guide*:  

[Understanding Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/index.html)  

[Working with Constraints in Interface Builder](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithConstraintsinInterfaceBuidler.html#//apple_ref/doc/uid/TP40010853-CH10-SW1)

[Simple Constraints](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSimpleConstraints.html#//apple_ref/doc/uid/TP40010853-CH12-SW1)

[Debugging Auto Layout](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/TypesofErrors.html#//apple_ref/doc/uid/TP40010853-CH17-SW1)

<br>

### Screen size measurements 

Since iOS development began in 2008, developers were (and still are) required to use *points*, and *NOT PIXELS*, when considering screen size measurements. 

As developers, we need to know a few things about screen sizes. First, the screen origin is the upper-left corner - that's 0 x and 0 y. 

While other sources ([here](https://developer.apple.com/library/archive/documentation/DeviceInformation/Reference/iOSDeviceCompatibility/Displays/Displays.html), [here](https://kapeli.com/cheat_sheets/iOS_Design.docset/Contents/Resources/Documents/index)) are more complete, the essential need-to-know is that the screen size for a few iPhone models in portrait orientation are shown below:

Model | Diagonal size<br>(marketing/product info) | Points size | Pixel resolution | PPI density 
--- | --- | --- | --- | ---
7 or 8 | 4.7 inch | 320 points horizontal<br>x<br>568 points vertical | Don't care | Don't care
7 Plus<br>or 8 Plus | 5.5 inch | 414 x 736 | " | "
X or XS | 5.8 inch | 375 x 812 | " | "
XR | 6.1 inch | 414 x 896 | " | "
XS Max | 6.5 inch | 414 x 896 | " | "

The bottom line is that we're typically working with a reasonably narrow range of values, but we still must adapt our user interfaces. 

The following sections cover two specific layout tasks. To be an effective iOS developer, *you must learn these and additional techniques* for your apps. A warning, it's not easy, but the task does get easier with practice and learning. 

<br>

### Side-by-side views

The following will be demonstrated by the professor, in class. The idea is that you will be able to do the same on your own. 

Scenario:
* image view beside a map view
* equal widths
* constant-size gap between

How to:
1. drag image view, size accordingly 
1. set height to a constant value
1. drag map view, align its top edge to match the image view, size accordingly
1. set height to a constant value
1. set width to use the default gap

Then:
1. select both
1. add new constraints
1. choose Equal Widths, and save, red lines (angry)
1. Resolve Auto Layout Issues, in the top Selected Views area, choose Add Missing Constraints
1. the constraint lines all turn blue 

<br>

### Width of labels and text fields

The following will be demonstrated by the professor, in class. The idea is that you will be able to do the same on your own. 

Scenario:
* two or more labels and/or text fields 
* to be positioned to fill the screen width (within margins)
* constant size vertical gap 

How to: 
1. drag a few labels anywhere (or one, then copy-paste)
1. drag a few text fields anywhere (ditto)
1. select all, set to a consistent font size (e.g. 24)
1. select all, then align left, red lines (angry)
1. move all to left margin, adjust each to match right margin
1. Resolve Auto Layout Issues, in the top Selected Views area, choose Add Missing Constraints 
1. the constraint lines all turns blue

<br>

### Next...

These exercises are the bare minimum to get started. 

As noted above, layout done right isn't easy, but the task does get easier with practice and learning.

<br>
