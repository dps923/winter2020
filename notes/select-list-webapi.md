---
title: Select list with data from web API
layout: default
---

## Select list with data from web API

In this document, you will learn how to use a table view controller as a "select list". It will display a list of items that were fetched from the network, and enable the user to select one of the items. Upon selection, the selected item will be passed back to the controller that presented the select list. 

This is a modal scene, and therefore will use the well-understood "task" pattern (same as for add, edit, detail). 

<br>

### Major section

etc.

<br>

### Multiple select?

Yes, it can be done. 

Change the logic:
* Instead of the tap-to-select interaction, add a check mark to each tapped row 
* Add a "Save" button to the upper-right nav bar
* Code its logic to choose and return all check marked items 

<br>
