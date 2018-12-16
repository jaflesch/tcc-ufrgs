$(document).ready(function() {
	$('#formLogin').unbind("submit").bind("submit", function(e) {		
		e.preventDefault();
		var form = $(this);
		
		if($('[name="login"]').val() == "" || $('[name="password"]').val() == "") {
			alert('Por favor, preencha ambos os campos do formulário!');
		}
		else {
			$('#formLogin button').text("Enviando...").prop("disabled", true);

			$.ajax({
				url: form.attr('action'),
				method: 'POST',
				dataType: 'json',
				data: form.serializeArray(),
				success: function(json) {
					if(json.success)
						$('#error-login').hide();
						document.location = "";
					else {
						$('#error-login').show();
						$('#formLogin button').text("Enviar").prop("disabled", false);
					}
				},
				error: function(json) {
					$('#formLogin button').text("Enviar").prop("disabled", false);
				}
			});
		}
	});
});