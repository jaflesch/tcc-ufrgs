<?php
require '_lib/Helper/Dictionary.php';

class Dicionario extends Controller {

	public static function index() {
		

		//session_start();
		//$_SESSION['language'] = 'en';
		// print_r($session);

		// BLOCK 0
		// if(isset($_POST)) {
		// 	//print_r($_POST);
		// 	$d->update($_POST['id'], $_POST['word']);
		// 	$d->export('test.dict');
		// }
		
		// BLOCK 1
		// form to append... [OK]
		// echo "<form method='POST'>";
		// 	echo "<input type='text' name='id[]'><br/>";
		// foreach ($langs as $lang) {
		// 	echo "<input type='text' name='word_{$lang}[]'><br/>";
		// }
		// echo "<br><br>";
		// echo "<input type='text' name='id[]'><br/>";
		// foreach ($langs as $lang) {
		// 	echo "<input type='text' name='word_{$lang}[]'><br/>";
		// }
		// echo "<input type='submit'></form>"


		// BLOCK 2 ---
		// echo "<form method='POST'>";
		// 	echo "<input type='text' name='id'><br/>";
		// foreach ($langs as $lang) {
		// 	echo "<input type='text' name='word[]'><br/>";
		// }
		// echo "<input type='submit'></form>";
		
		$d = new Dictionary("assets/lang/test.dict");
		$d->setLanguage('pt_br');
		$langs = $d->getLanguages();
		//$d->debug();

		$bag["dict"] = $d->getDictionary();
		$bag["lang"] = $d->getLanguageText();

		self::render("dicionario/index", $bag);
	}

	public static function novo() {
		$d = new Dictionary("assets/lang/test.dict");
		$bag["languages"] = $d->getLanguages();
		$bag["languages_text"] = $d->getLanguagesText();
		
		self::render("dicionario/novo", $bag);
	}

	public static function editar() {
		$d = new Dictionary("assets/lang/test.dict");
		$bag["languages"] = $d->getLanguages();
		$bag["languages_text"] = $d->getLanguagesText();
		$bag["dict"] = $d->getFullDictionaryFormatted();
		
		self::render("dicionario/editar", $bag);
	}

	public static function visualizar() {
		$id = (int)static::$app->parametros[2];
		$bag ["lead"] = self::getLeadById($id);

		self::render("leads/visualizar", $bag);
	}

	public static function insert() {
		$d = new Dictionary("assets/lang/test.dict");
		$d->append((array)self::post());
		$result = $d->export();

		$json = new stdclass();
		$json->success = $result;
		$json->msg = $result ? "Palavra adicionada com sucesso ao dicionário!" : "Erro ao adicionar palavra.";
		$json->location = "../dicionario";

		self::output($json);
	}
	
	public static function delete() {
		$id = (int)static::$app->post['id'];
		
		$dbConn = static::$app->dbConn;
		$leads = array();

		$query = "
			DELETE FROM lead
			WHERE id = {$id}
		";
		$result = mysqli_query($dbConn, $query);

		$json = new stdclass();
		$json->success = $result;
		$json->msg = ($json->success) ? "Lead excluído com sucesso!" : "Erro ao excluir lead";

		die(json_encode($json));
	}

}