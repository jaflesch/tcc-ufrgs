<?php
class Error404 extends Controller {
	public static function index() {
		self::redirect("home");
	}
}