<?php
require MODEL_PATH.'Search.php';

class Pesquisar extends Controller {
	public function index() {
		$value = $this->get->search;
		
		$bag['search'] = Search::getAllFromValue($value);
		$bag['related_searchs'] = Search::getRelated();
		
		$this->render("pesquisar/index", $bag);
	}
}