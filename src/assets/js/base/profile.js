$(document).ready(function() {
	// Follow system
	$('.follow-user').click(function() {
		var id = $(this).data("user");
		var follow = false;
		var followers = $('.follower-qty').text() == "" ? 0 : parseInt($('.follower-qty').text());

		if($(this).text() == "Seguir") {
			$(this).text("Seguindo");	
			$('.follower-qty').text(followers + 1);
			$('.follower-text').text($('.follower-qty').text() == "1" ? "seguidor" : "seguidores");
			follow = true;	
		}
		else {
			$(this).text("Seguir");
			follow = false;

			if(followers - 1 > 1) {
				$('.follower-text').text("seguidores");
				$('.follower-qty').text(followers - 1);
			}
			else if(followers - 1 == 1){
				$('.follower-text').text("seguidor");
				$('.follower-qty').text(followers - 1);
			}
			else {
				$('.follower-qty').text("");
				$('.follower-text').text("Nenhum seguidor ainda");
			}
		}

		$.ajax({
			url: follow ? '../../feed/seguir' : '../../feed/deixar-seguir',
			method: 'POST',
			dataType: 'json',
			data: { id: id }
		});
	})

	// Block system
	$('.more-options-box .dropdown-menu li a').click(function(e) {
		e.preventDefault();
		var el = $(this);
		var id = el.data("user");
		var block = el.text() == "Bloquear" ? true : false;

		$.ajax({
			url: block ? '../../feed/bloquear' : '../../feed/desbloquear',
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(json) {
				if(json.result) {
					block ? el.text("Desbloquear") : el.text("Bloquear");
				}
			}
		});
	});

	// Recommend system
	$('.recomendar-usuario').click(function(e) {
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
});