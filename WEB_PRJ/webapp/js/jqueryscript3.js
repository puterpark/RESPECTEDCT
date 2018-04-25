$(document).ready(function() {
	$().bind('cbox_open', function() {
		$('embed').css({visibility:'hidden'});
		$('object').css({visibility:'hidden'});
	}).bind('cbox_closed', function() {
		$('embed').css({visibility:'visible'});
		$('object').css({visibility:'visible'});
	});

	$(".idpassword").colorbox({width:"560", height:"260", iframe:true});
	$(".policy").colorbox({width:"560", height:"360", iframe:true});
	$(".clipboard").colorbox({width:"720", height:"560", iframe:true});
	$(".inbox").colorbox({width:"720", height:"100%", iframe:true});
	$(".profile").colorbox({width:"640", height:"660", iframe:true});
	$("#levelsystem").tooltip({ position:["bottom","center"], effect: 'slide', offset:[-30,12]});
	$("#tophits").tooltip({ position:["top","right"], effect: 'toggle', offset:[5,-15]});
	$("#close").click(function() {     $("#boardsearch").tooltip().hide();   });
	$("#music").tooltip({ position:["bottom","center"], effect: 'toggle', offset:[0,0]});
	$("#gallery").tooltip({ position:["bottom","center"], effect: 'toggle', offset:[0,0]});
	$("#forum").tooltip({ position:["bottom","center"], effect: 'toggle', offset:[0,0]});
	$("#boardsearch").tooltip({ position:["bottom","center"], effect: 'slide', offset:[-36,0], events:{def:"click,scroll",tooltip:"click,scroll"}});

	$(".oembed").oembed(null,{
		embedMethod: 'auto'    // "auto", "append", "fill"
	});

	$("ul.css-tabs").tabs("div.css-panes > div", {
		effect: 'default',
		onBeforeClick: function(event, i) {
			// get the pane to be opened
			var pane = this.getPanes().eq(i);
			// only load once. remove the if ( ... ){ } clause if you want the page to be loaded every time
			if (pane.is(":empty")) {
				pane.html('<img src="../2010/images/loading_ajax.gif" style="margin:4px 0;width:24px;height:24px;" />')
				// load it with a page specified in the tab's href attribute
				pane.load(this.getTabs().eq(i).attr("rel"));
			}
		}
	});

	var opensearch = $("#opensearch");

	if (undefined !== opensearch) {
		opensearch.click(function () {
			$("#forumsearch").slideToggle("fast");
		});
	}
});

document.onkeydown = function() {
	if(window.event) {
		if(window.event.keyCode == 116) { 
			window.event.keyCode = 505;
		} else if(window.event.keyCode == 505) {
			return false;
		}
	}
}

function disable(checkboxID, toggleID) {
  var checkbox = document.getElementById(checkboxID);
  var toggle = document.getElementById(toggleID);
  updateToggle = checkbox.checked ? toggle.disabled=true : toggle.disabled=true;
}

function enable(checkboxID, toggleID) {
  var checkbox = document.getElementById(checkboxID);
  var toggle = document.getElementById(toggleID);
  updateToggle = checkbox.checked ? toggle.disabled=false : toggle.disabled=false;
}
