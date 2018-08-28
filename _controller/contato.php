<?php
class Contato extends Controller {

	public static function index() {
		$bag["contato"] = self::getContato();
		
		self::render("contato/index", $bag);
	}

	public static function update() {
		$dbConn = static::$app->dbConn;
		
		$post = preprocess((object)static::$app->post);		
		$post->zip_code = str_replace("-", "", $post->zip_code);

		$query = "
			UPDATE contact 
			SET 
				address = '{$post->address}',
				number = '{$post->number}',
				tel_number = '{$post->tel_number}',
				cel_number = '{$post->cel_number}',
				city = '{$post->city}',
				state = '{$post->state}',
				zip_code = '{$post->zip_code}',
				facebook = '{$post->facebook}',
				linkedin = '{$post->linkedin}',
				instagram = '{$post->instagram}',
				youtube = '{$post->youtube}',
				twitter = '{$post->twitter}',
				vimeo = '{$post->vimeo}',
				mail_to = '{$post->mail_to}'
		";
		$result = mysqli_query($dbConn, $query) or die(mysqli_error($dbConn));

		$json = new stdclass();
		$json->success = $result;
		$json->msg = ($result === true) ? "Dados de contato editados com sucesso!" : "Erro ao editar dados de contato. Por favor, tente novamente.";

		die(json_encode($json));
	}

	private static function getContato() {
		$dbConn = static::$app->dbConn;
		
		$query = "
			SELECT *
			FROM contact
		";
		$result = mysqli_query($dbConn, $query);
		$fetch = mysqli_fetch_object($result);
		
		return toUTF($fetch);
	}
}