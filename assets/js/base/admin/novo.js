$(document).ready(function() {
	$('#formCreate').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		$('button.btn-primary').prop("disabled", true);
		
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				alert(json.msg);
				if(json.success) {
					document.location = json.location;
				}
				else $('button.btn-primary').prop("disabled", false);
			}
		})
	});
});