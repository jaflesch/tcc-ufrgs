<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Follow.php';
require MODEL_PATH.'Post.php';

class Configuracoes extends Controller {
	public function index() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());
		
		$this->render("configuracoes/index", $bag);
	}

	public function geral() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());

		$this->render("configuracoes/index", $bag);
	}


	public function meu_perfil() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());

		$this->render("configuracoes/meu-perfil", $bag);
	}

	public function registro_atividades() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());

		$this->render("configuracoes/registro-atividades", $bag);
	}

	public function privacidade() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());

		$this->render("configuracoes/privacidade", $bag);
	}

	public function bloqueio() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());

		$this->render("configuracoes/bloqueio", $bag);
	}
}