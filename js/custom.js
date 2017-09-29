/*$(document).keydown(function(event){
    if(event.keyCode==123){
        return false;
    }
    else if (event.ctrlKey && event.shiftKey && event.keyCode==73){        
             return false;
    }
});

$(document).on("contextmenu",function(e){        
   e.preventDefault();
});*/

function toggleChecked(status) {
	if (status == true) {
		$(".checkbox").each(function() {
			$(this).prop('checked', true);
		});
	} else {
		$(".checkbox").each(function() {
			$(this).prop("checked", false);
		});
	}
}

$(window).load(function() {
	$(".item").css("display", "block !important");
});

/*window.addEventListener("beforeunload", function (event) {
	  event.returnValue = "\o/";
	  if(event.returnValue){
		  document.cookie = "RAJEWALIA";
	  }
	});
	window.addEventListener("beforeunload", function (event) {
	  event.preventDefault();
	});*/