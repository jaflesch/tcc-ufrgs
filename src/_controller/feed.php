<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Follow.php';
require MODEL_PATH.'Block.php';
require MODEL_PATH.'Post.php';
require MODEL_PATH.'RecommendUser.php';

class Feed extends Controller {
	public function usuario() {
		$login = $this->route[PARAM_INDEX];
		$bag['profile'] = Profile::getByLogin($login);
		$bag['related_profiles'] = Profile::getAllFeedRelatedExceptBy($login);
		$bag['followers'] = Follow::getAllFollowers($bag['profile']['user']->id);
		$bag['recomendations'] = RecommendUser::getAllFromUserId($bag['profile']['user']->id);

		$this->render("feed/index", $bag);
	}
	public function me() {
		$this->render("feed/index");
	}

	// AJAX Calls
	public function seguir() {
		$response = new stdclass();
		$response->result = Follow::save($this->post->id);
		die(json_encode($response));
	}

	public function deixar_seguir() {
		$response = new stdclass();
		$response->result = Follow::delete($this->post->id);
		die(json_encode($response));
	}

	// AJAX Calls
	public function bloquear() {
		$response = new stdclass();
		$response->result = Block::add($this->post->id);
		die(json_encode($response));
	}

	public function desbloquear() {
		$response = new stdclass();
		$response->result = Block::remove($this->post->id);
		die(json_encode($response));
	}

	public function new_post() {
		$response = new stdclass();
		$response->result = Post::add($this->post);
		die(json_encode($response));
	}

	public function delete_post() {
		$response = new stdclass();
		$response->result = Post::delete($this->post->delete_post_id);
		die(json_encode($response));
	}

	public function recomendar() {
		$response = new stdclass();
		$response->result = RecommendUser::add($this->post);
		die(json_encode($response));
	}
}