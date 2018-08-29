<?php
class Auth {
	public static function getUser() {
		@session_start();
		return $_SESSION[SESSION_NAME]['user'];
	}

	public static function setUser($user) {
		@session_start();
		$_SESSION[SESSION_NAME]['user'] = $user;
	}
	
	public static function id() {
		@session_start();
		return $_SESSION[SESSION_NAME]['user']->id;
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