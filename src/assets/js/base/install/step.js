$(document).ready(function() {
	$('#step-1 .btn,#error-db .btn').click(function(e) {
		var target = $(this).data('target');
		
		e.preventDefault();		
		$('.box-step').hide();
		$(target).show();
	});
});