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
		var selected = el.parent().parent().attr('data-job-selected');
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
		$('#updateJobForm [name="selected"]').val(selected);

		$('#modalJob').modal("show");
	});

	// Update EDUCATION information
	$('#education-experiences').on("click", '.edit-item', function() {
		var el = $(this);
		var id = el.parent().parent().attr("data-id-education");
		var subtitle = el.parent().parent().attr("data-education-subtitle");
		var title = el.parent().parent().attr("data-education-title");
		var data_inicio = el.parent().parent().attr("data-education-date_start");
		var data_fim = el.parent().parent().attr("data-education-date_finish");
		var location_city = el.parent().parent().attr("data-education-location_city");
		var location_state = el.parent().parent().attr("data-education-location_state");
		var textarea = el.parent().parent().attr("data-education-resume");
		var selected = el.parent().parent().attr('data-education-selected');
		location_state = location_state == "" ? 'AC' : location_state;

		$('#updateEducationForm [name="content_id"]').val(id);
		$('#updateEducationForm [name="title"]').val(title);
		$('#updateEducationForm [name="subtitle"]').val(subtitle);
		$('#updateEducationForm [name="title"]').val(title);
		$('#updateEducationForm [name="date_start"]').val(data_inicio);
		$('#updateEducationForm [name="date_finish"]').val(data_fim);
		$('#updateEducationForm [name="location_city"]').val(location_city);
		$('#updateEducationForm [name="location_state"]').val(location_state);
		$('#updateEducationForm [name="resume"]').val(textarea);
		$('#updateEducationForm [name="selected"]').val(selected);
				
		$('#modalEducation').modal("show");
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
	
	// AJAX call
	$('.profile-update-info').on("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		
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