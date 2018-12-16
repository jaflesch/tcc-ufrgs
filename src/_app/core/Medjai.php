<?php
abstract class Medjai {
	protected $app;
	protected $dbConn;
	protected $get;
	protected $post;
	protected $controller;
	protected $action;
	protected $cms_path;
	protected $path;
	protected $base_path;
	protected $url;
	protected $request_uri;
	protected $route;
	protected $metadata;

	public function __construct($app) {
		$this->init_session();

		$this->base_path 	= BASE_PATH;
		$this->controller 	= $app->controller;
		$this->action 		= $app->action;
		$this->url 			= $app->url;
		$this->route 		= $app->route;
		$this->get 			= $app->get;
		$this->post 		= $app->post;
		$this->request_uri 	= $app->request_uri;
		$this->base_url 	= $app->base_url;
		$this->path 		= $app->path;
		$this->metadata 	= $this->initMetatags();
		$this->dbConn 		= new DBConn();
	}

	private function init_session() {
		/**
		 * @param: (void)
		 * @return: (array)
		 * ---
		 * Salva e atualiza valores inexistentes da variável $_SESSION para correta utilização nas requisições internas das páginas
		 *
		 */
		session_name(SESSION_NAME);
		@session_start();

		// Filter SESSION
		if (!isset($_SESSION['user_agent'])) {
			$_SESSION['user_agent'] = isset($_SERVER['HTTP_USER_AGENT']) ? $_SERVER['HTTP_USER_AGENT'] : '';
		} 
		else {
			if (!isset($_SERVER['HTTP_USER_AGENT']) || $_SESSION['user_agent'] !== $_SERVER['HTTP_USER_AGENT']) {
				session_destroy();
				$_SESSION = array();				
			}
		}

		// Set Language
		if (!isset($_SESSION['lang'])) {
			$_SESSION['lang'] = DEFAULT_LANG;
		}

		return true;
	}

	private function initMetatags() {
		/**
		 * @param: (void)
		 * @return: (array)
		 * ---
		 * Retorna um array de valores referentes aos campos de metatags presentes no <head></head> das páginas
		 *
		 */

		return array(
			"app" => META_APP,
			"keywords" => META_KEYWORDS,
			"description" => META_DESCRIPTION,
			"facebook_id" => META_FACEBOOK_ID
		);
	}

	public function redirect($url, $internal = true) {
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

	public function exec() {
		/**
		 * @param: (void)
		 * @return: (void)
		 * ---
		 *
		 * Dada uma URL, executará um método de acordo com a solicitação recebida
		 * Se nenhum valor for informado, chamará o método index() da classe instanciada
		 *
		 */
		if ($this->action =='') $app->action = $app->default_action;		

		$action = str_replace("-", "_", $this->action);
		if (!method_exists(get_called_class(), $action)) $action = DEFAULT_ACTION;

		static::$action();
	}

	public function render($tpl = "index.html", $vars = array(), $echo = true) {
		/**
		 * @param[1]: (string)
		 * @param[2]: (array) [opcional]
		 * @param[3]: (bool) [opcional]
		 * @return: (mixed)
		 * ---
		 * Recebe um caminho relativo para o template do Twig (raiz é "/_view/"), uma coleção de valores (opcional) e um booleano que indica se  o conteúdo será ecoado na tela ou retornado
		 *
		 * Retorna uma instância do Twig se $echo = FALSE ou uma string se $echo = TRUE
		 *
		 */

		try {
			$loader = new Twig_Loader_Filesystem(BASE_PATH.VIEW_PATH);
			$twig = new Twig_Environment($loader,array(
				'auto_reload' => true
			));

			$vars['app'] = array(
				"get"		=> $this->get,
				"post"		=> $this->post,
				"action" 	=> $this->action,
				"cms_path" 	=> $this->controller,
				"base_path" => $this->base_path,
				"url" 		=> $this->url,
			);			
			$vars['path'] = $this->path;
			$vars["route"] = $this->route;				
			$vars['metadata'] = $this->metadata;
			
			$output = $twig->render($tpl.".html",$vars);
			
			if(!$echo) return $output;
			
			echo $output;
		}
		catch(Exception $e) {
			try {
				$loader = new Twig_Loader_Filesystem(BASE_PATH.VIEW_PATH);
				$twig = new Twig_Environment($loader,array(
					'auto_reload' => true
				));
				$vars['error_log'] = array(
					"message" => $e->getMessage()
				);
				echo $output = $twig->render("_misc/error-log.html",$vars);
			}
			catch(Exception $e) {
				debug($e->getMessage());
			}
		}
	}

	public function getDB() {
		/**
		 * @param: (void)
		 * @return: (MySQLi object)
		 * ---
		 * Retorna uma instância do objeto MySQLi
		 *
		 */

		return $this->dbConn;
	}

	public function post($filter = true) {
		/**
		 * @param: (bool) [opcional]
		 * @return: (object)
		 * ---
		 * Aplica um filtro XSS na variável $_POST se $filter = true
		 * Caso contrário, apenas retorna $_POST
		 *
		 * Retorna objeto $_POST
		 *
		 */

		$data = ($filter)? xssFilter(static::$app->post) : static::$app->post;
		return (object)$data;
	}

	public function output($json) {
		/**
		 * @param: (object)
		 * @return: (void)
		 * ---
		 * Exibe na tela um conteúdo JSON passado como parâmetro
		 *
		 */

		header("Content-type: application/json");
		echo json_encode($json, JSON_FORCE_OBJECT);
	}
}