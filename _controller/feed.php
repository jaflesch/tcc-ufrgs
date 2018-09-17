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

	// AJAX Calls
	public function seguir() {
		$response = new stdclass();
		$response->result = Follow::save($this->post->id);
		die(json_encode($response));
	}

	public function deixar_seguir() {
		$response = new stdclass();
		$response->result = Follow::delete($this->post->id);
		die(json_encode($response));
	}
}