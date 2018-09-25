$(document).ready(function() {
	$('#formStep2').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);

		form.find('.btn-default').prop("disabled", true);
		form.find('img').toggleClass('hide');

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				form.find('.btn-default').prop("disabled", false);
				form.find('img').toggleClass('hide');

				if(json.success) {
					$('.box-step').hide();
					$('#step-3').show();
				} 
				else {
					$('.box-step').hide();
					$('#error-db').show();
				}
			}
		})
	});

	$('#formStep3').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);

		// form.find('.btn-default').prop("disabled", true);
		form.find('img').toggleClass('hide');
		
		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: { 
				db_server: $('[name="dbserver"]').val(),
				db_user: $('[name="dbuser"]').val(),
				db_pass: $('[name="dbpass"]').val(),
				db_name: $('[name="dbname"]').val(),
				user_login: $('[name="user_name"]')[1].value,
				user_mail: $('[name="user_mail"]').val(),
				user_pass: $('[name="user_password"]')[1].value
			},
			success: function(json) {
				form.find('.btn-default').prop("disabled", false);
				form.find('img').toggleClass('hide');

				if(json.success) {
					$('.box-step').hide();
					$('#step-4').show();
				} 
				else {
					$('.box-step').hide();
					$('#error-db').show();
				}
			}
		});
	});

	// password strength
	$('[name="user_password"]').keyup(function(e) {
		var val = $(this).val();

		function hasNumbers() {
    		return val.match(/[0-9]/g);			
		}
		function hasLetters() {
    		return val.match(/[a-zA-Z]/g);			
		}
		function hasSpcChars() {
			return val.match(/[#*\-\_\^\~\%\$]/g);
		}
		
		if(val.length < 5 || (val.length < 8 && (hasNumbers() === null || hasLetters() === null )) ) {
			$('.password-strength').removeClass('warning success').addClass('danger').text("Fraca");			 
		}
		else if(val.length < 8 || ( val.length < 11 && hasSpcChars() === null) ) {
			$('.password-strength').removeClass('success danger').addClass('warning').text("Média");			 
		}
		else {
			$('.password-strength').removeClass('warning danger').addClass('success').text("Forte");			 
		}

		$('.password-strength').removeClass('hide');
	});

	// see/unsee password
	$('.password-see').click(function() {
		var $icon = $(this).children('i');

		$icon.toggleClass('fa-eye fa-eye-slash');
		if($icon.hasClass('fa-eye-slash')) {
			$('[name="user_password"]').attr("type", "text");
		}
		else {
			$('[name="user_password"]').attr("type", "password");
		}
	});
});