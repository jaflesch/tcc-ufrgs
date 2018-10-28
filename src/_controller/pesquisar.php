<?php
require MODEL_PATH.'Search.php';

class Pesquisar extends Controller {
	public function index() {
		$value = $this->get->search;
		$area = isset($this->get->area) ? $this->get->area : "";

		Search::store($value);

		// Prepare bag
		if($area == "usuario") {
			$bag['search'] = Search::getUserFromValue($value);
		}
		else if($area == "vaga") {
			$bag['search'] = Search::getJobFromValue($value);
		}
		else {
			$bag['search'] = Search::getAllFromValue($value);	
		}		
		$bag['related_searchs'] = Search::getRelated();
		
		$this->render("pesquisar/index", $bag);
	}
}