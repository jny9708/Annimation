$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip({
		// container: "body",
		delay: { "show": 0, "hide": 20 }
    });
    
	$('.tooltip-right').tooltip({
		placement: 'right',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: 'body', padding: 2}
	});
	$('.tooltip-viewport-right').tooltip({
		placement: 'right',
		viewport: {selector: '.container-viewport', padding: 2}
	});
	$('.tooltip-viewport-bottom').tooltip({
		placement: 'bottom',
		viewport: {selector: '.container-viewport', padding: 2}
	});
	 });
	 


$(document).ready(function () { /*상세검색 지역! */
$("#check_finish").click(function () { 
status = $("#hidden").css("display"); 
if (status == "none") { 
  $("#hidden").css("display", ""); 
} else { 
  $("#hidden").css("display", "none"); 
} 
}); 
}); 
	
