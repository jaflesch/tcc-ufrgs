$(document).ready(function() {
	$('#submit').click(function(e) {
		e.preventDefault();
		var form = $("#formEdit");
		$(this).prop("disabled", true);
		
		$.ajax({
			url: form.attr('action'),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				alert(json.msg);
				if(json.success) {
					document.location = "../";
				}
				else $(this).prop("disabled", false);
			}
		});
	});

	$('#delete').click(function(e) {
		e.preventDefault();			
		var form = $("#formDelete");
		$(this).prop("disabled", true);
		
		$.ajax({
			url: form.attr('action'),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				alert(json.msg);
				if(json.success) {
					document.location = "../";
				}
				else $(this).prop("disabled", false);
			}
		});
	});
});