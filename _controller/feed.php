<?php
require MODEL_PATH.'Profile.php';

class Feed extends Controller {
	public function usuario() {
		$login = $this->route[PARAM_INDEX];
		$bag['profile'] = Profile::getByLogin($login);
		
		$this->render("profile/index", $bag);
	}
	public function me() {
		$this->render("feed/index");
	}
}