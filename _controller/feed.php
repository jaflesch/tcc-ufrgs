<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Follow.php';

class Feed extends Controller {
	public function usuario() {
		$login = $this->route[PARAM_INDEX];
		$bag['profile'] = Profile::getByLogin($login);
		$bag['related_profiles'] = Profile::getAllFeedRelatedExceptBy($login);
		$bag['followers'] = Follow::getAllFollowers($bag['profile']['user']->id);

		$this->render("profile/index", $bag);
	}
	public function me() {
		$this->render("feed/index");
	}
}