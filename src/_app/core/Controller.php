<?php
require_once(CORE_PATH.'Medjai.php');

class Controller extends Medjai {
	public function render($tpl = "index.html", $vars = array(), $echo = true) {
		// store generic custom data here
		$vars["user"] = Auth::user() ? Auth::getUser() : NULL;

		return parent::render($tpl, $vars, $echo);
	}

	// user generic custom methods should be created here	
}