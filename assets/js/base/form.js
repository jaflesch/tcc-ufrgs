$(document).ready(function() {
	$('.mask-phone').mask('(00) 00000-0000');
	
	$('#formContato').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				alert(json.msg);
				if(json.success) {
					$('#formContato input[type="text"], #formContato input[type="email"], #formContato textarea').val("");
				}
			}
		})

	});
});