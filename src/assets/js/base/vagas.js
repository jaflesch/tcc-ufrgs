$(document).ready(function() {
	var min_sal = parseInt($('[name="salary_from"]').val());
	var max_sal = parseInt($('[name="salary_to"]').val());

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

		min_sal = 0;
		$('form').trigger("reset");
		updateResults();
		
		$(this).blur();
		// $('.filter-list .item').remove();
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
		
		if($(`[name="${name}"]`).attr("type") == "radio") {
			// Default radio button behaviour
			$(`[name="${name}"][value="-1"]`).prop("checked", true);	
		}
		else {
			// Default checkbox button behaviour
			$(`[name="${name}"][value="${val}"]`).prop("checked", false);			
		}

		$(this).parent().remove();
		
		updateResults();
	});

	function updateResults() {
		var shift = [];
		var workload = [];
		var category = [];
		var type = [];

		var cv = $('[name="need_cv"]:checked').val() == undefined ? -1 : parseInt($('[name="need_cv"]:checked').val());
		var historic = $('[name="need_historic"]:checked').val() == undefined ? -1 : parseInt($('[name="need_historic"]:checked').val());
		var prae = $('[name="is_prae"]:checked').val() == undefined ? -1 : parseInt($('[name="is_prae"]:checked').val());
		var modality = $('[name="modality"]:checked').val() == undefined ? -1 : parseInt($('[name="modality"]:checked').val());

		//  reset
		var reset_max = max_sal;
		var reset_min = min_sal;
		var skip = false;
		var has_append = false;
		var count = 0;

		$('.filter-list .item').remove();
		$('.filter-list').hide();
		$('article[data-job]').removeClass('hide-count');

		// Shift
		for(var i = 0; i < $('[name="shift"]').length; i++) {
			if($($('[name="shift"]')[i]).is(":checked")) {
				var val = $($('[name="shift"]')[i]).val();
				var text = $($('[name="shift"]')[i]).attr("data-label");
				shift.push(parseInt(val));
				appendFilter("Turno", text, "shift", val);
				has_append = true;
			}
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
				var label = $($('[name="category"]')[i]).attr("data-label");
				category.push(parseInt(val));
				appendFilter("Área", label, "category", val);
				has_append = true;
			}
		}

		// Type
		for(var i = 0; i < $('[name="type"]').length; i++) {
			if($($('[name="type"]')[i]).is(":checked")) {
				var val = $($('[name="type"]')[i]).val();
				var label = $($('[name="type"]')[i]).attr("data-label");
				type.push(parseInt(val));
				appendFilter("Tipo", label, "type", val);
				has_append = true;
			}
		}

		// CV
		if(cv != -1) {
			if(cv == 1) {
				var val = 1;
				var label = "Exige";
				appendFilter("Currículo", label, "need_cv", val);
			}
			else {
				var val = 0;
				var label = "Não exige";
				appendFilter("Currículo", label, "need_cv", val);
			}
		}

		// Historic
		if(historic != -1) {
			if(historic == 1) {
				var val = 1;
				var label = "Exige";
				appendFilter("Histórico", label, "need_historic", val);
			}
			else {
				var val = 0;
				var label = "Não exige";
				appendFilter("Histórico", label, "need_historic", val);
			}
		}

		// PRAE
		if(prae != -1) {
			if(prae == 1) {
				var val = 1;
				var label = "Sim";
				appendFilter("PRAE", label, "is_prae", val);
			}
			else {
				var val = 0;
				var label = "Não";
				appendFilter("PRAE", label, "is_prae", val);
			}
		}

		// Modalidade
		if(modality != -1) {
			if(modality == 1) {
				var val = 1;
				var label = "À distância";
				appendFilter("Modalide", label, "modality", val);
			}
			else {
				var val = 0;
				var label = "Presencial";
				appendFilter("Modalide", label, "modality", val);
			}
		}

		$('article[data-job]').hide();
		
		// CV, Historic and Prae Handling
		$('article[data-job]').each(function() {
			var el = $(this);

			if(cv == -1 ) {
				// X - X
				if(historic == -1) {
					if(prae == -1 ) {
						// no filters
						el.show();
					}
					else if(prae == 0) {
						// X - X - 0
						if(parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// X - X - 1
						if(parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
				// X - 0
				else if(historic == 0) {
					if(prae == -1 ) {
						// X - 0 - X
						if(parseInt(el.attr("data-job-historico")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// X - 0 - 0
						if(parseInt(el.attr("data-job-historico")) == 0 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// X - 0 - 1
						if(parseInt(el.attr("data-job-historico")) == 0 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
				// X - 1 
				else {
					if(prae == -1 ) {
						// X - 1 - X
						if(parseInt(el.attr("data-job-historico")) == 1) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// X - 1 - 0
						if(parseInt(el.attr("data-job-historico")) == 1 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// X - 1 - 1
						if(parseInt(el.attr("data-job-historico")) == 1 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
			}
			else if(cv == 0) {
				// 0 -
				if(historic == -1) {
					// 0 - X
					if(prae == -1 ) {
						// 0 - X - X
						if(parseInt(el.attr("data-job-cv")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// 0 - X - 0
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// 0 - X - 1
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
				// 0 - 0
				else if(historic == 0) {
					if(prae == -1 ) {
						// 0 - 0 - X
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-historico")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// 0 - 0 - 0
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-historico")) == 0 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// 0 - 0 - 1
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-historico")) == 0 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
				// 0 - 1 
				else {
					if(prae == -1 ) {
						// 0 - 1 - X
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-historico")) == 1) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// 0 - 1 - 0
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-historico")) == 1 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// 0 - 1 - 1
						if(parseInt(el.attr("data-job-cv")) == 0 && parseInt(el.attr("data-job-historico")) == 1 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
			}
			else {
				// 1 -
				if(historic == -1) {
					// 1 - X
					if(prae == -1 ) {
						// 1 - X - X
						if(parseInt(el.attr("data-job-cv")) == 1) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// 1 - X - 0
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// 1 - X - 1
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
				// 0 - 0
				else if(historic == 0) {
					if(prae == -1 ) {
						// 1 - 0 - X
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-historico")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// 1 - 0 - 0
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-historico")) == 0 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// 1 - 0 - 1
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-historico")) == 0 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
				// 0 - 1 
				else {
					if(prae == -1 ) {
						// 1 - 1 - X
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-historico")) == 1) {
							el.show();
							has_append = true;
						}
					}
					else if(prae == 0) {
						// 1 - 1 - 0
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-historico")) == 1 && parseInt(el.attr("data-job-prae")) == 0) {
							el.show();
							has_append = true;
						}
					}
					else {
						// 1 - 1 - 1
						if(parseInt(el.attr("data-job-cv")) == 1 && parseInt(el.attr("data-job-historico")) == 1 && parseInt(el.attr("data-job-prae")) == 1) {
							el.show();
							has_append = true;
						}
					}
				}
			}
		});

		// Workload
		$('article[data-job]:visible').each(function() {
			var el = $(this);

			if($.inArray(parseInt(el.attr("data-job-workload")), workload) == -1) {
				if(workload.length > 0)
					el.hide();
			}
		});

		//  Shift
		$('article[data-job]:visible').each(function() {
			var el = $(this);

			if($.inArray(parseInt(el.attr("data-job-shift")), shift) == -1) {
				if(shift.length > 0)
					el.hide();
			}
		});

		// Type	
		$('article[data-job]:visible').each(function() {
			var el = $(this);

			if($.inArray(parseInt(el.attr("data-job-type")), type) == -1) {
				if(type.length > 0) {
					el.hide();
				}
			}
		});

		// Salary
		//  se voluntario...
		if($.inArray(6, type) > -1 || type == "") {
			min_sal = 0;
		}
		else {
			min_sal = parseInt($('[name="salary_from"]').val());
		}
		max_sal = parseInt($('[name="salary_to"]').val());

		$('article[data-job]:visible').each(function() {
			var el = $(this);

			if(parseInt(el.attr("data-job-salary")) < min_sal) {
				el.hide();
			}
			else if(parseInt(el.attr("data-job-salary")) > max_sal) {
				el.hide();
			}
			has_append = true;
		});

		// Modality	
		$('article[data-job]:visible').each(function() {
			var el = $(this);
			var el_modality = parseInt(el.attr("data-job-modality"));
			
			if(modality != -1) {
				has_append = true;
				
				if(el_modality != modality) {
					el.hide();
				}
			}				
		});
		
		// Category
		$('article[data-job]:visible').each(function() {
			var el = $(this);

			var show = false;
			if(category.length > 0) {
				var all_job_categories = (el.attr("data-job-category") + '').split(',');
				
				for(var i = 0; i < all_job_categories.length; i ++) {
					for(var j = 0; j < category.length; j++) {
						if(parseInt(all_job_categories[i]) == category[j]) {
							show = true;
						}
					}
				}
				if(!show) el.hide();				
			}			
		});

		// Title	
		$('article[data-job]:visible').each(function() {
			var el = $(this);
			var term = $('[name="title"]').val();

			if(term != "") {
				if(el.attr("data-job-title").toLowerCase().search(term.toLowerCase()) == -1) {
					el.hide();
				}
			}
		});

		// Location	
		$('article[data-job]:visible').each(function() {
			var el = $(this);
			var location = $('[name="location"]').val();
			
			if(location != "") {
				if(
					el.attr("data-job-location").toLowerCase().search(location.toLowerCase()) == -1 &&
					el.attr("data-job-location-city").toLowerCase().search(location.toLowerCase()) == -1 &&
					el.attr("data-job-location-state").toLowerCase().search(location.toLowerCase()) == -1
				) {
					el.hide();
				}
			}
		});
			
		if(has_append) {
			$('.filter-list').show();
		}
		else {
			// Nenhum resultado para os filtros.. então exibe todos
			$('article[data-job]').show();
		}

		if($('.filter-list .list').children().length == 0 ) $('.filter-list').hide();

		// Update results count
		var count = $('article[data-job]:visible').length;
		$('#jobs-count').text(parseInt(count));
		
		if(count == 0) {
			$('.no-result-box').show();
		}
		else {
			$('.no-result-box').hide();
		}
		if(count <= 24 ) {
			$('.see-more').hide();
		}
		else {
			$('.see-more').show();	
			var i = 1;

			$('article[data-job]:visible').each(function() {
				var el = $(this);

				if(i > 24) el.addClass('hide-count');

				i++;
			});
		}
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

		// Loading modal
		$('#modalLoading').modal("show");

		$.ajax({
			url: el.attr("data-action"),
			method: 'POST',
			dataType: 'html',
			data: { order: val },
			success: function(html) {
				$('#job-result .row').html(html);
				updateResults();

				$('#modalLoading').modal("hide");
			},
			error: function() {
				$('#modalLoading').modal("hide");
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
			data: { id : el.attr("data-job") }
		})
	})

	// Show all results 
	$('body').on("click", ".see-more", function(e) {
		e.preventDefault();
		$('article[data-job]').removeClass('hide-count');

		$(this).hide();
	});
});