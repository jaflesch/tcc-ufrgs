<?php
require '_lib/Helper/Dictionary.php';

class Fs extends Controller {

	public static function index() {
		self::render("fs/index", $bag);
	}
}