$(document).ready(function() {
	$('.page_index').click(function() {
		var page = $(this).text();
		$('table tr[data-page]').hide();
		$('table tr[data-page="'+ page +'"]').show();

		$(this).siblings().removeClass('active');
		$(this).addClass('active');

		$('html, body').animate({scrollTop: 0}, '500');
	});

	$('.page_index_div').click(function() {
		var page = $(this).text();
		$('div[data-page]').hide();
		$('div[data-page="'+ page +'"]').show();

		$(this).siblings().removeClass('active');
		$(this).addClass('active');

		$('html, body').animate({scrollTop: 0}, '500');
	});
});