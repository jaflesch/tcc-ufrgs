$(document).ready(function() {
	$(".btn-follow").click(function(e) {
		var el = $(this);
		var id = $(this).data("id");
		
		if(el.hasClass('following')) {
			el.text('Seguir');
			el.removeClass('following');
		}
		else {
			el.text('Seguindo');
			el.addClass('following');	
		}

		$.ajax({
			url: !el.hasClass('following') ? './feed/deixar-seguir' : './feed/seguir',
			method: 'POST',
			dataType: 'json',
			data: { id: id }
		});
	});
});