<?php
class Login extends Controller {

	public function index() {
		Auth::user()? $this->redirect("home") : $this->render("login/index");
	}
	
	public function submit_form() {
		$db = new DBConn();

		$password = Auth::generateHash($this->post->password);
		
		$r = $db->query("
			SELECT *
			FROM user 
			WHERE BINARY login = '{$this->post->login}' AND BINARY password = '{$password}'
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