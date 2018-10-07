$(document).ready(function() {
	// Filter toggle
	$('#formConfig').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				alert(response.message);
			}
		})
	});
});