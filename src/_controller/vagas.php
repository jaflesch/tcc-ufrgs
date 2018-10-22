<?php
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Favorite.php';
require MODEL_PATH.'RecommendJob.php';
require LIB_PATH.'Mail.php';

class Vagas extends Controller {
	public function index() {
		$fetch = Job::getAll();
		$bag['jobs'] = $fetch['jobs'];
		$bag['filters'] = $fetch['filters'];
		$bag['related_profiles'] = Profile::getAllFeedRelated();
		
		$this->render("vagas/index", $bag);
	}

	public function favoritos() {
		$bag['jobs'] = Job::getAllFavorites();
		$bag['related_profiles'] = Profile::getAllFeedRelated();
		
		$this->render("vagas/index", $bag);
	}

	public function sobre() {
		$id = (int)$this->route[PARAM_INDEX];

		$bag['job'] = Job::getById($id);
		$bag['recomendations'] = RecommendJob::getAllFromJobId($id);
		$bag['related_jobs'] = Job::getRelated($id);
		$bag['candidates'] = Job::getAllAppliedUsersByJobId($id);

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

	public function recomendar() {
		$response = new stdclass();
		$response->result = RecommendJob::add($this->post);
		die(json_encode($response));
	}

	public function candidatar() {
		$response = new stdclass();
		$response->result = Job::apply($this->post->id);
		die(json_encode($response));
	}

	public function aprovar_candidato() {
		$this->sendEmail("Você foi aprovado na vaga X", "aprovar-candidato");
		// needs to get info about Job
		$response = new stdclass();
		$response->result = Job::approveApply($this->post);
		die(json_encode($response));
	}

	public function reprovar_candidato() {
		$response = new stdclass();
		$response->result = Job::reproveApply($this->post);
		die(json_encode($response));
	}

	private function sendEmail($title, $template) {
		// Initiate the mail
		$bag["time"] = date("H:i:s");
		$bag["date"] = date('d/m/Y');
		
		$mail = new Mail("{$title} - Portal de Vagas", $this);
		$mail->addAddress(MAIL_CONTACT, "Contato");
		$mail->bind($template, $bag);

		// Send the e-mail
		return $mail->send();
	}
}