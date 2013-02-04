############################################## Execute JS read from Column in current list named "Script"
="<!--ICC code Paste in SharePoint Calculated Column, SET DATATYPE TO NUMBER!! -->"
&"<button onclick='javascript:{"
&"  var clientContext, listId, itemId, listName, list, item, touchDate, newDate;"
&"  TRnode=this.parentNode.parentNode.parentNode;"
&"	clientContext=new SP.ClientContext.get_current();"
&"	list=clientContext.get_web().get_lists().getById(SP.ListOperation.Selection.getSelectedList());"
&"	item=list.getItemById(TRnode.iid.split("","")[1]);"
&"	clientContext.load(item);"
&"	clientContext.executeQueryAsync(function(){"
&"		var MyScript=item.get_item(""Script"");"
&"		eval(MyScript);"
&"})}'>Exec</button>"


############################################## Inline Change item Create Date
="<!--ICC code Paste in SharePoint Calculated Column, SET DATATYPE TO NUMBER!! -->"
&"<input size=10 type='text' value='"&MONTH([Created])&"/"&DAY([Created])&"/"&YEAR([Created])&"'/>"
&"<button onclick='javascript:{"
&"  var clientContext,listId,itemid,listName,list,item,touchDate,newDate;"
&"  TRnode=this.parentNode.parentNode.parentNode;"
&"  touchDate=this.previousSibling;"
&"	if(touchDate.nextSibling.innerHTML==""Reload""){window.location.reload()};"
&"	clientContext=new SP.ClientContext.get_current();"
&"	list=clientContext.get_web().get_lists().getById(SP.ListOperation.Selection.getSelectedList());"
&"	itemid=TRnode.iid.split("","")[1];"
&"	item=list.getItemById(itemid);"
&"	clientContext.load(item);"
&"	clientContext.executeQueryAsync(function(){"
&"		var created=item.get_item(""Created"");"
&"		console.log(created);"
&"		newDate=touchDate.value.split(""/"");"
&"		created.setMonth(newDate[0]-1);"
&"		created.setDate(newDate[1]);"
&"		created.setFullYear(newDate[2]);"
&"		item.set_item(""Created"",created);"
&"		item.update();"
&"		clientContext.load(item);"
&"		clientContext.executeQueryAsync("
&"			(function(){touchDate.style.backgroundColor=""LimeGreen"";touchDate.nextSibling.innerHTML=""Reload""}) ,"
&"			(function(){alert(""failed ICC function\nitemid:""+itemid+""\ncreated:""+created)})"
&"		)"
&"})}'>Touch</button>"

############################################## Gradient first STILL WORKING ON IT
############################################## Gradient
=""
&"<script>function ICCsetgradient(me,P){"
&"  r=Math.min(510-P*255*2,255);"
&"  g=Math.min(P*255*2,255);"
&"  b=0;"
&"  var C=""#"" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);"
&"	C='""#123456""';"
&"  me.previousSibling.style.backgroundColor=C;}"
&"</script>"
&"<span style='display:inline-block;position:relative;width:60px;border:1px solid;'>"
&"<span style='display:inline-block;float:left;height:14px;color:white;background-color:LimeGreen;'>X</span>"
&"<img src='/_layouts/images/blank.gif' onload='javascript:{"
&"  var P="&[% Complete]*100&";"
&"  var gnode=this.previousSibling;"
&"  ICCsetgradient(this,P);"
&"  gnode.style.width=P;"
&"  gnode.innerHTML=P;"
&"}'>"
&"</span>"


&"<script>function ICCsetgradient(me,C){me.previousSibling.style.backgroundColor=""'""+C+""'""}</script>"
&"<script>function ICCsetgradient(me,r,g,b){me.style.backgroundColor=""'rgb(""+r+"",""+g+"",""+b+"")'""}</script>"


="<span style='display:inline-block;position:relative;align:left; width:60px; height:14px;border:1px solid;'>"
&"<span style='display:inline-block;position:relative;background-color:rgb("
&INT(MIN(510-[% Complete]*255*2,255))&","&INT(MIN([% Complete]*255*2,255))&",0); width:"&([% Complete]*100)
&"%;height:14px;'>"
&"<span style='position:absolute; top:0px;'> "
&TEXT([% Complete],"0%")
&"</span></span></span>"



############################################## Edit ECB first try UNSUCCESFULL
="<script>"
&"function Custom_AddListMenuItems(m, ctx){"
&"CAMOpt(m,'Hello World!','','/_layouts/images/LIST.GIF');"
&"return false;}</script>"


