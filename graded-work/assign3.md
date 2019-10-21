---
title: Assignment 3
layout: default
---

## DPS923 and MAP523 Assignment 3

Assignment 3 enables you to show how to use the network in an iOS app. 

Read/skim all of this document before you begin work.

While you are doing the work, if a *specific task* is not clear, or it seems to require an unreasonable amount of time to complete, contact your professor. 

<br>

### Due Date

Sunday, November 3, 2019, at 11:00pm ET  
Grade value: 14% of your final course grade

> Notice the due date change, from Friday to Sunday.  
> This is intended to be helpful by taking a bit of pressure off the Friday experience.  

*If you wish to submit the assignment before the due date and time, you can do that.*

<br>

### Overview and purpose

The app will let the user maintain information about lovable cats &#128049; &#128008; that are owned by you, your family, and friends. The app's data is stored on a web API that you will create. 

Here are the point-form specifications (which will be expanded on in the sections that follow). 

It's a multi-scene app:
* List of cats 
* Cat info scene (disclosure accessory)
* Detail scene (detail accessory)
* Add a new cat
* Edit an existing cat

Also, the app: 
* Has a navigation interface
* And a data model, implemented using best practices 
* And is deployed to an iOS device 

> DPS923 students will have a few additional specifications. 

<br>

### Getting started, web API

