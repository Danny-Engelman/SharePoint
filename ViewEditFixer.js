//Edit View Fixer 0.1
//In an opened Edit View pages fixes several settings

var defaultRowLimit='100';
var defaultCollapseGroups=1;//1=collapsed,0=expanded
var gct='tp_ContentType';//do not change SP value
function addGroupedCT( n ){
	var select = document.getElementById("idGroupField"+n);
	select.options[select.options.length] = new Option(gct, gct);
}
addGroupedCT(1);//add the option to first grouping
addGroupedCT(2);//add the option to second grouping

//now check if the filename indicates grouping by contenttype: _ctgX
var f=document.getElementById('onetidIOViewName').value;
if(f.indexOf('_gct')!==-1){
	X=f.charAt(f.indexOf('_gct')+4);
	var select = document.getElementById("idGroupField"+X);
	for (var i = 0; i < select.options.length; i++) {
	    if (select.options[i].text === gct) {
	        select.selectedIndex = i;
	        break;
	    }
	}
}

function OpenSection( sectionName , imgName ){
	secid=document.getElementById( sectionName );
	ShowHideGroup(secid,document.getElementById(imgName));
	ShowHideGroupLimit( secid );
}
//while we're here open the GroupBy section
OpenSection( 'tbodyViewGroup' , 'imgViewGroup' );
OpenSection( 'tbodyViewLimit' , 'imgViewLimit' );
//CollapseGroups

//Reset ItemLimit

var RowLimit=document.getElementById('idRowLimit');
if (RowLimit.value=='30'){
	RowLimit.value=defaultRowLimit;
}

//try to scoll down
//groupBy.scrollIntoView(); 