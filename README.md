#Inline Calculated Columns
SharePoint Calculated Columns with HTML formatting and JavaScript

##Creating a Calculated Column

* Create a new Calculated Column
* Set datatype to Number!
* Paste your ICC code
* Do not include this column in your ContentTypes

###ICC Basics

```PHP
="<img src='/_layouts/images/blank.gif' onload=""{"
	&"var myVar=1;"
&"}"">"
```

To SharePoint this is just a String, but it is parsed as HTML (provided you have set the datatype to Number!)

Once the (empty gif) IMG has loaded the onload event is triggered and the JavaScript is executed.
