<?php
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Favorite.php';

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

	// AJAX calls
	public function favoritar() {
		$response = new stdclass();
		$response->success = Favorite::save($this->post->id, Favorite::JOB);
		$response->msg = $response->success ? "Vaga adicionada ao seus <a href='{$this->path['root']}/vagas/favoritos' title='Ver meus favoritos'>favoritos</a>." : "Desculpe, ocorreu um erro. Tente de novo.";
		die(json_encode($response));
	}

	public function desfavoritar() {
		$response = new stdclass();
		$response->success = Favorite::delete($this->post->id, Favorite::JOB);
		$response->msg = $response->success ? "Vaga removida dos <a href='{$this->path['root']}/vagas/favoritos' title='Ver meus favoritos'>favoritos</a>." : "Desculpe, ocorreu um erro. Tente de novo.";
		die(json_encode($response));
	}
}