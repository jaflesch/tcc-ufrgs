$(document).ready(function() {
	$('.recomendar-vaga').click(function(e) {
		e.preventDefault();
		$('.recommend-box').slideDown();
		$('.recommend-box textarea').scrollThere(-$('nav').outerHeight() )
	});

	$('#formRecomendar').unbind('submit').bind('submit', function(e) {
		e.preventDefault();
		var form = $(this);

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				if(json.result) location.reload();	
			}
		})
	})

	// Recommend & Interest
	$('.apply.cta, .apply-job-link').click(function(e) {
		e.preventDefault();
		
		var el = $(this);		
		el.removeClass('apply').addClass('applied').html("<span class='fa fa-check-circle'></span> Candidatado!");

		$.ajax({
			url: el.attr("href"),
			method: 'POST',
			dataType: 'json',
			data: { id : el.data("job") }
		})
	})

	// Favorite
	$(".favorite-job").click(function(e) {
		var el = $(this);
		var id = $('#job-info').data("job");
		var bookmark = el.parent().parent().siblings('.favorite-bookmark');

		if(el.text() == 'Favoritar') {
			el.text("Desfavoritar");
			el.attr("title", "Desfavoritar vaga");
		}
		else {
			el.text("Favoritar");
			el.attr("title", "Favoritar vaga");
		}

		$.ajax({
			url: bookmark.hasClass('active') ? '../../../vagas/desfavoritar' : '../../../vagas/favoritar',
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(json) {
				// Reset
				el.closest(".job-card").children(".alert").hide();
				el.blur();

				if(json.success) {
					$('#feedback-context').children(".alert-info").children(".response-message").html(json.msg);
					$('#feedback-context').children(".alert-info").show();
					bookmark.toggleClass('active');					
				}
				else {
					$('#feedback-context').children(".alert-warning").children(".response-message").html(json.msg);
					$('#feedback-context').children(".alert-warning").show();
				}
			}
		})
	});

	$('#feedback-context').on("click", ".close", function() {
		$(this).parent().hide();
	})
});