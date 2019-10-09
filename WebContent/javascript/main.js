$(document).ready(function() {
	$("article .carousel").carousel({
	  interval: 5000
	});

	$(".main_intro .carousel").carousel({
		interval: 10000
	  });

	$('#InCarousel').on('slide.bs.carousel', function() {
  
  
	  $(".InCarousel-target.active").removeClass("active");
  
	  $('#InCarousel').on('slid.bs.carousel', function() {
  
		var to_slide = $(".carousel-item.active").attr("data-slide-no");
  
		$(".nav-indicators li[data-slide-to=" + to_slide + "]").addClass("active");
  
	  });
	});
  

  });