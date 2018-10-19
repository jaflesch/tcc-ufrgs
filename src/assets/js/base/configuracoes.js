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

	$('.btn-unblock').click(function(e) {
		e.preventDefault();
		var el = $(this);
		var form = $('#formBanList');
		var id = el.parent().data("user");

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(response) {
				if(response.success) {
					if(el.parent().parent().children().length == 1) {
						el.parent().remove();
						form.append(`<p>Sua lista de usuários bloqueados está vazia.</p>`);
					}
					else {
						el.parent().remove();
					}
				}
			}
		})
	})
});