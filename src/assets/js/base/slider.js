$(document).ready(function() {
	$(".slider").slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		infinite: true,
		dots: false,
		arrows: false,
		autoplay: true,
		autoplayspeed: 2000,
		responsive: [
	    {
	      breakpoint: 991,
	      settings: {
	        slidesToShow: 2,
	        slidesToScroll: 1,
	      }
	    },
	    {
	      breakpoint: 767,
	      settings: {
	        slidesToShow: 1,
	        slidesToScroll: 1
	      }
	    }
	   ]
	});

	$('#conteudos').on('click', '.slick-custom-arrows span:nth-child(1)', function() {
		$('.slider').slick('slickPrev');	
	});

	$('#conteudos').on('click', '.slick-custom-arrows span:nth-child(2)', function() {
		$('.slider').slick('slickNext');	
	});
});