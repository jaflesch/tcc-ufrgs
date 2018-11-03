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
				if($('#job-experiences ul').children().length == 0) $('#job-experiences .no-info').show();	
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
		
		// AJAX call
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.success) form[0].reset();				

				var element = `
					<li data-id-job="${response.last_id}">
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

				if($('#job-experiences ul').children().length == 0) $('#job-experiences .no-info').hide();
				
				$('#job-experiences ul').append(element);
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
				if($('#education-experiences ul').children().length == 0) $('#education-experiences .no-info').show();	
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
		
		// AJAX call
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.success) form[0].reset();		

				var element = `
					<li data-id-education="${response.last_id}">
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

				if($('#education-experiences ul').children().length == 0) $('#education-experiences .no-info').hide();
				
				$('#education-experiences ul').append(element);		
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
				if($('#skills ul').children().length == 0) $('#skills .no-info').show();		
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
					time = (time == 0) ? "Menos de 1 ano" : time + " anos";

					var element = `
						<li data-id-skill="${response.last_id}">
							<div class="skill-title">
								<h3>${title}</h3>
							</div>
							<div class="text">
								<h4>${level} <span class="separator">·</span> ${time}</h4>
							</div>
							<div class="remove-item">&times;</div>
						</li>`;

					if($('#skills ul').children().length == 0) $('#skills .no-info').hide();
					$('#skills ul').append(element);
				}
			}
		});
	});

	// Update LANGUAGE information
	$('#languages .btn-new').click(function() {
		$('#languages-form').slideDown();
	});
	$('#languages .hide-form').click(function(e) {
		e.preventDefault();
		$('#languages-form').slideUp();
	});
	$('#languages').on("click", '.remove-item', function() {
		var el = $(this);
		var id = el.parent().attr("data-id-language");
		console.log(id);
		$.ajax({
			url: '../../configuracoes/remover-idioma',
			method: 'POST',
			dataType: 'json',
			data: { id: id },
			success: function(response) {
				if(response.success) el.parent().remove();			
				if($('#languages ul').children().length == 0) $('#languages .no-info').show();
			}
		});		
	});	
	$('#languages form').on("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		
		var title = $('#languages-form [name="title"]').find(":selected").text();
		var level = $('#languages-form [name="level"]').find(":selected").text();

		var flag = "";
		switch(title) {
			case 'Português':
				flag = 'Brazil';
				break;
			case 'Inglês': 
				flag = 'United-States';
				break;
			case 'Francês':
				flag = 'France';
				break;
			case 'Alemão': 
				flag = 'Germany';
				break;
			case 'Espanhol':
				flag = 'Spain';
				break;
			case 'Japonês':
				flag = 'Japan';
				break;
			case 'Chinês': 
				flag = 'China';
				break;
			case 'Russo': 
				flag = 'Russia';
				break;
			case 'Coreano':
				flag = 'South-Korea';
				break;
			case 'Turco': 
				flag = 'Turkey';
				break;
			case 'Polaco': 
				flag = 'Poland';
				break;
			case 'Egípcio':
				flag = 'Egypt';
				break;
			case 'Ucraniano':
				flag = 'Ukraine';
				break;
			case 'Holandês':
				flag = 'Netherlands';			
				break;
		}
		
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
						<li data-id-language="${response.last_id}">
							<div class="languages-flag">
								<img src="../../assets/img/icons/flags/32/${flag}.png">
							</div>
							<div class="text">
								<h4>${title} <span class="separator">·</span> ${level}</h4>
							</div>
							<div class="remove-item">&times;</div>
						</li>`;

					if($('#languages ul').children().length == 0) $('#languages .no-info').hide();

					$('#languages ul').append(element);
				}
			}
		});
	});

	// Update bio
	$('#formBio').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				var text = $('textarea[name="short_bio"]').val();
				$('.bio-box p').text(text);

				if($('.bio-box p').data("empty") == true) {
					console.log('a');
					$('.bio-box p').data("empty") == false;
					$('.bio-box .btn-new').html(`<span class="fa fa-plus"></span>Editar descrição`);
				}

				$('#modalBio').modal("hide");
			}
		});
	});
});