$(document).ready(function() {
	// Follow system
	$('.likes-count').click(function() {
		console.log('modal abre..');
	})

	$('.unfollow-post').click(function(e){
		e.preventDefault();
		var id = $(this).data("user");
		
		$.ajax({
			url: './feed/deixar-seguir',
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(response) {
				if(response.result) location.reload();
			}
		});
	});

	$('.delete-post').click(function(e) {
		e.preventDefault();
		var post_id = $(this).data("post");
		
		$('[name="delete_post_id"]').val(post_id);
		$('#modalDeletePost').modal("show");
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

	// Post system
	try { var editor = new Jodit('#new-post'); }
	catch(err){}
	$('#formNewPost select').change(function() {
		var value = $(this).find(":selected").val();
		var text = $(this).find(":selected").text();

		console.log(value, value == 0);
		if(value == 0) {
			$('.post-box .post-privacy').removeClass('fa-lock').addClass('fa-globe');
		}
		else {
			$('.post-box .post-privacy').removeClass('fa-globe').addClass('fa-lock');	
		}
		$('.post-box .post-time').text(text);
	});

	$('#formNewPost').unbind('submit').bind('submit', function(e) {
		e.preventDefault();
		var form = $(this);

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.result) location.reload();
			}
		})
	});

	$('#formDeletePost').unbind('submit').bind('submit', function(e) {
		e.preventDefault();
		var form = $(this);

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.result) location.reload();
			}
		})
	})
});