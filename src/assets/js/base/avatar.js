$(document).ready(function() {
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