// Scroll function helper
$.prototype.scrollThere = function(offset, speed) {
	offset = offset || 0;
	speed = speed || 500;

	$('html, body').animate({scrollTop: this.offset().top + offset}, speed);
};