<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Follow.php';

class Home extends Controller {
	public function index() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());

		$this->render("feed/index", $bag);
	}
}