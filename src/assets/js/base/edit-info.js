$(document).ready(function() {
	// Update JOB information
	$('#job-experiences').on("click", '.edit-item', function() {
		var el = $(this);
		var id = el.parent().parent().attr("data-id-job");
		var company = el.parent().parent().attr("data-job-company");
		var title = el.parent().parent().attr("data-job-title");
		var data_inicio = el.parent().parent().attr("data-job-date_start");
		var data_fim = el.parent().parent().attr("data-job-date_finish");
		var location_city = el.parent().parent().attr("data-job-location_city");
		var location_state = el.parent().parent().attr("data-job-location_state");
		var textarea = el.parent().parent().attr("data-job-resume");
		location_state = location_state == "" ? 'AC' : location_state;

		$('#updateJobForm [name="content_id"]').val(id);
		$('#updateJobForm [name="title"]').val(title);
		$('#updateJobForm [name="company"]').val(company);
		$('#updateJobForm [name="title"]').val(title);
		$('#updateJobForm [name="date_start"]').val(data_inicio);
		$('#updateJobForm [name="date_finish"]').val(data_fim);
		$('#updateJobForm [name="location_city"]').val(location_city);
		$('#updateJobForm [name="location_state"]').val(location_state);
		$('#updateJobForm [name="resume"]').val(textarea);
				
		$('#modalJob').modal("show");
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
	$('#skills').on("click", '.edit-item', function() {
		var el = $(this);
		var id = el.parent().attr("data-id-skill");
		var title = el.parent().attr("data-skill-title");
		var level = el.parent().attr("data-skill-level");
		var time = el.parent().attr("data-skill-time");

		$('#updateSkillForm [name="content_id"]').val(id);
		$('#updateSkillForm [name="title"]').val(title);
		$('#updateSkillForm [name="level"]').val(level);
		$('#updateSkillForm [name="time"]').val(time);
		
		$('#modalSkill').modal("show");
	});
	
	// Update LANGUAGE information
	$('#languages').on("click", '.edit-item', function() {
		var el = $(this);
		var id = el.parent().attr("data-id-language");
		var title = el.parent().attr("data-language-title");
		var level = el.parent().attr("data-language-level");

		$('#updateLanguageForm [name="content_id"]').val(id);
		$('#updateLanguageForm [name="title"]').val(title);
		$('#updateLanguageForm [name="level"]').val(level);
		
		$('#modalLanguage').modal("show");
	});
	
	$('.profile-update-info').on("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		
		// AJAX call
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(response) {
				if(response.success) {
					location.reload();
				}
			}
		});
	});
});