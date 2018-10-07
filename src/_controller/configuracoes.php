<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Preference.php';
require MODEL_PATH.'Block.php';
require MODEL_PATH.'Follow.php';

class Configuracoes extends Controller {
	public function index() {
		$bag['config'] = Preference::getGeneral();
		
		$this->render("configuracoes/index", $bag);
	}

	public function geral() {
		$bag['config'] = Preference::getGeneral();

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
		$bag['banned_users'] = Block::getAllBlockedUsersFromMyList();

		$this->render("configuracoes/bloqueio", $bag);
	}

	public function seguidores() {
		$bag['followers'] = Follow::getAllFollowers(Auth::id())['data'];
		$bag['config'] = Preference::getPrivacy();
		
		$this->render("configuracoes/seguidores", $bag);
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

	public function atualizar_geral() {
		$id = Auth::id();
		
		$db = new DBConn();
		$result = $db->update(
			"UPDATE user
			SET 
				name = '{$this->post->name}',
				email = '{$this->post->email}',
			    phone = '{$this->post->phone}'
		   WHERE id = {$id} AND active = 1
		");
		$response = new stdclass();
		$response->success = $result;
		$response->message = "Configurações gerais alteradas com sucesso!";
		die(json_encode($response));
	}

	public function atualizar_bloqueio() {
		$response = new stdclass();
		$response->success = Block::remove($this->post->id);
		die(json_encode($response));
	}
}