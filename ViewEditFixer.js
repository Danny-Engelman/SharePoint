// Edit View Fixer 0.3
// In an opened Edit View pages fixes several settings
// encapsulate in javascript:{code} to use it as a Bookmarklet on the Favorites Toolbar
// or paste this in the multi-line F12-Developer Tools Script window

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

function SwitchSection( sectionName , imgName ){
	secid=document.getElementById( 'tbody'+sectionName );
	ShowHideGroup(secid,document.getElementById('img'+imgName));
	ShowHideGroupLimit( secid );
}
//while we're here open and close some sections
//SwitchSection('ViewColums','ViewColumns');
//SwitchSection('ViewSort','ViewSort');
//SwitchSection('ViewFilter','ViewFilter');
//SwitchSection('ViewInlineEdit','ViewInlineEdit');
//SwitchSection('ViewTabularView','ViewTabularView');
SwitchSection( 'ViewGroup' , 'ViewGroup' );
//SwitchSection('ViewTotals','ViewTotals');
//SwitchSection('ViewStyle','ViewStyle');
//SwitchSection('Folders','Folders');
SwitchSection( 'ViewLimit' , 'ViewLimit' );
SwitchSection('ViewMobile','ViewMobile');


//Reset ItemLimit

var RowLimit=document.getElementById('idRowLimit');
if (RowLimit.value=='30'){
	RowLimit.value=defaultRowLimit;
}

//Report we're done
var viewnameTR=document.getElementById('ViewName').parentNode.parentNode;
viewnameTR.style.backgroundColor='red';
viewnameTR.style.color='white';
node=document.createElement("td");
node.appendChild(document.createTextNode("ViewEdit Fixed"));
viewnameTR.appendChild( node );

//try to scoll down
//groupBy.scrollIntoView();
