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
	
	public static function getAll($order = "") {
		$db = new DBConn();
		$id_user = Auth::id();
		$order = $order == "" ? "favorite_id DESC, ja.datetime_created DESC, j.date_start, f.datetime DESC, title" : $order;

		if($order == "_custom_most_rated") {
			$result = $db->query("
				SELECT count(rj.id_job) AS recommend_total, j.*, f.id favorite_id, ja.id apply, ja.id_user apply_user
				FROM job j
				LEFT JOIN recommendation_job rj ON rj.id_job = j.id AND rj.active = 1
				LEFT JOIN 
					favorite f ON j.id = f.id_object AND
					f.type = 1 AND
					f.active = 1 AND
					f.id_user = {$id_user}
				LEFT JOIN job_apply ja ON ja.id_job = j.id AND ja.id_user = {$id_user} AND ja.active = 1
				WHERE j.active = 1
				GROUP BY j.id
				ORDER BY recommend_total DESC
			", TRUE);
		}
		else {
			$result = $db->query("
				SELECT j.*, f.id favorite_id, ja.id apply, ja.id_user apply_user
				FROM job j
				LEFT JOIN 
					favorite f ON j.id = f.id_object AND
					f.type = 1 AND
					f.active = 1 AND
					f.id_user = {$id_user}
				LEFT JOIN job_apply ja ON ja.id_job = j.id AND ja.id_user = {$id_user} AND ja.active = 1
				WHERE j.active = 1
				ORDER BY {$order}
			", TRUE);			
		}		

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
		$id_user = Auth::id();

		$jobs = $db->query("
			SELECT 
				j.*, f.id favorite_id, ja.id apply, ja.id_user apply_user, 
				u.name author_name, u.id author_id, u.login author_login,
				u.born_in_city author_born_in_city, u.born_in_state author_born_in_state, 
				u.live_in_city author_live_in_city, u.live_in_state author_live_in_state,
				uj.title author_job_title, uj.company author_job_company, 
				ue.title author_education_title, ue.subtitle author_education_subtitle
			FROM job j
			INNER JOIN user u ON u.id = j.id_author
			LEFT JOIN 
				favorite f ON j.id = f.id_object AND
				f.type = 1 AND
				f.active = 1 AND
				f.id_user = {$id_user}
			LEFT JOIN job_apply ja ON ja.id_job = j.id AND ja.id_user = {$id_user} AND ja.active = 1
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE j.active = 1 AND j.id = {$id}
		");

		$jobs = self::formatData($jobs);

		return $jobs;
	}

	public static function getRelated($id) {
		$jobs = self::getAll()['jobs'];

		for($i = 0; $i < count($jobs); $i++) {
			if($jobs[$i]->id == $id) unset($jobs[$i]);
		}

		return $jobs;
	}

	public static function getAllAppliedUsersByJobId($job_id) {
		$db = new DBConn();
		
		return $db->query("
			SELECT 
				u.id, u.name, u.login,
				u.born_in_city, u.born_in_state, 
				u.live_in_city, u.live_in_state,
				uj.title job_title, uj.company, 
				ue.title education_title, ue.subtitle,
				ja.accept
			FROM job j
			INNER JOIN job_apply ja ON ja.id_job = j.id AND ja.active = 1
			INNER JOIN user u ON u.id = ja.id_user
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE j.active = 1 AND j.id = {$job_id}
			ORDER BY ja.accept DESC, ja.datetime_created DESC, u.name ASC
		", true);
	}

	public static function getAllFeedRelated() {
		return array_slice(self::getAll(), 0, 3);
	}

	// AJAX calls
	public static function add($data) {
		$db = new DBConn();

		$id_user = Auth:: id();
		$data->date_start = Data::str2date($data->date_start);
		$data->date_finish = Data::str2date($data->date_finish);

		return $db->insert(
			"INSERT INTO user_job (id_user, title, company, resume, date_start, date_finish, location_city, location_state, selected)
			VALUES(
				{$id_user},
				'{$data->title}',
				'{$data->company}',
				'{$data->resume}',
				'{$data->date_start}',
				'{$data->date_finish}',
				'{$data->location_city}',
				'{$data->location_state}',
				0
			)
		");	
	}

	public static function remove($id_job) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->update("
			UPDATE user_job 
			SET active = 0 
			WHERE id_user = {$id_user} AND id = {$id_job} AND active = 1
		");	
	}

	public static function apply($id_job) {
		$db = new DBConn();
		$id_user = Auth::id();

		$r = $db->query("
			SELECT id 
			FROM job_apply 
			WHERE id_user = {$id_user} AND id_job = {$id_job} AND active = 1
		");

		if($r == NULL) {
			return $db->insert("
				INSERT INTO job_apply (id_user, id_job)
				VALUES ({$id_user}, {$id_job})
			");			
		}
		else return false;
	}

	public static function approveApply($data) {
		$db = new DBConn();
		$id_user = Auth::id();

		$r = $db->query("
			SELECT id 
			FROM job_apply 
			WHERE id_user = {$data->candidate_id} AND id_job = {$data->job_id} AND active = 1 AND accept <> 1
		");

		if($r != NULL) {
			return $db->update("
				UPDATE job_apply
				SET accept = 1
				WHERE id_user = {$data->candidate_id} AND id_job = {$data->job_id} AND active = 1 AND accept <> 1
			");			
		}
		else return false;
	}

	public static function reproveApply($data) {
		$db = new DBConn();
		$id_user = Auth::id();

		$r = $db->query("
			SELECT id 
			FROM job_apply 
			WHERE id_user = {$data->candidate_id} AND id_job = {$data->job_id} AND active = 1 AND accept <> -1
		");
		

		if($r != NULL) {
			return $db->update("
				UPDATE job_apply
				SET accept = -1
				WHERE id_user = {$data->candidate_id} AND id_job = {$data->job_id} AND active = 1 AND accept <> -1
			");			
		}
		else return false;
	}

	public static function getInfoByApply($data) {
		$db = new DBConn();
		$id_user = Auth::id();

		$r = $db->query("
			SELECT 
				u1.name author_name, u1.login author_login, u1.email author_email,
				u2.name candidate_name, u2.login candidate_login, u2.email candidate_email,
				j.title, j.id, j.need_curriculum, j.need_historic,
				ja.datetime_created
			FROM job j 
			INNER JOIN job_apply ja ON ja.id_job = j.id 
			INNER JOIN user u1 ON u1.id = j.id_author
			INNER JOIN user u2 ON u2.id = ja.id_user 
			WHERE ja.id_user = {$data->candidate_id} AND j.id = {$data->job_id} AND ja.active = 1 AND accept = 0
		");

		$datetime = explode(" ", $r->datetime_created);
		$r->date = Data::date2str($datetime[0]);
		$r->time = $datetime[1];
		$r->slug = linkfy(trim($r->title));

		return $r;
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
			$mixed->is_favorite = self::checkIfFavorite($mixed->favorite_id);

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