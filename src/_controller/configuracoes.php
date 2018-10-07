<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Preference.php';

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
		$bag['config'] = Preference::getPrivacy();

		$this->render("configuracoes/privacidade", $bag);
	}

	public function bloqueio() {
		$bag['jobs'] = Job::getAllFeedRelated();
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());

		$this->render("configuracoes/bloqueio", $bag);
	}

	public function atualizar_privacidade() {
		$id = Auth::id();
		
		$db = new DBConn();
		$result = $db->update(
			"UPDATE user
			SET 
				post_privacy = {$this->post->post_privacy},
				show_schollar_info = {$this->post->show_schollar_info},
			    show_curriculum = {$this->post->show_curriculum},
			    follower_privacy = {$this->post->follower_privacy},
			    following_privacy = {$this->post->following_privacy}
		   WHERE id = {$id} AND active = 1
		");
		$response = new stdclass();
		$response->success = $result;
		$response->message = "Configurações de privacidade alteradas com sucesso!";
		die(json_encode($response));
	}
}