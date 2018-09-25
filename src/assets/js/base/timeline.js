$(document).ready(function() {
	// Follow system
	$('.likes-count').click(function() {
		console.log('modal abre..');
	})

	// Like system
	$('.post-options .likes').click(function() {
		var el = $(this);
		var has_liked = el.hasClass('user-liked');
		var id = el.closest('article').data('post');
		
		if(has_liked) {
			// Unlike
			el.removeClass('user-liked');
			el.children('.like-text').text('Curtir');

			var $like_counter_element = el.parent().siblings('.current-status').children('.likes-count');
			var like_count = parseInt($like_counter_element.children('.count').text()) - 1;

			if(like_count == 1 ) {
				$like_counter_element.children(".text").text("curtida");
			}
			else {
				$like_counter_element.children(".text").text("curtidas");	
			}

			// No likes, then hide div
			if(like_count == 0) {
				$like_counter_element.siblings(".separator").hide();
				$like_counter_element.hide();
			}

			$like_counter_element.children('.count').text(like_count);
		}
		else {
			// Like
			el.addClass('user-liked');
			el.children('.like-text').text('Curtido por você');

			var $like_counter_element = el.parent().siblings('.current-status').children('.likes-count');
			var like_count = parseInt($like_counter_element.children('.count').text()) + 1;

			if(like_count == 1 ) {
				$like_counter_element.children(".text").text("curtida");
			}
			else {
				$like_counter_element.children(".text").text("curtidas");	
			}

			if(like_count == 1) {
				$like_counter_element.siblings(".separator").show();
				$like_counter_element.show();
			}

			$like_counter_element.children('.count').text(like_count);
		}

		$.ajax({
			url: has_liked ? './home/unlike' : './home/like',
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
});