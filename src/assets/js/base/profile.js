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

	$('#see-followers').click(function() {
		if(parseInt($('.follower-qty').text()) > 0) {
			$('#modalShowFollowers').modal("show");
		}
	});

	// Update JOB information
	$('#job-experiences .btn-new').click(function() {
		$('#job-experiences-form').slideDown();
	});
	$('#job-experiences .hide-form').click(function(e) {
		e.preventDefault();
		$('#job-experiences-form').slideUp();
	});
	$('#job-experiences').on("click", '.remove-item', function() {
		var el = $(this);
		var id = el.parent().parent().attr("data-id-job");

		$.ajax({
			url: '../../configuracoes/remover-experiencia',
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(response) {
				if(response.success) el.parent().parent().remove();			
			}
		});		
	});	
	$('#job-experiences form').on("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		
		var company = $('#job-experiences [name="company"]').val();
		var title = $('#job-experiences [name="title"]').val();
		var data_inicio = $('#job-experiences [name="date_start"]').val().split("/")[2];
		var data_fim = $('#job-experiences [name="date_finish"]').val();
		var location_city = $('#job-experiences [name="location_city"]').val();
		var location_state = $('#job-experiences [name="location_state"]').find(":selected").val();
		var textarea = $('#job-experiences [name="resume"]').val();
		data_fim = (data_fim == "") ? "o momento" : data_fim = data_fim.split('/')[2];
		
		var element = `
			<li>
				<div class="avatar">
					<span class="fa fa-briefcase"></span>
				</div>
				<div class="text">
					<h3>${company}</h3>
					<h4>
						${title } <span class="separator">·</span> 
						De ${data_inicio} até ${data_fim} <span class="separator">·</span> 
						${location_city}, ${location_state}
					</h4>
					<div class="remove-item">&times;</div>
				</div>
			</li>`;

		$('#job-experiences ul').append(element);

		// AJAX call
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.success) form[0].reset();				
			}
		});
	});

	// Update EDUCATION information
	$('#education-experiences .btn-new').click(function() {
		$('#education-experiences-form').slideDown();
	});
	$('#education-experiences .hide-form').click(function(e) {
		e.preventDefault();
		$('#education-experiences-form').slideUp();
	});
	$('#education-experiences').on("click", '.remove-item', function() {
		var el = $(this);
		var id = el.parent().parent().attr("data-id-education");

		$.ajax({
			url: '../../configuracoes/remover-educacao',
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(response) {
				if(response.success) el.parent().parent().remove();			
			}
		});		
	});	
	$('#education-experiences form').on("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		
		var title = $('#education-experiences [name="title"]').val();
		var subtitle = $('#education-experiences [name="subtitle"]').val();
		var data_inicio = $('#education-experiences [name="date_start"]').val().split("/")[2];
		var data_fim = $('#education-experiences [name="date_finish"]').val();
		var location_city = $('#education-experiences [name="location_city"]').val();
		var location_state = $('#education-experiences [name="location_state"]').find(":selected").val();
		var textarea = $('#education-experiences [name="resume"]').val();
		data_fim = (data_fim == "") ? "o momento" : data_fim = data_fim.split('/')[2];
		
		var element = `
			<li>
				<div class="avatar">
					<span class="fa fa-graduation-cap"></span>
				</div>
				<div class="text">
					<h3>${subtitle}</h3>
					<h4>
						${title } <span class="separator">·</span> 
						De ${data_inicio} até ${data_fim} <span class="separator">·</span> 
						${location_city}, ${location_state}
					</h4>
					<div class="remove-item">&times;</div>
				</div>
			</li>`;

		$('#education-experiences ul').append(element);

		// AJAX call
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.success) form[0].reset();				
			}
		});
	});

	// Update SKILL information
	$('#skills .btn-new').click(function() {
		$('#skills-form').slideDown();
	});
	$('#skills .hide-form').click(function(e) {
		e.preventDefault();
		$('#skills-form').slideUp();
	});
	$('#skills').on("click", '.remove-item', function() {
		var el = $(this);
		var id = el.parent().attr("data-id-skill");
		console.log(id);
		$.ajax({
			url: '../../configuracoes/remover-habilidade',
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(response) {
				if(response.success) el.parent().remove();			
			}
		});		
	});	
	$('#skills form').on("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		
		var title = $('#skills-form [name="title"]').val();
		var level = $('#skills-form [name="level"]').find(":selected").text();
		var time = $('#skills-form [name="time"]').val();
		
		// AJAX call
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.success) {
					form[0].reset();	
					var element = `
						<li data-id-skill="${response.last_id}">
							<div class="skill-title">
								<h3>${title}</h3>
							</div>
							<div class="text">
								<h4>${level} <span class="separator">·</span> ${time} anos</h4>
							</div>
							<div class="remove-item">&times;</div>
						</li>`;

					$('#skills ul').append(element);
				}
			}
		});
	});
});