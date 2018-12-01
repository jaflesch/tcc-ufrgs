<?php
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Favorite.php';
require MODEL_PATH.'RecommendJob.php';
require MODEL_PATH.'Log.php';
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
		$bag['related_jobs'] = array_slice(Job::getRelated($id),0 ,12);
		$bag['candidates'] = Job::getAllAppliedUsersByJobId($id);
		$bag['has_recommended'] = RecommendJob::hasRecommend($id);
		
		$this->render("vagas/sobre", $bag);
	}

	public function inscricoes() {
		$bag['applies'] = Job::getAllAppliesByMe();
		$bag['candidates'] = Job::getAllAppliedUsersByAuthorId();
		$bag['related_jobs'] = Job::getRelated();

		$this->render("vagas/inscricoes", $bag);
	}

	// AJAX calls
	public function favoritar() {
		$response = new stdclass();
		$response->success = Favorite::save($this->post->id, Favorite::JOB);
		$response->msg = $response->success ? "Vaga adicionada ao seus <a href='{$this->path['root']}/vagas/favoritos' title='Ver meus favoritos'>favoritos</a>." : "Desculpe, ocorreu um erro. Tente de novo.";

		Log::add($this->post->id, LOG_TYPE_JOB, LOG_FAVORITE);
		die(json_encode($response));
	}

	public function desfavoritar() {
		$response = new stdclass();
		$response->success = Favorite::delete($this->post->id, Favorite::JOB);
		$response->msg = $response->success ? "Vaga removida dos <a href='{$this->path['root']}/vagas/favoritos' title='Ver meus favoritos'>favoritos</a>." : "Desculpe, ocorreu um erro. Tente de novo.";

		Log::add($this->post->id, LOG_TYPE_JOB, LOG_UNFAVORITE);
		die(json_encode($response));
	}

	public function recomendar() {
		$response = new stdclass();
		$response->result = RecommendJob::add($this->post);
		Log::add($this->post->job_id, LOG_TYPE_JOB, LOG_RECOMMEND_JOB);
		
		die(json_encode($response));
	}

	public function candidatar() {
		$response = new stdclass();
		$response->result = Job::apply($this->post->id);
		Log::add($this->post->id, LOG_TYPE_JOB, LOG_APPLY);

		$this->sendApplyEmailAuthor();
		$this->sendApplyEmailCandidate();
		
		die(json_encode($response));
	}

	public function aprovar_candidato() {
		$response = new stdclass();
		$response->result = Job::approveApply($this->post);
		Log::add($this->post->candidate_id, LOG_TYPE_USER, LOG_APPLY_ACCEPT);

		$this->sendApprovalEmail();		

		die(json_encode($response));
	}

	public function reprovar_candidato() {
		$response = new stdclass();
		$response->result = Job::reproveApply($this->post);
		Log::add($this->post->candidate_id, LOG_TYPE_USER, LOG_APPLY_REJECT);

		die(json_encode($response));
	}

	public function ordenar() {
		$order = (int)$this->post->order;

		switch($order) {
			case 2:
				$by = "_custom_most_rated";
				break;
			case 3:
				$by = "j.date_start DESC";
				break;
			case 4:
				$by = "j.date_start";
				break;
			case 5:
				$by = "j.salary DESC";
				break;
			case 6:
				$by = "j.salary";
				break;
			case 1:
			default:
				$by = "";
		}
		
		die($this->render("vagas/_result", Job::getAll($by)));
	}

	// Emails
	private function sendApplyEmailAuthor() {
		$request = new stdclass();
		$request->job_id = $this->post->id;
		$request->candidate_id = Auth::id();
		$request->apply_status = 0;

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
		$request->apply_status = 0;

		$job = Job::getInfoByApply($request);
		$bag['job'] = $job;

		$mail = new Mail("Inscrição realizada com sucesso - Portal de Vagas", $this);
		$mail->addAddress($job->candidate_email, "Portal de Vagas - UFRGS");
		$mail->bind("interesse-vaga-candidato", $bag);
		
		// Send the e-mail
		return $mail->send();
	}

	private function sendApprovalEmail() {
		$this->post->apply_status = 1;
		$job = Job::getInfoByApply($this->post);
		$bag['job'] = $job;

		$mail = new Mail("Você foi aprovado na vaga {$job->title} - Portal de Vagas", $this);
		$mail->addAddress($job->candidate_email, "Portal de Vagas - UFRGS");
		$mail->bind("aprovar-candidato", $bag);

		// Send the e-mail
		return $mail->send();
	}
}