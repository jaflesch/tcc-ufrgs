<?php
class Job {
	const MONITORIA = 0;
	const BOLSA_ADS = 1;
	const BOLSA_IC = 2;
	const ESTAGIO = 3;
	const TRAINEE = 4;
	const EFETIVO = 5;
	const VOLUNTARIO = 6;
	const PRESENCIAL = 0;
	const DISTANCIA = 1;
	
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
			ORDER BY j.date_start, title
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
					$result = $db->query("SELECT id, title FROM job_category WHERE id IN ({$d->category_list}) AND active = 1");
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