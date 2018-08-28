<?php
file_exists("config.php") ? require 'config.php' : NULL;

class Setup {
	public static function start() {
		try {
			if(DEBUG) {
				ini_set("display_errors", "1");
				error_reporting(E_ALL);
			}
			// Include libs
			require_once(CORE_PATH.'Bootstrap.php');

			//Initiate Template
			Twig_Autoloader::register();

			// Instantiate Router class with requested URL
			$url = isset($_GET['url']) ? trim($_GET['url'], '/'): '';
			$app = new AppRouter($url);
			$app->loadController();
		} 
		catch (Exception $e) {
			if (DEBUG) {
				print_r($e->getMessage());
				print_r($e->getLine());
				print_r($e->getTrace());
			}
		}
	}

	public static function install() {
		$filename = "_app/install/config-sample.php";
		$string = file_get_contents($filename);
		
		$handle = fopen("config.php", "w+");
		$bytes = fwrite($handle, $string);
		
		echo ($bytes > 0) ? "Config.php file generated. Please restart your application." : "Error creating config.php";
	}
}