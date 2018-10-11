<?php
class Education {
	// Types
	const MONITORIA = 0;
	const BOLSA_ADS = 1;
	const BOLSA_IC = 2;
	const ESTAGIO = 3;
	const TRAINEE = 4;
	const EFETIVO = 5;
	const VOLUNTARIO = 6;

	public static function add($data) {
		$db = new DBConn();

		$id_user = Auth:: id();
		$data->date_start = Data::str2date($data->date_start);
		$data->date_finish = Data::str2date($data->date_finish);

		return $db->insert(
			"INSERT INTO user_education (id_user, title, subtitle, resume, date_start, date_finish, location_city, location_state, selected)
			VALUES(
				{$id_user},
				'{$data->title}',
				'{$data->subtitle}',
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
		$id_user = Auth:: id();

		return $db->update(
			"UPDATE user_education 
			SET active = 0 
			WHERE id_user = {$id_user} AND id = {$id_job} AND active = 1
		");	
	}
}