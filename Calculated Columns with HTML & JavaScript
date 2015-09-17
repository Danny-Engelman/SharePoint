#Inline Calculated Columns / ViewMasters
SharePoint Calculated Columns with HTML formatting and JavaScript

##New website: [http://ViewMaster365.com](http://ViewMaster365.com)

##Creating a Calculated Column

* Create a new Calculated Column
* _Set datatype to Number!_
* Paste your ICC code
* Do not include this column in your ContentTypes

###ICC Basics

####parsing HTML code
```OCaml
="<B>"
&[Created]
&"</B>"
```
The Created date is concatenated with 2 strings containing HTML formatting
HTML formatting is only parsed by SHarePoint for Calculated Columns set to Number (or anything but Text)

NOTE! mid 2013 Microsoft added some checking which disables the use of the ```<SCRIPT>``` tag in Calculated Columns

But there are other ways..

####Executing JavaScript from HTML
```OCaml
="<SELECT onchange=""{"
	&"alert(this);"
&"}"">"
&" <OPTION value=""You selected One"" >One</OPTION>"
&" <OPTION value=""You selected Two"" >Two</OPTION>"
&"</SELECT>"
```
Note the double-double-quotes where we need a single-double-quote in our HTML or JavaScript.
A single-double quote always ends the SharePoint String

The HTML code in the Browseris:
```HTML
<div align="right" class="ms-number">
	<select onchange="{alert(this);}">
		<option value="You selected One">One</option>
		<option value="You selected Two">Two</option>
	</select>
</div>
```
SharePoint adds an extra DIV to align the Cellcontents (datatype=Number) to the right
####Executing JavaScript at Pageload
```OCaml
="<img src=""/_layouts/images/blank.gif"" onload=""{"
	&"console.log("
		&[Created]
	&")"
&"}"">"
```
The HTML generated (for one table row cell) is:
```HTML
<div align="right" class="ms-number">
	<img src="/_layouts/images/blank.gif" onload="{console.log(41456,7035416667)}">
</div>
```

Once the (empty gif) IMG has loaded the onload event is triggered and the JavaScript is executed.
