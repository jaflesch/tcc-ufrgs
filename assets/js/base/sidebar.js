$(document).ready(function() {
	$('nav .sidebar-control').click(function() {
		$(this).toggleClass('active');
		$('#menu-sidebar').toggleClass('opened');
	})
});