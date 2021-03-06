$(document).ready(function() {
	// Close warnings
	$('.close-warning').click(function(e) {
		e.preventDefault();
		$(this).parent().remove();
	});

	// Follow system
	$('.current-status .likes-count').click(function()  {
		var modal = $('#modalLikeQtd');
		var id = $(this).closest('article').data("post");
		
		$.ajax({
			url: modal.attr("data-action"),
			method: 'POST',
			dataType: 'json',
			data: { id_post: id },
			success: function(json) {
				var post_like = json.data;

				// Reset
				$('#modalLikeQtd .user-list').html("");

				// Fill
				var likes = post_like.length > 0 ? post_like.length : "Nenhum";
				var likes_text = post_like.length > 1 ? "usuários curtiram" : "usuário curtiu"; 
				$('#total-likes').text(likes);
				$('#total-likes-text').text(likes_text);

				for(var i = 0; i < post_like.length; i++) {
					if(post_like[i].avatar != "") {
						$('#modalLikeQtd .user-list').append(`
							<li>
								<a class='avatar' href='feed/usuarios/${post_like[i].login}' title='Ver perfil de ${post_like[i].name}'>
									<div style="background-image:url('public/avatar/${post_like[i].id}/${post_like[i].avatar}')"></div>
								</a>
								<a class='text' href='feed/usuarios/${post_like[i].login}' title='Ver perfil de ${post_like[i].name}'> 
									${post_like[i].name}
								</a>
							</li>
						`);						
					}
					else {
						if(post_like[i].gender == 0) {
							$('#modalLikeQtd .user-list').append(`
								<li>
									<a class='avatar' href='feed/usuarios/${post_like[i].login}' title='Ver perfil de ${post_like[i].name}'>
										<img src="assets/img/profile/default-male-profile-avatar.png" alt="Foto de ${post_like[i].name}" title="Foto de ${post_like[i].name}" class="profile-default-avatar">
									</a>
									<a class='text' href='feed/usuarios/${post_like[i].login}' title='Ver perfil de ${post_like[i].name}'> 
										${post_like[i].name}
									</a>
								</li>
							`);	
						}
						else {
							$('#modalLikeQtd .user-list').append(`
								<li>
									<a class='avatar' href='feed/usuarios/${post_like[i].login}' title='Ver perfil de ${post_like[i].name}'>
										<img src="assets/img/profile/default-female-profile-avatar.png" alt="Foto de ${post_like[i].name}" title="Foto de ${post_like[i].name}" class="profile-default-avatar">
									</a>
									<a class='text' href='feed/usuarios/${post_like[i].login}' title='Ver perfil de ${post_like[i].name}'> 
										${post_like[i].name}
									</a>
								</li>
							`);	
						}
					}
				}
				modal.modal("show");
			}
		})
	});

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

	$('.update-post').click(function(e) {
		e.preventDefault();
		var post_id = $(this).data("post");
		var text = $(`article.post[data-post="${post_id}"] .post-body`).html();
		
		$('#updatePost .jodit_wysiwyg').html(text);
		$('#updatePost .jodit_placeholder').hide();
		$('#updatePost [name="post_id"]').val(post_id);
		$('#modalUpdatePost').modal("show");
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
	try { 
		var editor = new Jodit('#new-post'); 
	 	var editor2 = new Jodit('#update-post'); 
	}
	catch(err){}
	$('#formNewPost select').change(function() {
		var value = $(this).find(":selected").val();
		var text = $(this).find(":selected").text();

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

	$('#updatePost').unbind('submit').bind('submit', function(e) {
		e.preventDefault();
		var form = $(this);

		$('#updatePost .modal-footer button').text("Atualizando...");
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

		$('#updatePost button').text("Excluindo...");
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


	// Comment system
	$('.comments').click(function() {
		var el = $(this);

		el.siblings('.comment-area').show();
		el.parent().children('.post-list').show();
	});
	$('.comments-count .text').click(function() {
		var el = $(this);

		el.parent().parent().siblings('.post-options').children('.post-list').show();
		el.parent().parent().siblings('.post-options').children('.comment-area').show();
	});

	$('.delete-comment').click(function(e) {
		e.preventDefault();
		var post_id = $(this).data("post");
		
		$('[name="delete_comment_id"]').val(post_id);
		$('#modalDeleteComment').modal("show");
	});

	$('#formDeleteComment').unbind('submit').bind('submit', function(e) {
		e.preventDefault();
		var form = $(this);

		var target = form.children('input[type="hidden"]').val();
		var li_el = $(`.post-list li .options .dropdown-menu li [data-post="${target}"]`).parent().parent().parent().parent();
		var $post_counter_element = li_el.parent().parent().siblings('.current-status').children('.comments-count');
		console.log(li_el, $post_counter_element);
		li_el.remove();

		$('#modalDeleteComment').modal("hide");					

		var post_count = parseInt($post_counter_element.children('.count').text()) - 1;

		if(post_count == 1 ) {
			$post_counter_element.children(".text").text("comentário");
		}
		else {
			$post_counter_element.children(".text").text("comentários");	
		}
		
		// No likes, then hide div
		if(post_count == 0) {
			$post_counter_element.siblings(".separator").hide();
			$post_counter_element.hide();
		}

		$post_counter_element.children('.count').text(post_count);

		return true;
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.result) return true;
			}
		})
	})

	$('.form-comment').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		var id = form.closest('article.post').attr("data-post");
		var text = form.children('input').val();

		form.children('input').val('Postando...');

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: {
				id: id, 
				text: text
			},
			success: function(response) {
				location.reload();
			}
		})
	})

	// New post link click focus
	$("a[href='#new-post-anchor']").click(function(e) {
		e.preventDefault();
		$('.jodit_wysiwyg').val("").focus();
	});

	$('#formAddress').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);

		$('#formAddress button[type="submit"]').text("Atualizando...");
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				if(json.success) {
					location.reload();
				}
			},
			error: function() {
				$('#formAddress button[type="submit"]').text("Atualizar");
			}
		});
	});
});