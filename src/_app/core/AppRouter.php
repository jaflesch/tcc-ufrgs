<?php
class AppRouter {
	private $url;
	private $post;
	private $get;
	private $controller;
	private $controller_path;
	private $model_path;
	private $action;
	private $base_url;
	private $request_uri;
	private $route;
	private $path;

	public function __construct($url) {
		$this->url = $url;
		$this->post = (object)$_POST;
		$this->get = (object)$_GET;
		$this->request_uri = $_SERVER['REQUEST_URI'];
		$this->base_url = $this->initBaseUrl();
		$this->path = $this->initTwigPaths();
		$this->route = explode('/', $this->url);
		$this->controller = $this->route[CONTROLLER_INDEX];
		$this->model = $this->route[CONTROLLER_INDEX];

		if ($this->controller == '') $this->controller = DEFAULT_CONTROLLER;
		
		$this->controller_path = CONTROLLER_PATH.$this->controller.".php";
		$this->model_path = MODEL_PATH.$this->model.'.php';
	}

	public function loadController() {
		/**
		 * @param: (void)
		 * @return: (void)
		 * ---
		 * Checa se um usuário está logado no sistema;
		 * Se não está, redireciona ele para página de login
		 *
		 * Se está, checa se acessou uma página válida
		 * 	Se a página é válida, instancia o controlador da página solicitada
		 *	Se não é válida, instancia o controlador Error404
		 *
		 */

		// no SESSION found
		if(!Auth::user()) {
			if($this->controller != "login") {
				// Force redirect to login page
				$this->redirect("login");				
			}
			else {
				// Now, user can do only Login controller actions
				$this->userNotLoggedHandler();
			}
		}
		// User already Logged in
		else {
			// Controller not found
			if(!file_exists($this->controller_path)) {
				$this->missingFileHandler();
			}
			else {
				// Controller found
				require ($this->controller_path);			
				if(file_exists($this->model_path)) require $this->model_path;
				$this->action = isset($this->route[ACTION_INDEX]) ? $this->route[ACTION_INDEX] : DEFAULT_ACTION;
				
				// Translate URL path into Controller class and execute action
				$Class = $this->normalizeController();
				$Class = new $Class($this->getAppVars());			
				$Class->exec();
			}
		}
	}

	private function getAppVars() {
		/**
		 * @param: (void)
		 * @return: (object)
		 * ---
		 * Cria uma instancia genérica de classe
		 * Copia todos os valores existentes na classe AppRouter e retorna esses valores
		 *
		 */

		$app = new stdclass();
		$app->url = $this->url;
		$app->post = $this->post;
		$app->get = $this->get;
		$app->controller_path = $this->controller_path;
		$app->controller = $this->controller;
		$app->action = $this->action;
		$app->base_url = $this->base_url;
		$app->request_uri = $this->request_uri;
		$app->route = $this->route;
		$app->path = $this->path;
		
		return $app;
	}

	private function missingFileHandler() {
		/**
		 * @param: (void)
		 * @return: (bool)
		 * ---
		 * Instancia o controlador Error404 para lidar com requisições de páginas não existentes no servidor
		 *
		 */

		$this->controller_path = CONTROLLER_PATH."404.php";
		$this->controller = "Error404";
		$this->action = "index";

		require ($this->controller_path);
		$class = "Error404";
		
		$c = new Error404($this->getAppVars());
		$c->exec();

		return true;
	}

	private function userNotLoggedHandler() {
		/**
		 * @param: (void)
		 * @return: (bool)
		 * ---
		 * Instancia o controlador Login
		 *
		 */
		$this->controller_path = CONTROLLER_PATH."login.php";
		$this->controller = "Login";
		$this->action =isset($this->route[ACTION_INDEX]) ? $this->route[ACTION_INDEX] : DEFAULT_ACTION;

		require ($this->controller_path);
		$c = new Login($this->getAppVars());
		$c->exec();

		return true;
	}

	private function initBaseUrl() {
		/**
		 * @param: (void)
		 * @return: (string)
		 * ---
		 * Testa se a página foi carregada por um servidor com requisição HTTP ou HTTPS
		 *	Se positivo, monta URL com http:// ou https://
		 *	Se negativo, assume localhost
		 *
		 * Retorna a URL de origem da requisição
		 *
		 */

		if (isset($_SERVER['HTTP_HOST'])) {
			$base_url = isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off' ? 'https' : 'http';
			$base_url .= '://' . $_SERVER['HTTP_HOST'];
			$base_url .= str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']);
		} 
		else $base_url = 'http://localhost/';

		return $base_url;
	}

	private function initTwigPaths() {
		/**
		 * @param: (void)
		 * @return: (array)
		 * ---
		 * Retorna um array de caminhos relativos / atalhos para serem utilizados no Twig
		 *
		 */

		$root = substr($this->base_url, 0, -1);

		return array(
			"root" 	=> $root,
			"css" 	=> $root.'/assets/css',
			"js" 	=> $root.'/assets/js',
			"img" 	=> $root.'/assets/img',
			"font" 	=> $root.'/assets/font'
		);
	}

	private function normalizeController() {
		/**
		 * @param: (void)
		 * @return: (string)
		 * ---
		 * Normaliza o nome de um controlador para ser instanciado dinamicamente. 
		 * Padrão CamelCase.
		 *
		 * Retorna o nome do controlador normalizado
		 *
		 */

		$controller = "";
		$pieces = explode("-", $this->controller);
		foreach ($pieces as $p) {
			$controller .= ucfirst($p);
		}
		
		return $controller;
	}

	private function redirect($url, $internal = true) {
		/**
		 * @param[1]: (string)
		 * @param[2]: (bool) [opcional]
		 * @return: (void)
		 * ---
		 * Recebe uma URL e uma flag para dizer se é caminho relativo (valor default) ou absoluto
		 * Redireciona para a página especificada
		 *
		 */

		if (isset($_SERVER['HTTP_HOST'])) {
			$base_url = isset($_SERVER['HTTPS']) && strtolower($_SERVER['HTTPS']) !== 'off' ? 'https' : 'http';
			$base_url .= '://' . $_SERVER['HTTP_HOST'];
			$base_url .= str_replace(basename($_SERVER['SCRIPT_NAME']), '', $_SERVER['SCRIPT_NAME']);
		} 
		else {
			$base_url = 'http://localhost/';
		}

		if($internal) {
			header("Location: {$base_url}{$url}");
			exit(0);			
		}
		else {
			header("Location: {$url}");
			exit(0);				
		}
	}
}