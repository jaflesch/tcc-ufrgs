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

		$this->sendApplyEmailAuthor();
		$this->sendApplyEmailCandidate();
		
		die(json_encode($response));
	}

	public function aprovar_candidato() {
		$response = new stdclass();
		$response->result = Job::approveApply($this->post);
		$this->sendApprovalEmail();		

		die(json_encode($response));
	}

	public function reprovar_candidato() {
		$response = new stdclass();
		$response->result = Job::reproveApply($this->post);
		die(json_encode($response));
	}

	// Emails
	private function sendApplyEmailAuthor() {
		$request = new stdclass();
		$request->job_id = $this->post->id;
		$request->candidate_id = Auth::id();

		$job = Job::getInfoByApply($request);
		$bag['job'] = $job;

		$mail = new Mail("Nova inscrição em {$job->title} - Portal de Vagas", $this);
		$mail->addAddress($job->author_email, "Portal de Vagas - UFRGS");
		$mail->bind("interesse-vaga-autor", $bag);

		// Anexa arquivos
		if($job->need_curriculum) {
			$mail->attachment(BASE_PATH.'/public/files/cv.pdf', utf8_decode("Currículo - {$job->candidate_name}.pdf"));
		}
		if($job->need_historic) {
			$mail->attachment(BASE_PATH.'/public/files/historico.pdf', utf8_decode("Histórico - {$job->candidate_name}.pdf"));
		}

		// Send the e-mail
		return $mail->send();
	}

	private function sendApplyEmailCandidate() {
		$request = new stdclass();
		$request->job_id = $this->post->id;
		$request->candidate_id = Auth::id();

		$job = Job::getInfoByApply($request);
		$bag['job'] = $job;

		$mail = new Mail("Inscrição realizada com sucesso - Portal de Vagas", $this);
		$mail->addAddress($job->candidate_email, "Portal de Vagas - UFRGS");
		$mail->bind("interesse-vaga-candidato", $bag);
		
		// Send the e-mail
		return $mail->send();
	}

	private function sendApprovalEmail() {
		$job = Job::getInfoByApply($this->post);
		$bag['job'] = $job;

		$mail = new Mail("Você foi aprovado na vaga {$job->title} - Portal de Vagas", $this);
		$mail->addAddress($job->candidate_email, "Portal de Vagas - UFRGS");
		$mail->bind("aprovar-candidato", $bag);

		// Send the e-mail
		return $mail->send();
	}
}