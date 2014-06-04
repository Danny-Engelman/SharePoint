#Inline Calculated Columns
SharePoint Calculated Columns with HTML formatting and JavaScript

##Creating a Calculated Column

* Create a new Calculated Column
* Set datatype to Number!
* Paste your ICC code
* Do not include this column in your ContentTypes

###ICC Basics

```OCaml
="<B>"
&[Created]
&"</B>"
```

####HTML code
```OCaml
="<SELECT onchange=""{alert(this);}"">"
&" <OPTION value=""(1) Low"" >(1) Low</OPTION>"
&" <OPTION value=""(2) Normal"" >(2) Normal</OPTION>"
&" <OPTION value=""(3) High"" >(3) High</OPTION>"
&"</SELECT>"
```

####Executing JavaScript
```OCaml
="<img src='/_layouts/images/blank.gif' onload=""{"
	&"var myVar=1;"
&"}"">"
```

To SharePoint this is just a String, but it is parsed as HTML (provided you have set the datatype to Number!)

Once the (empty gif) IMG has loaded the onload event is triggered and the JavaScript is executed.
