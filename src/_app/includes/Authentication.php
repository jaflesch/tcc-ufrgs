<?php
class Auth {
	public static function getUser() {
		@session_start();

		$id = self::id();

		$db = new DBConn();
		$r = $db->query("
			SELECT u.*, uj.title job_title, ue.title education_title
			FROM user u
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE u.active = 1 AND u.id = {$id}
		");
		$user = new User($r);
		self::setUser($user);
		return $_SESSION[SESSION_NAME]['user'];
	}

	public static function setUser($user) {
		@session_start();
		$_SESSION[SESSION_NAME]['user'] = $user;
	}
	
	public static function id() {
		@session_start();
		return isset($_SESSION[SESSION_NAME]['user']) ? $_SESSION[SESSION_NAME]['user']->getId() : NULL;
	}

	public static function user() {
		@session_start();
		return isset($_SESSION[SESSION_NAME]['user']);
	}

	public static function logout() {
		@session_start();
		unset($_SESSION[SESSION_NAME]);
		session_destroy();
	}

	public static function generateHash($string) {
		return hash('sha512', $string);
	}
}
?>