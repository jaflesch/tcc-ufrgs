<?php
require_once MODEL_PATH.'Profile.php';
require_once MODEL_PATH.'Preference.php';
require_once MODEL_PATH.'Block.php';
require_once MODEL_PATH.'Follow.php';
require_once MODEL_PATH.'Job.php';
require_once MODEL_PATH.'Education.php';
require_once MODEL_PATH.'Skill.php';
require_once MODEL_PATH.'Log.php';

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
		$bag['logs'] = Log::getAll();
		
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
		$result = $db->update("
			UPDATE user
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

	public function atualizar_experiencia() {
		$response = new stdclass();
		$response->last_id = Job::add($this->post);
		$response->success = $response->last_id > 0;
		die(json_encode($response));
	}

	public function remover_experiencia() {
		$response = new stdclass();
		$response->success = Job::remove($this->post->id);
		die(json_encode($response));
	}

	public function update_experiencia() {
		$response = new stdclass();
		$response->success = Job::update($this->post);
		die(json_encode($response));
	}

	public function atualizar_educacao() {
		$response = new stdclass();
		$response->last_id = Education::add($this->post);
		$response->success = $response->last_id > 0;
		die(json_encode($response));
	}

	public function remover_educacao() {
		$response = new stdclass();
		$response->success = Education::remove($this->post->id);
		die(json_encode($response));
	}

	public function update_educacao() {
		$response = new stdclass();
		$response->success = Education::update($this->post);
		die(json_encode($response));
	}

	public function atualizar_habilidade() {
		$response = new stdclass();
		$response->last_id = Skill::add($this->post);
		$response->success = $response->last_id > 0;
		die(json_encode($response));
	}

	public function remover_habilidade() {
		$response = new stdclass();
		$response->success = Skill::remove($this->post->id);
		die(json_encode($response));
	}

	public function update_habilidade() {
		$response = new stdclass();
		$response->success = Skill::update($this->post);
		die(json_encode($response));
	}

	public function atualizar_idioma() {
		$response = new stdclass();
		$response->last_id = Language::add($this->post);
		$response->success = $response->last_id > 0;
		die(json_encode($response));
	}

	public function remover_idioma() {
		$response = new stdclass();
		$response->success = Language::remove($this->post->id);
		die(json_encode($response));
	}

	public function update_idioma() {
		$response = new stdclass();
		$response->success = Language::update($this->post);
		die(json_encode($response));
	}
}