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
});