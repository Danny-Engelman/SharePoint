//v 0.9 - used on Dutch SharePoint environment, not tested on US/english environments
//Replace a wikipedia like reference [INDEX] on the page with a Table of Contents of all H1 and H2 in the page

// Requires: JQuery 1.7.1 (minimum)

// Script will:
//				add HTML anchors to all H1 and H2 tags
//				replace anny [INDEX] text in the page with a clickable Table of Contents
 
if (jQuery.fn.jquery=="1.7.1"){ //make sure we got a JQuery version that works
	$(function(){ //execute after page load
	   AutoIndexH1H2( '[index]' );
	   AutoIndexH1H2( '[INDEX]' );
	});
}
 
function getIDbyContents( str , idmatch ){
	var idfound=false;
	$('DIV:contains('+str+')').each(function(){
		if((this.id).indexOf( idmatch )!=-1){
			idfound=this.id;
			return false; //break each loop
		}
	});
	return (idfound);
}
 
function AutoIndexH1H2( IndexTag ){
	// Scan the Publishing Page Content for H1 (and H2) references
	// and create an Index at the top (and bottom) of the DIV with A NAME Bookmark tags
	var trace=0;
	 
	if (document.location.toString().indexOf('Pag')!=0){ //Only execute on pages
		var DIVid=getIDbyContents( IndexTag , 'PlaceHolderMain' ); //find the DIV id with the IndexTag
		if (DIVid!=-1){
		if(trace) console.log( "Found "+IndexTag+" in:"+DIVid);
		if (DIVid && !g_disableCheckoutInEditMode ){ //not in EditMode
		   if(trace) console.log( "Replacing "+IndexTag+" with Index!");
		   var HTop=1; //display a ^ above every chaptertitle to return to Index
		   var Levels=2; //2 to include H2 references
		   if(trace) console.log( "Found "+IndexTag+" in:"+DIVid);
		   var HIndex="<DIV class='E2SPI'><A NAME='IND0'></A><b>Table of Contents</b><UL>";
		   HTop=(HTop)?"<a HREF='#IND0'><H1>^</H1></A>":"";
		   var N=1;
		   $("#"+DIVid+" H1,H2").each(function(){ //execute on all H1 and H2 references
			   var Hclass=$(this).attr("class"); // are we working on an ms-rte class?
			   var HTitle=$(this).html();
			   if(trace) console.log( "Processing: "+HTitle+" :"+N);
			   if (Hclass){
				   if ( (HTitle).indexOf(IndexTag)==-1){ // disregard the Indextag itself
					  var INname="IND"+(N++); //label for the A NAME reference, sneaky add+1 to N
					  $(this).before( "<DIV class='E2SPI'><A NAME='"+INname+"'>"+HTop+"</A></DIV>" ); //add Anchor before H1/H2 tag
					  HTitle= HTitle.replace(/<(?:.|\n)*?>/gm, ''); //strip all HTML tags from HTitle
					  var HtmlLevel="<LI><A HREF='#"+INname+"'>"+HTitle+"</A></IL>"; //Built the Index title
					  if (Hclass=="ms-rteElement-H2") HtmlLevel=(Levels==2)?"<UL>"+HtmlLevel+"</UL>":""; //indent H2 references only when Levels=2
					  HIndex+="<DIV class='E2SPI'>"+HtmlLevel+"</DIV>";
					  }
				   }
		   })
		   HIndex+='</UL></DIV>';
		   var H=$("#"+DIVid).html(); //Get the HTML again because we just changed it!
		   var NewHtml=H.replace(IndexTag,HIndex)+"<BR><BR><BR>"+HIndex;//change H HTML and include Index at the bottom
		   $("#"+DIVid).html(NewHtml); //replace the HTML in the DIV
		}
		}
	}
}