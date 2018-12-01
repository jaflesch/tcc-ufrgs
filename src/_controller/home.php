<?php
require MODEL_PATH.'Profile.php';
require MODEL_PATH.'Job.php';
require MODEL_PATH.'Follow.php';
require MODEL_PATH.'Post.php';
require MODEL_PATH.'Log.php';

class Home extends Controller {
	public function index() {
		$bag['jobs'] = array_slice(Job::getAllFeedRelated()['jobs'], 0, 5);
		$bag['profiles'] = Profile::getAllFeedRelated();
		$bag['followers'] = Follow::getAllFollowers(Auth::id());
		$bag['posts'] = Post::getAllFeed(Auth::id());

		$this->render("home/index", $bag);
	}

	// AJAX Calls
	public function like() {
		$response = new stdclass();
		$response->result = Post::like($this->post->id);
		Log::add($this->post->id, LOG_TYPE_USER, LOG_LIKE);

		die(json_encode($response));
	}

	public function unlike() {
		$response = new stdclass();
		$response->result = Post::unlike($this->post->id);
		die(json_encode($response));
	}

	public function get_likes() {
		$response = new stdclass();
		$response->data = Post::getAllUsersLiked($this->post->id_post);
		$response->result = $response->data !== NULL;
		die(json_encode($response));
	}

	public function new_comment() {
		$response = new stdclass();
		$response->last_id = Comment::add($this->post);
		$response->success = $response->last_id > 0;
		Log::add($response->last_id, LOG_TYPE_USER, LOG_COMMENT);

		die(json_encode($response));
	}

	public function delete_comment() {
		$response = new stdclass();
		$response->result = Comment::remove($this->post->delete_comment_id);
		die(json_encode($response));
	}

	public function upload_avatar() {
		$file = (object)$_FILES['file_path'];
		$id = Auth::id();
		$dir = __DIR__."/../public/avatar/{$id}/";
		$size = 1024 * 1024 * 1; // 3Mb
    	$ext = array ('png', 'jpg', 'jpeg');

    	$extensao = explode('.', $file->name);
    	$extensao = strtolower($extensao[count($extensao)-1]);
    	
    	$json = new stdclass();

		if (array_search($extensao, $ext) === false) {
      		$json->success = false;
      		$json->msg = "Por favor, envie arquivos com as seguintes extensões: .png ou .jpeg";
      		die(json_encode($json));
      	}      	
      	if ($size < $file->size) {
      		$json->success = false;
      		$json->msg = "O arquivo enviado é muito grande, envie arquivos de até 1Mb.";
      		die(json_encode($json));
      	}
      	$now = new Datetime();
      	$file_name = base64_encode($now->getTimestamp().$id).".".$extensao;
      	$path_name = $dir.$file_name;
		
		@mkdir($dir);
		if (@move_uploaded_file($file->tmp_name, $path_name)) {
			$this->insertImageDB($file_name, $id);
			$json->success = true;
      		$json->msg = "O arquivo foi enviado com sucesso.";
      		
      		Log::add(Auth::id(), LOG_TYPE_USER, LOG_UPDATE_AVATAR);

      		die(json_encode($json));
		} 
		else {
			$json->success = false;
      		$json->msg = "Não foi possível enviar o arquivo, tente novamente.";
      		die(json_encode($json));
		}
	}

	public function update_post() {
		$response = new stdclass();
		$response->result = Post::update($this->post);
		die(json_encode($response));
	}
	// Helpers
	private function insertImageDB($path, $id) {
		$db = new DBConn();
		
		return $db->update("
			UPDATE user 
			SET avatar = '{$path}' 
			WHERE id = {$id} AND active = 1
		");
	}
}