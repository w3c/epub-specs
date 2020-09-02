# navigator.epubReadingSystem #

## Summary ##
Returns an object that represents the current reading system. Every reading system that supports scripting in any fashion MUST provide this object.


## Syntax ##
```

_ReadingSystem_ = navigator.epubReadingSystem;
```


## Example ##
```

var feature = "dom-manipulation";
var conformTest = navigator.epubReadingSystem.hasFeature(feature);
alert("Feature " + feature + " supported?: " + conformTest);
```

#### A list of feature names is provided below. ####


## Properties ##
These properties MUST be provided
| **Name** | **Type** | **Notes**|
|:---------|:---------|:---------|
|```
name```|```
String```|The name of the reading system. Example: "iBooks", "Kindle"|
|```
version```	|```
String```|The version of the reading system. Example: "1.0", "2.1.1"|
|```
layoutStyle```|```
String```|The style of layout for the content. Possible values are "paginated" and "scrolling". A reading system may define a third value if it comes up with a new layout style.|


## Methods ##
These methods MUST be implemented
| **Name** | **Return** | **Notes**|
|:---------|:-----------|:---------|
|```
hasFeature(feature[, version])```|```
boolean or undefined```|Returns true if the specified version of the feature is supported. Returns false if the specified version of the feature is not supported. Returns undefined if the feature is unknown to the reading system. If version is not specified, test for any version of the feature. Feature names are case-insensitive.|



## Features ##
These features MUST be implemented

| **Name** |  **Notes**|
|:---------|:----------|
|```
dom-manipulation```|	The content is allowed to make structural changes to the document’s DOM.|
|```
layout-changes```|	The content is allowed to modify attributes and CSS styles that affect content layout.|
|```
touch-events```|	The device supports touch events and the reading system passes touch events to the content.|
|```
mouse-events```|	The device supports mouse events and the reading system passes mouse events to the content.|
|```
keyboard-events```|	The device supports keyboard events and the reading system passes keyboard events to the content.|



## Potential Features ##
These features need further discussion

| **Name** |  **Notes**|
|:---------|:----------|
|```
spine-scripting```|Scripting is supported at the spine level. This feature is provided for the benefit of container scripts.|
|```
container-scripting```|Scripting is supported at the iframe level. This feature is provided for the benefit of spine scripts. It can be expected that any reading system that supports spine scripts also supports container scripts, so this feature may be unnecessary.|