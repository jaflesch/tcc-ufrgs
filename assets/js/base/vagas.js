$(document).ready(function() {
	// Filter toggle
	$('.show-filter, .hide-filter').click(function() {
		if(!$('.filter-box').is(":animated")) {
			$('.filter-box').slideToggle();
			$(this).blur();

			if($('.show-filter').text() == "Expandir filtros") {
				$('.show-filter').text("Esconder filtros");
			}
			else {
				$('.show-filter').text("Expandir filtros");
			}
		}
	})

	// Filter
	$('.clear-search').click(function() {
		$('.filter-list .item').remove();
		$('.filter-list').hide();
	});

	$('form').on("change", "input, select, textarea", function(e) {
		e.preventDefault();
		var form = $('form').serializeArray();

		updateResults(form);
	})

	function updateResults(form) {
		var shift = [];
		var workload = [];
		var has_append = false;

		$('.filter-list .item').remove();
		$('.filter-list').hide();

		for(var i = 0; i < $('[name="shift"]').length; i++) {
			if($($('[name="shift"]')[i]).is(":checked"))
				shift.push($($('[name="shift"]')[i]).val());
		}

		for(var i = 0; i < $('[name="workload"]').length; i++) {
			if($($('[name="workload"]')[i]).is(":checked")) {
				var val = $($('[name="workload"]')[i]).val();
				workload.push(parseInt(val));
				appendFilter("Carga horária", val + "h");
				has_append = true;
			}
		}

		$('[data-job]').hide();
		$('[data-job]').each(function() {
			var el = $(this);
			if($.inArray(el.data("job-workload"), workload) > -1) {
				el.show();
			}
		});


		if(has_append) {
			$('.filter-list').show()
		}
		else {
			// Nenhum resultado para os filtros.. então exibe todos
			$('[data-job]').show();
		}
	}

	function appendFilter(title, value) {
		$('.filter-list .list').append(`
			<span class="item">
				<span class="title">${title}</span>
				<span class="value">${value}</span>
				<span class="remove-item">&times;</span>
		</span>`);
	}
});