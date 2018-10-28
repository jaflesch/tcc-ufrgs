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

		updateResults();
	});

	$('body').on("click", ".remove-item", function() {
		var name = $(this).parent().attr("data-name");
		var val = $(this).parent().attr("data-val");
		
		$(`[name="${name}"][value="${val}"]`).prop("checked", false);
		$(this).parent().remove();
		
		updateResults();
	});

	function updateResults() {
		var shift = [];
		var workload = [];
		var category = [];
		var type = [];
		var has_append = false;

		$('.filter-list .item').remove();
		$('.filter-list').hide();

		// Shift
		for(var i = 0; i < $('[name="shift"]').length; i++) {
			if($($('[name="shift"]')[i]).is(":checked"))
				shift.push($($('[name="shift"]')[i]).val());
		}

		// Workload
		for(var i = 0; i < $('[name="workload"]').length; i++) {
			if($($('[name="workload"]')[i]).is(":checked")) {
				var val = $($('[name="workload"]')[i]).val();
				workload.push(parseInt(val));
				appendFilter("Carga horária", val + "h", "workload", val);
				has_append = true;
			}
		}

		// Category
		for(var i = 0; i < $('[name="category"]').length; i++) {
			if($($('[name="category"]')[i]).is(":checked")) {
				var val = $($('[name="category"]')[i]).val();
				var label = $($('[name="category"]')[i]).data("label");
				category.push(val);
				appendFilter("Área", label, "category", val);
				has_append = true;
			}
		}

		// Type
		for(var i = 0; i < $('[name="type"]').length; i++) {
			if($($('[name="type"]')[i]).is(":checked")) {
				var val = $($('[name="type"]')[i]).val();
				var label = $($('[name="type"]')[i]).data("label");
				type.push(parseInt(val));
				appendFilter("Tipo", label, "type", val);
				has_append = true;
			}
		}

		$('[data-job]').hide();
		$('[data-job]').each(function() {
			var el = $(this);

			// Workload
			if($.inArray(el.data("job-workload"), workload) > -1) {
				el.show();
			}

			// Category
			var all_job_categories = (el.data("job-category") + '').split(',');
			for(var i = 0; i < all_job_categories.length; i ++) {
				for(var j = 0; j < category.length; j++) {
					if(all_job_categories[i] == category[j])
						el.show();
				}
			}
			
			// Type
			if($.inArray(el.data("job-type"), type) > -1) {
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

		// Update results count
		$('#jobs-count').text(parseInt($('[data-job]:visible').length));
	}

	function appendFilter(title, value, name, val) {
		$('.filter-list .list').append(`
			<span class="item" data-name="${name}" data-val="${val}">
				<span class="title">${title}</span>
				<span class="value">${value}</span>
				<span class="remove-item">&times;</span>
		</span>`);
	}

	// Ordering
	$('[name="order_criteria"]').change(function() {
		var el = $(this);
		var val = el.find(":selected").val();

		$.ajax({
			url: el.data("action"),
			method: 'POST',
			dataType: 'html',
			data: { order: val },
			success: function(html) {
				$('#job-result .row').html(html);
			}
		})
	});

	// Recommend & Interest
	$('.apply.cta').click(function(e) {
		e.preventDefault();
		
		var el = $(this);		
		el.removeClass('apply').addClass('applied').html("<span class='fa fa-check-circle'></span> Candidatado!");

		$.ajax({
			url: el.attr("href"),
			method: 'POST',
			dataType: 'json',
			data: { id : el.data("job") }
		})
	})
});