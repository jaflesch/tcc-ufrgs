<?php
class Conteudos extends Controller {
	public static $MAX_PER_PAGE = 10;

	public static function index() {
		$content = self::getAllContent();
		$bag = array(
			"user" => Auth::getUser(),
			"contents" => $content,
			"total_pages" => (ceil(count($content) / self::$MAX_PER_PAGE)),
			"max_per_page" => self::$MAX_PER_PAGE
		);
			
		self::render("conteudos/index", $bag);
	}

	public static function novo() {
		$bag = array(
				"user" => Auth::getUser()
		);
		self::render("conteudos/novo", $bag);
	}

	public static function editar() {
		$id = (int)static::$app->parametros[2];

			$bag = array(
				"user" => Auth::getUser(),
				"content" => self::getContentById($id)
		);
		self::render("conteudos/editar", $bag);
	}

	public static function imagem() {
		$id = (int)static::$app->parametros[2];

			$bag = array(
				"user" => Auth::getUser(),
				"content" => self::getContentById($id)
		);
		self::render("conteudos/imagem", $bag);
	}

	public static function insert() {
		$dbConn = static::$app->dbConn;
		$post = (object)self::$app->post;
		$date = Data::str2date($post->date);

		$query = "
			INSERT INTO content (title, resume, text, datetime_posted)
			VALUES ('{$post->title}', '{$post->resume}', '{$post->text}', NOW())
		";
		$result = mysqli_query($dbConn, $query);

		$json = new stdclass();
		$json->success = $result;
		$json->msg = ($json->success) ? "Conteúdo adicionado com sucesso!" : "Erro ao adicionar conteúdo";
		$json->location = ($json->success) ? "../conteudos/imagem/".mysqli_insert_id($dbConn) : "../conteudos";

		die(json_encode($json));
	}

	public static function update() {
		$dbConn = static::$app->dbConn;
		$post = (object)self::$app->post;
		$date = Data::str2date($post->date);

		$query = "
			UPDATE content
			SET 
				title = '{$post->title}', 
				resume = '{$post->resume}', 
				text = '{$post->text}'
			WHERE id = {$post->id}
		";
		$result = mysqli_query($dbConn, $query);

		$json = new stdclass();
		$json->success = $result;
		$json->msg = ($json->success) ? "Conteúdo editado com sucesso!" : "Erro ao editar conteúdo.";

		die(json_encode($json));
	}

	public static function delete() {
		$id = (int)static::$app->post['id'];
		
		$dbConn = static::$app->dbConn;
		$leads = array();

		$query = "
			DELETE FROM content
			WHERE id = {$id}
		";
		$result = mysqli_query($dbConn, $query);

		$json = new stdclass();
		$json->success = $result;
		$json->msg = ($json->success) ? "Conteúdo excluído com sucesso!" : "Erro ao excluir conteúdo!";

		die(json_encode($json));
	}

	private static function getAllContent() {
		$dbConn = static::$app->dbConn;
		$content = array();

		$query = "
			SELECT *
			FROM content
			ORDER BY title
		";
		$result = mysqli_query($dbConn, $query);
		while($fetch = mysqli_fetch_object($result)) {
			$content[] = $fetch;
		}

		return toUTF($content);
	}

	private static function getContentById($id) {
		$dbConn = static::$app->dbConn;
		
		$query = "
			SELECT *
			FROM content
			WHERE id = {$id}
		";
		$result = mysqli_query($dbConn, $query);
		if($result && mysqli_num_rows($result) == 1) {
			$fetch = mysqli_fetch_object($result);			
		}
		
		return toUTF($fetch);
	}

	public static function delete_image() {
		$dbConn = static::$app->dbConn;
		$id = (int)static::$app->post['id'];
		
		$query = "UPDATE content SET image = '' WHERE id = {$id}";
		$result = mysqli_query($dbConn, $query);
		$json = new stdclass();
		$json->success = $result;		
		die(json_encode($json));
	}

	public static function upload_image() {
		$file = (object)$_FILES['file_path'];
		$id = (int)static::$app->post['id'];
		$dir = __DIR__."/../../public/conteudos/{$id}/";
		$size = 1024 * 1024 * 3; // 30Mb
    	$ext = array ('png', 'jpg', 'jpeg', 'gif');

    	$extensao = explode('.', $file->name);
    	$extensao = strtolower($extensao[count($extensao)-1]);
    	
    	$json = new stdclass();

		if (array_search($extensao, $ext) === false) {
      		$json->success = false;
      		$json->msg = "Por favor, envie arquivos com as seguintes extensões: .png, .jpeg ou .gif";
      		die(json_encode($json));
      	}      	
      	if ($size < $file->size) {
      		$json->success = false;
      		$json->msg = "O arquivo enviado é muito grande, envie arquivos de até 3Mb.";
      		die(json_encode($json));
      	}
      	$now = new Datetime();
      	$file_name = base64_encode($now->getTimestamp().$id).".".$extensao;
      	$path_name = $dir.$file_name;
		
		@mkdir($dir);
		if (@move_uploaded_file($file->tmp_name, $path_name)) {
			self::insertImageDB($file_name, $id);
			$json->success = true;
      		$json->msg = "O arquivo foi enviado com sucesso.";
      		
      		die(json_encode($json));
		} 
		else {
			$json->success = false;
      		$json->msg = "Não foi possível enviar o arquivo, tente novamente.";
      		die(json_encode($json));
		}
	}

	private static function insertImageDB($path, $id) {
		$dbConn = static::$app->dbConn;
		
		$query = "UPDATE content SET image = '{$path}' WHERE id = {$id}";
		$result = mysqli_query($dbConn, $query);
		
		return ($result === true);
	}
}
Conteudos::exec($app);