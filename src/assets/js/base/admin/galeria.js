$(document).ready(function() {
	$('.gallery-remove').click(function(e) {
		var id = $(this).data('id');
		var div = $(this).parent();
		
		$.ajax({
			url: '../delete-image',
			method: 'POST',
			dataType: 'json',
			data: { id : id },
			success: function(json) {	
				if(json.success) {
					location.reload(true);
				}
				else alert('Erro ao remover imagem. Por favor, tente novamente.');
			}
		});
	});

	var $form = $("#formImage");
	var $fileUploader = $("#fileUploader");

		$fileUploader.fileinput({
        language: "pt-BR",
        uploadAsync: false,
        uploadUrl: $form.attr('action'),
        uploadExtraData: function() {
            return {
                id: $('[name="id"]').val()
            };
        },
        ajaxSettings: {
            success: function(json) {
                alert(json.msg);
                if(json.success)
                	location.reload(true);
            }
        }
	});
});