Your professor has discovered a very nice and useful service: **[restdb.io](https://restdb.io)**

> From its web site...  
> restdb.io is probably the easiest online NoSQL database backend for web and serverless applications. Model your information quickly. The data management application, schema and REST API are instantly available.

For small projects (like this one), it is free to use. 

Each student will:
1. Sign up for a restdb.io account 
2. Generate data using mockaroo.com 
3. Import the data into a new restdb.io database collection

Your Assignment 3 app will use the result as its web API. 

<br>

#### Sign up for a restdb.io account

Visit [restdb.io](https://restdb.io), and [sign up](https://restdb.io/signup) for an account. It doesn't matter what option you choose (Google, Facebook, email), just pick one that will be convenient for you. 

After login, it will probably show you a list of your databases, which will be empty. 

<br>

#### Generate data using mockaroo.com 

The app needs some starter data. Visit [mockaroo.com](https://mockaroo.com). 

We need a variety of data types. Configure the setup screen so that it is similar to the example shown below. (Click/tap to open it full-size in a new tab/window.)

<a href="images/a3-mockaroo-data-v1.png" target="_blank"><img src="images/a3-mockaroo-data-v1.png" alt="Mockaroo data gen" /></a>

Here are a few comments about the data and its setup:

The "breedId" is a string (text) value that holds a cat breed identifier. The possible values are specified by another web API, [TheCatAPI](https://thecatapi.com). Here they are - copy the string below into the Mockaroo "Custom List" text field:

```text
abys, aege, abob, acur, asho, awir, amau, amis, bali, bamb, beng, birm, bomb, bslo, bsho, bure, buri, cspa, ctif, char, chau, chee, csho, crex, cymr, cypr, drex, dons, lihu, emau, ebur, esho, hbro, hima, jbob, java, khao, kora, kuri, lape, mcoo, mala, manx, munc, nebe, norw, ocic, orie, pers, pixi, raga, ragd, rblu, sava, sfol, srex, siam, sibe, sing, snow, soma, sphy, tonk, toyg, tang, tvan, ycho
```

Notice that "weightKg" and "rating" are numbers, but the first one has decimal places. We want to work with this difference in our app. 

The "photoUrl" field will get a placeholder (dummy) image URL, but our app will allow it to be updated by a URL to a real cat photo. 

Generate and save between 100 and 150 rows of data. 

<br>

#### Import the data into a new restdb.io database collection

Return to the restdb.io app. Create a new database. You can use this database for Assignment 3, and maybe Assignment 4. 

We suggest that you choose a "Name" that combines your name initials and the course code. (The "Create New Database" task will then add a four-character suffix to the) For example, your professor's name initials are "PAM", so the database was named `pamdps923-de33`. 

After creation, click its name on the left side of the list, and the database manager screen appears. Enable "Developer Mode", by clicking on the gear icon in the upper-right area of the screen.

![restdb.io developer mode](images/a3-restdbio-developer-mode.png)

A multi-panel screen appears. The "Resources" tab shows the list of collections in the database (and the collections on the list are internal system-level collections for use by the database manager itself). 

Notice the "Import" button on the right side - click that. Then drag the Mockaroo-generated JSON file into the drop target area. Click the "Upload" button, and it will attempt to read the data. If successful, it will show the results. (Click/tap to open it full-size in a new tab/window.)

<a href="images/a3-restdbio-create-collection-import.png" target="_blank"><img src="images/a3-restdbio-create-collection-import.png" alt="restdb.io create collection import" /></a>

Decide on and enter a collection name (e.g. a3cats). (The collection name will obviously appear in the URLs to the web API.) Complete the task, and it now appears at (or near) the top of the list on the "Resources" tab. 

<br>

#### Generate an "API key"

Every request to the web API must include an "API key". Therefore, generate one, and be prepared to use it in your app (and in the Postman app during testing). 

Click the "API keys" tab, then the "Manage API-keys" button. Add a new "Web page API keys (CORS)". In its dialog, enter a description that's meaningful to you. Then, choose to enable all of the "REST methods". Save, and it will generate a 24-character key. 

Every request will must include a custom header named `x-apikey`, and the value will be the generated API key. 

<br>

#### Test the result, and study the URL patterns

Use the Postman app. Test all of the typical requests:
* Get all
* Get one by its identifier
* Add new
* Edit existing
* Delete item

DO NOT continue until you have successfully tested these typical responses. If they don't work in Postman, they obviously won't work in your app. 

<br>

### Getting started, iOS app

Create a new iOS app, using the Single View Application template. The name of the app should be "**ILoveCats**".  

Follow best practices about project creation. Ask if you are unsure. 

<br>

### Doing the work

Again, as noted above, read/skim the rest of this document before you begin work. That way you know what's coming. 

Follow best practices and recommended guidance in all parts of your work. 

Test your work incrementally. Do one small task, and then test it to ensure that it works, before continuing. 

> DPS923 students will have a few additional specifications. 

<br>

#### Getting started

<mark>More to come.</mark>

<br>

#### Data model 

Classes and manager. 

TBA

<br>

#### DPS923 additional tasks 

Handling images from the web, the right way.  
Using two web APIs.  

<br>

### Testing your work

Test your work by running it on the simulator. Do this frequently and incrementally, after making any substantial changes. And, use the Xcode debugger to help. 

When the app is complete, create three screen captures. Here's what each scene will show:
1. TBA

<br>

### Reminder about academic honesty

When you are ready to submit your work, you will copy some of the code in your project to plain text files, so that the My.Seneca/Blackboard "SafeAssign" tool can do its job. The next section will tell you which files to copy.

> From the Blackboard web site:  
> SafeAssign compares submitted assignments against a set of academic papers to identify areas of overlap between the submitted assignment and existing works.

<br>

### Submitting your work

<mark>To be finalized</mark>

Follow these instructions to submit your work, before the due date and time:  

1. Locate your project folder in Finder (and we suggest that you make a copy for yourself).

2. At the same level, create a new folder named "MyCode".

3. From the TBA folder(s), copy these source code files to the "MyCode" folder:  
**TBA.swift**  
**DataModelClasses.swift**  
**DataModelManager.swift**  
**Main.storyboard**  
For each of these files, change the file name extension to "txt".

4. From wherever, copy the sketch you made of the app's scenes into the MyCode folder. Its name can be something like "SketchAppUI". 

5. From wherever, copy the three screen captures into the MyCode folder. Rename them to "TBA" (jpg or png, whatever), "TBA", and "TBA". 

6. Select the top-level folders:  
TBA  
MyCode  
Right-click, and choose **Compress 2 Items**, which creates a zip file (make sure the zip file is fairly small, around 2MB or less).  

7. Login to Blackboard/My.Seneca, and in this course's Assignments area, look for the upload link, and submit your work there.  

<br>
