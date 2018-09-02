<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Job.php';

class Home extends Controller {
	public function index() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();

		$this->render("feed/index", $bag);
	}
}