<?php
class Install extends Controller {

	public function index() {
		$db = $this->getDB();
		$db->select("val");
		$db->table("test");
		$db->where("val = 'b'");
		debug($db->exec());
		$this->render("install/index");
	}
}