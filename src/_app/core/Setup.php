<?php
file_exists("config.php") ? require 'config.php' : NULL;

class Setup {
	public static function start() {
		/**
		 * @param: (void)
		 * @return: (void)
		 * ---
		 * Inicializa o sistema de acordo com as configurações presentes no arquivo config.php
		 * Instancia a classe AppRouter para cuidar do roteamento, dada a URL requisitada
		 *
		 */
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
		/**
		 * @param: (void)
		 * @return: (string)
		 * ---
		 * Instala os arquivos iniciais do sistema para posterior configuração.
		 * Arquivo config.php está localizado na raiz do sistema
		 *
		 * Retorna uma string solicitando que o usuário recarregue a página
		 *
		 */
		$filename = "_app/install/config-sample.php";
		$string = file_get_contents($filename);
		
		$handle = fopen("config.php", "w+");
		$bytes = fwrite($handle, $string);
		
		echo ($bytes > 0) ? "Config.php file generated. Please restart your application." : "Error creating config.php";
	}
}