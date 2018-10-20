<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Follow.php';
require MODEL_PATH.'Post.php';

class Home extends Controller {
	public function index() {
		$bag['jobs'] = Job::getAllFeedRelated()['jobs'];
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());
		$bag['posts'] = Post::getAllFeed(Auth::id());

		$this->render("home/index", $bag);
	}

	// AJAX Calls
	public function like() {
		$response = new stdclass();
		$response->result = Post::like($this->post->id);
		die(json_encode($response));
	}

	public function unlike() {
		$response = new stdclass();
		$response->result = Post::unlike($this->post->id);
		die(json_encode($response));
	}

	public function new_comment() {
		$response = new stdclass();
		$response->result = Comment::add($this->post);
		die(json_encode($response));
	}

	public function delete_comment() {
		$response = new stdclass();
		$response->result = Comment::remove($this->post->delete_comment_id);
		die(json_encode($response));
	}
}