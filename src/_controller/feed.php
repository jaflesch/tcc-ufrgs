<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Follow.php';
require MODEL_PATH.'Block.php';
require MODEL_PATH.'Post.php';
require MODEL_PATH.'RecommendUser.php';
require MODEL_PATH.'Log.php';

class Feed extends Controller {
	public function usuario() {
		$login = $this->route[PARAM_INDEX];
		$bag['profile'] = Profile::getByLogin($login);
		$bag['related_profiles'] = Profile::getAllFeedRelatedExceptBy($login);
		$bag['followers'] = Follow::getAllFollowers($bag['profile']['user']->id);
		$bag['recomendations'] = RecommendUser::getAllFromUserId($bag['profile']['user']->id);
		$bag['user_is_blocked_by_me'] = Block::isUserInMyBlockedList($login);
		$bag['has_recommended'] = RecommendUser::hasRecommend($login);
		
		$this->render("feed/index", $bag);
	}
	public function me() {
		$this->render("feed/index");
	}

	// AJAX Calls
	public function seguir() {
		$response = new stdclass();
		$response->result = Follow::save($this->post->id);
		Log::add($this->post->id, LOG_TYPE_USER, LOG_FOLLOW);
		die(json_encode($response));
	}

	public function deixar_seguir() {
		$response = new stdclass();
		$response->result = Follow::delete($this->post->id);
		Log::add($this->post->id, LOG_TYPE_USER, LOG_UNFOLLOW);
		die(json_encode($response));
	}

	// AJAX Calls
	public function bloquear() {
		$response = new stdclass();
		$response->result = Block::add($this->post->id);
		Log::add($this->post->id, LOG_TYPE_USER, LOG_BLOCK);
		die(json_encode($response));
	}

	public function desbloquear() {
		$response = new stdclass();
		$response->result = Block::remove($this->post->id);
		Log::add($this->post->id, LOG_TYPE_USER, LOG_UNBLOCK);
		die(json_encode($response));
	}

	public function new_post() {
		$response = new stdclass();
		$response->last_id = Post::add($this->post);
		$response->result = $response->last_id > 0;
		Log::add($response->last_id, LOG_TYPE_USER, LOG_POST);
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
		Log::add($this->post->user_id, LOG_TYPE_USER, LOG_RECOMMEND_USER);
		die(json_encode($response));
	}

	public function update_bio() {
		$response = new stdclass();
		$response->result = Profile::updateBio($this->post);
		die(json_encode($response));
	}
}