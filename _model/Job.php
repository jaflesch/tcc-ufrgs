<?php
class Job {
	const MONITORIA = 0;
	const BOLSA_ADS = 1;
	const BOLSA_IC = 2;
	const ESTAGIO = 3;
	const TRAINEE = 4;
	const EFETIVO = 5;
	const VOLUNTARIO = 6;
	
	public static function getAll() {
		$db = new DBConn();

		$result = $db->query("
			SELECT * 
			FROM job
			WHERE active = 1
			ORDER BY date_start, title
		", true);

		$result = self::formatData($result);

		return $result;
	}

	public static function getById($id) {
		$db = new DBConn();

		$jobs = $db->query("
			SELECT * 
			FROM job
			WHERE active = 1 AND id = {$id}
		", true);

		$jobs = self::formatData($jobs);

		return $jobs;
	}

	public static function getRelated($id) {
		$jobs = self::getAll();

		for($i = 0; $i < count($jobs); $i++) {
			if($jobs[$i]->id == $id) unset($jobs[$i]);
		}

		return $jobs;
	}

	public static function getAllFeedRelated() {
		return array_slice(self::getAll(), 0, 3);
	}

	// Helper
	private static function formatData($array) {
		$db = new DBConn();

		foreach ($array as $d) {
			$d->slug = self::setSlug($d->title);

			if($d->category_list != "") {
				$result = $db->query("SELECT id, title FROM job_category WHERE id IN ({$d->category_list}) AND active = 1");
				$d->category_list_array = $result;
			}
		}

		return $array;
	}

	private static function setSlug($string) {
		return linkfy(strtolower(trim($string)));
	}
}