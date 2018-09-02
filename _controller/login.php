<?php
require MODEL_PATH.'Profile.php';

class Login extends Controller {

	public function index() {
		Auth::user()? $this->redirect("home") : $this->render("login/index");
	}
	
	public function submit_form() {
		$db = new DBConn();

		$password = Auth::generateHash($this->post->password);
		
		$r = $db->query("
			SELECT u.*, uj.title job_title, ue.title education_title
			FROM user u
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE u.active = 1 AND BINARY u.login = '{$this->post->login}' AND BINARY u.password = '{$password}'
		");
		
		$json = new stdclass();
		if($r && $db->rows() == 1) {
			unset($r->password);
			$user = new User($r);
			Auth::setUser($user);
			$json->success = true;			
		}
		else {
			$json->success = false;
			$json->msg = "Usuário ou senha inválidos!";
		}

		die(json_encode($json));
	}	

	public function leave() {
		Auth::logout();
		$this->redirect("home");
	} 
}