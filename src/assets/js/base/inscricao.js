$(document).ready(function() {
	$('.form-apply').change(function() {
		var filter = [];

		$('.form-apply input').each(function() {
			var el = $(this);
			
			if(el.is(":checked")) {
				filter.push(parseInt(el.val()));
			}
		});


		$('[data-apply]').each(function() {
			var el = $(this);

			console.log(el.data("apply"), filter, $.inArray(el.data("apply"), filter) < 0);
			el.hide();
			if($.inArray(el.data("apply"), filter) > -1) {
				el.show();
			}
		});

		if($('[data-apply]:visible').length == 0) {
			$('.no-result').show();
		}
		else {
			$('.no-result').hide();
		}
	})

	// Approve / Reprove 
	$('.approve').click(function(e) {
		var user = $(this).parent().parent().parent().data("user");
		var job = $(this).parent().parent().parent().data("job");
		
		$('#formApproveCandidate [name="candidate_id"]').val(user);
		$('#formApproveCandidate [name="job_id"]').val(job);
	})

	$('.reprove').click(function(e) {
		var user = $(this).parent().parent().parent().data("user");
		var job = $(this).parent().parent().parent().data("job");
		
		$('#formReproveCandidate [name="candidate_id"]').val(user);
		$('#formReproveCandidate [name="job_id"]').val(job);
	});

	$('#formReproveCandidate,#formApproveCandidate').unbind("submit").bind("submit", function(e) {
		e.preventDefault();
		var form = $(this);
		var user_id = form.children('[name="candidate_id"]').val();
		
		if(form.attr("id") == 'formApproveCandidate') {
			var obj = '.approve';
			var target = 'approved';
			var label_text = 'Aprovado';
		}
		else {
			var obj = '.reprove';
			var target = 'reproved';
			var label_text = 'Reprovado';	
		}

		$.ajax({
			url: form.attr("action"),
			method: 'POST',
			dataType: 'json',
			data: form.serializeArray(),
			success: function(json) {
				if(json.success) {
					var el = $(`.interested-user[data-user="${user_id}"]`).children().children('.user-actions').children(obj);
					el.siblings().remove();
					el.parent().html(`<span class="${target}">${label_text}</span>`);					
					$('.modal').modal("hide");
				}
			}
		})
	});
});