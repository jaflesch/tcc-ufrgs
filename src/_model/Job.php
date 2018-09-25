<?php
class Job {
	// Types
	const MONITORIA = 0;
	const BOLSA_ADS = 1;
	const BOLSA_IC = 2;
	const ESTAGIO = 3;
	const TRAINEE = 4;
	const EFETIVO = 5;
	const VOLUNTARIO = 6;

	// Modalities
	const PRESENCIAL = 0;
	const DISTANCIA = 1;

	// Shifts
	const MANHA = 1;
	const TARDE = 2;
	const NOITE = 3;
	
	public static function getAll() {
		$db = new DBConn();
		$id_user = Auth::id();

		$result = $db->query("
			SELECT j.*, f.id favorite_id 
			FROM job j
			LEFT JOIN 
				favorite f ON j.id = f.id_object AND
				f.type = 1 AND
				f.active = 1 AND
				f.id_user = {$id_user}
			WHERE j.active = 1
			ORDER BY j.date_start, f.datetime DESC, title
		", true);

		$result = self::formatData($result);
		$filter = self::getFilters($result);

		return array(
			"jobs" => $result,
			"filters" => $filter
		);
	}

	public static function getAllFavorites() {
		$db = new DBConn();
		$id_user = Auth::id();

		$result = $db->query("
			SELECT j.*, f.id favorite_id 
			FROM job j
			INNER JOIN 
				favorite f ON j.id = f.id_object AND
				f.type = 1 AND
				f.active = 1 AND
				f.id_user = {$id_user}
			WHERE j.active = 1
			ORDER BY j.date_start, f.datetime DESC, title
		", true);

		return $result !== NULL ? self::formatData($result) : NULL;
	}

	public static function getById($id) {
		$db = new DBConn();

		$jobs = $db->query("
			SELECT * 
			FROM job
			WHERE active = 1 AND id = {$id}
		");

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
	private static function formatData($mixed) {
		$db = new DBConn();

		if(is_array($mixed)) {
			foreach ($mixed as $d) {
				$d->slug = self::setSlug($d->title);
				$d->is_favorite = self::checkIfFavorite($d->favorite_id);

				if($d->category_list != "") {
					$result = $db->query("SELECT id, title FROM job_category WHERE id IN ({$d->category_list}) AND active = 1", true);
					$d->category_list_array = $result;
					$d->skill_array = explode(",", $d->skills);
					$d->type_string = self::getType($d->type);
					$d->modality_string = self::getModality($d->modality);
				}
			}
		}
		else {
			$mixed->slug = self::setSlug($mixed->title);

			if($mixed->category_list != "") {
				$result = $db->query("SELECT id, title FROM job_category WHERE id IN ({$mixed->category_list}) AND active = 1", true);
				$mixed->category_list_array = $result;
				$mixed->skill_array = explode(",", $mixed->skills);
				$mixed->type_string = self::getType($mixed->type);
				$mixed->modality_string = self::getModality($mixed->modality);
			}
		}			

		return $mixed;
	}

	private static function getFilters($jobs) {
		$prae = array();
		$salary = array();
		$workload = array();
		$shift = array();

		foreach ($jobs as $job) {
			$type[] = $job->type;
			$salary[] = $job->salary;
			$workload[] = $job->workload;
			$shift[] = $job->shift;

			$list = explode(",", $job->category_list);
			foreach ($list as $l) {
				$category[] = $l;
			}
		}
		
		// Categories found array
		$category_list = implode(",", array_unique($category));
		$db = new DBConn();
		$category = $db->query("SELECT id, title FROM job_category WHERE id IN ({$category_list}) AND active = 1", true);

		// Job types found array
		$type = array_unique($type);
		foreach ($type as $t) {
			$unique_type[] = array(
				"value" => $t,
				"label" => self::getType($t)
			);
		}
		// Job shifts found array
		sort($shift);
		$shift = array_unique($shift);
		foreach ($shift as $s) {
			$unique_shift[] = array(
				"value" => $s,
				"label" => self::getShift($s)
			);
		}
		// Min / max salaries found
		$salary_min = min($salary).",00";
		$salary_max = max($salary).",00";

		$workload = array_unique($workload);

		return array(
			"type" => $unique_type,
			"salary_min" => $salary_min,
			"salary_max" => $salary_max,
			"workload" => $workload,
			"category" => $category,
			"shift" => $unique_shift,
		);
		// debug($salary);
	}

	private static function setSlug($string) {
		return linkfy(strtolower(trim($string)));
	}

	private static function getModality($int) {
		switch ($int) {
			case self::PRESENCIAL: 	return "Presencial";
			case self::DISTANCIA: 	return "À distância";
			default: return "Indefinido";
		}
	}

	private static function getShift($int) {
		switch ($int) {
			case self::MANHA: 	return "Manhã";
			case self::TARDE: 	return "Tarde";
			case self::NOITE: 	return "Noite";
			default: return "Indefinido";
		}
	}

	private static function getType($int) {
		switch ($int) {
			case self::MONITORIA: 	return "Monitoria";
			case self::BOLSA_ADS: 	return "Bolsa Administrativa";
			case self::BOLSA_IC: 	return "Bolsa Iniciação Científica";
			case self::ESTAGIO: 	return "Estágio";
			case self::TRAINEE: 	return "Trainee";
			case self::EFETIVO: 	return "Efetivo";
			case self::VOLUNTARIO: 	return "Voluntário";
		}
	}

	private static function checkIfFavorite($id) {
		return $id !== NULL;
	}
}