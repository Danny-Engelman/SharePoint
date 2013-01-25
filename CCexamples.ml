="="""&REPT("X";B$1)&""""&REPT("&"""&REPT("X";B$1)&"""";$A2-1)

################################################################# DaysSince a given (Due)Date, negative values for days in the past
="<script type='text/javascript'>"
&"var SPday=new Date();"
&"SPday.setFullYear( "
&YEAR(DueDate)
&","
&MONTH(DueDate)-1
&","
&DAY(DueDate)
&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"document.write(days);"
&"</script>"

################################################################# DaysSince and highlight past Items
="<div id='ThisID"
&DueDate
&"'>"
&"<script type='text/javascript'>"
&"var TRnode=document.getElementById('ThisID"
&DueDate
&"').parentNode.parentNode.parentNode;"
&"var SPday=new Date();"
&"SPday.setFullYear( "&YEAR(DueDate)&","&MONTH(DueDate)-1&","&DAY(DueDate)&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"if(days>-4100){"
	&"TRnode.style.backgroundColor=(days<0)?'Pink':'HoneyDew';"
	&"document.write(days);"
&"}"
&"</script></div>"


############################################## Progress bar based on field 'Percent'
=”<DIV style=’background-color:LimeGreen;align:left;’>"
&"<DIV style=’color:white;background-color:red; width:”
&100-[Percent]*100
&”%;’>"
&[Percent]*100
&"%</DIV></DIV>”

############################################## Highlight TR without DIV Id reference
="<img src='/_layouts/images/blank.gif' onload='javascript:{"
&"TRnode=this.parentNode.parentNode.parentNode;"
&"var SPday=new Date();"
&"SPday.setFullYear( "&YEAR(DueDate)&","&MONTH(DueDate)-1&","&DAY(DueDate)&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"if(days>-4100){"
	&"TRnode.style.backgroundColor=(days<0)?""Pink"":""HoneyDew"";"
&"}"
&"}'>"
&DAY(DueDate)&"-"&MONTH(DueDate)&"-"&YEAR(DueDate)


############################################## Highlight TR without with Text output
="<span>Hello World!</span>"
&"<img src='/_layouts/images/blank.gif' onload='javascript:{"
&"TRnode=this.parentNode.parentNode.parentNode;"
&"var SPday=new Date();"
&"SPday.setFullYear( "&YEAR(DueDate)&","&MONTH(DueDate)-1&","&DAY(DueDate)&" );"
&"days=Math.round((SPday.getTime()-new Date().getTime())/86400000);"
&"if(days>-4100){"
	&"TRnode.style.backgroundColor=(days<0)?""Pink"":""HoneyDew"";"
&"}"
&"this.previousSibling.innerHTML=days+"" days since "";"
&"alert( TRnode.iid.split("","")[1] );"
&")"
&"}'>"
&DAY(DueDate)&"-"&MONTH(DueDate)&"-"&YEAR(DueDate)


############################################## Gradient first try

="<span style='display:inline-block;position:relative;width:60px;border:1px solid;'>"
&"<script>var P=21;var gnode=null;</script>"
&"<span id='gradientspan' style='display:inline-block;float:left;height:14px;color:white;background-color:LimeGreen;'>Hello</span>"
&"<img src='/_layouts/images/blank.gif' onload='javascript:{"
&"console.log(P);"
&"P="&Percent*100&";"
&"r=Math.min(510-P*255*2,255);"
&"g=Math.min(P*255*2,255);"
&"b=0;"
&"var C=""#"" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);"
&"gnode=this.previousSibling;"
&"gnode.style.width=P+""%"";"
&"gnode.innerHTML=P+""%"";"
&"}'>"
&"</span>"
&"<script>console.log(P);console.log(gnode);gnode.style.backgroundColor='#F01326';</script>"

&"this.previousSibling.style.backgroundColor=""\"""+C+""\""";"
&"this.previousSibling.style.backgroundColor=\x22#F01326\x22;"


&"var P="&[Percent]&";"
&"this.previousSibling.style.backgroundColor=rgb(Math.min(510-P*255*2,255),Math.min(P*255*2,255),0);"

&"this.parentNode.style.style.width=P;"
&"this.previousSibling.innerHTML=P;"




############################################## Edit ECB first try
="<script>"
&"function Custom_AddListMenuItems(m, ctx){"
&"CAMOpt(m,'Hello World!','','/_layouts/images/LIST.GIF');"
&"return false;}</script>"
