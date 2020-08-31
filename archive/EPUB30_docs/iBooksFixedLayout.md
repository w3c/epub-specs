# iBooks Fixed Layout Format #

In iBooks, the Fixed Layout Format is an EPUB that utilizes CSS positioning and the HTML viewport meta tag to create precise layouts including full-bleed images and text overlapping images.

The Fixed Layout Format is like the Flowing Format with the addition of the following guidelines:
  * Use a separate XHTML document for each Fixed Layout page.
  * Use CSS relative and/or absolute positioning to place text and images on a page.
  * Include the height and width of the page in a viewport meta tag in the head of each XHTML document. These dimensions determine the aspect ratio of a page, allowing a page to maintain its precise layout on any size device, in any orientation, for both landscape-dominant and portrait-dominant books. Example of viewport dimensions:

```
<head>	
	<title>Fixed Layout Example</title>
	<meta content="text/html; charset=UTF-8"/>
	<link href="css/stylesheet.css" type="text/css" rel="stylesheet"/>
	<meta name="viewport" content="width=575, height=432"/>
</head>
```

Reading systems that do not support a viewport or absolute positioning should display the page contents with relative positioning. As a result, text and images would display in a linear fashion instead of being layered over one another and would function like a Flowing page .