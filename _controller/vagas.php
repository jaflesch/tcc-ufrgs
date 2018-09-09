<?php
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Profile.php';

class Vagas extends Controller {
	public function index() {
		$bag['jobs'] = Job::getAll();
		$bag['related_profiles'] = Profile::getAllFeedRelated();
		
		$this->render("vagas/index", $bag);
	}

	public function sobre() {
		$id = (int)$this->route[PARAM_INDEX];

		$bag['job'] = Job::getById($id);
		$bag['related_jobs'] = Job::getRelated($id);

		$this->render("vagas/sobre", $bag);
	}
}