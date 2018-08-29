<?php
class Home extends Controller {
	public function index() {
		$this->render("feed/index");
	}
	public function me() {
		$this->render("feed/index");
	}
}