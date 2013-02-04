// Inline Calculated Column examples:
// * Copy-paste code into a Calculated Column
// * SWITCH DATATYPE TO NUMBER!!
// * Save

// If you get SharePoint errors past code line-by line
// detailed explanation: http://http://sharepointwijzer.nl/tech/icc-inline-calculated-columns/

################################################################# DaysSince a given (Due)Date, negative values for days in the past
="<script type='text/javascript'>"
&"var SPday=new Date();"
&"SPday.setFullYear( "
&YEAR([Due Date])
&","
&MONTH([Due Date])-1
&","
&DAY([Due Date])
&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"document.write(days);"
&"</script>"

################################################################# DaysSince and highlight past Items
="<div id='ThisID"
&[Due Date]
&"'>"
&"<script type='text/javascript'>"
&"var TRnode=document.getElementById('ThisID"
&[Due Date]
&"').parentNode.parentNode.parentNode;"
&"var SPday=new Date();"
&"SPday.setFullYear( "&YEAR([Due Date])&","&MONTH([Due Date])-1&","&DAY([Due Date])&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"if(days>-4100){"
	&"TRnode.style.backgroundColor=(days<0)?'Pink':'HoneyDew';"
	&"document.write(days);"
&"}"
&"</script></div>"

############################################## Progress bar based on field 'Percent'
="<DIV style='background-color:LimeGreen;align:left;'>"
&"<DIV style='color:white;background-color:red; width:"
&100-[% Complete]*100
&"%;'>"
&[% Complete]*100
&"%</DIV></DIV>"

############################################## Highlight TR with DIV id reference
=&"<div id='ThisID"
&[Due Date]
&"'>"
&"<script type='text/javascript'>"
&"var node = document.getElementById('ThisID"
&[Due Date]
&"').parentNode.parentNode.parentNode"
&"var SPday=new Date();"
&"SPday.setFullYear("&YEAR([Due Date])&","&MONTH([Due Date])-1&","&DAY([Due Date])&");"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"if(days>-4100){"
&"  node.style.backgroundColor=(days<0)?'Pink':'HoneyDew';"
&"  document.write(days);"
&"}"
&"</script></div>"

############################################## Highlight TR without DIV Id reference
="<img src='/_layouts/images/blank.gif' onload='javascript:{"
&"TRnode=this.parentNode.parentNode.parentNode;"
&"var SPday=new Date();"
&"SPday.setFullYear( "&YEAR([Due Date])&","&MONTH([Due Date])-1&","&DAY([Due Date])&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"if(days>-4100){"
	&"TRnode.style.backgroundColor=(days<0)?""Pink"":""HoneyDew"";"
&"}"
&"}'>"
&DAY([Due Date])&"-"&MONTH([Due Date])&"-"&YEAR([Due Date])

############################################## Highlight TR without with Text output
############################################## For colornames see: http://www.uize.com/examples/sortable-color-table.html
="<span></span>"
&"<img src='/_layouts/images/blank.gif' onload='javascript:{"
&"TRnode=this.parentNode.parentNode.parentNode;"
&"var SPday=new Date();"
&"SPday.setFullYear( "&YEAR([Due Date])&","&MONTH([Due Date])-1&","&DAY([Due Date])&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&" if(days>-4100){"
	&"var Range=[-21,-14,-7,0,7,14,21];"
	&"var CSS=[""salmon"",""lightCoral"",""Pink"",""lightGoldenrodYellow"",""lightGreen"",""mediumSeaGreen"",""limeGreen""];"
	&"for (i=0;i<Range.length;i++){Color=CSS[i];if(days<Range[i]){ break;}}"
	&"TRnode.style.backgroundColor=Color;"
	&"this.previousSibling.innerHTML=days+"" days ""+((days<0)?""past"":""left"");"
&" }"
&"console.log(Color);"
&"}'>"

############################################## Sum Calculated Column
="<script>"
&"var subtotal="&[Cost]&";"
&"document.write(subtotal);"
&"if(ICCtotal==undefined){var ICCtotal=subtotal;} else {ICCtotal=ICCtotal+subtotal;}"
&"if(prevTotal==undefined){var prevTotal=-1;}"
&"</script>"
&"<SPAN style='color:red; font-weight:bold'></SPAN>"
&"<img src='/_layouts/images/blank.gif' onload='javascript:{"
&"this.previousSibling.innerHTML=""<HR>""+ICCtotal;"
&"if(prevTotal.parentNode){prevTotal.parentNode.removeChild(prevTotal);}"
&"prevTotal=this.previousSibling;"
&"}'>"

