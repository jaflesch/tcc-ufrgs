$(document).ready(function() {
	$('body').on("click", ".favorite-job", function(e) {
		var el = $(this);
		var id = $(this).closest("article").data("job");
		var path = $(this).attr("data-path");
		var action = el.hasClass('active') ? '/desfavoritar' :  '/favoritar';

		e.preventDefault();

		$.ajax({
			url: (path + action),
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(json) {
				// Reset
				el.closest(".job-card").children(".alert").hide();
				el.blur();

				if(json.success) {
					el.closest(".job-card").children(".alert-info").children(".response-message").html(json.msg);
					el.closest(".job-card").children(".alert-info").show();
					el.toggleClass('active');
					el.attr("title", "Desfavoritar vaga");
				}
				else {
					el.closest(".job-card").children(".alert-warning").children(".response-message").html(json.msg);
					el.closest(".job-card").children(".alert-warning").show();
				}
			}
		})
	});

	$('.job-card').on("click", ".close", function() {
		$(this).parent().hide();
	})
});