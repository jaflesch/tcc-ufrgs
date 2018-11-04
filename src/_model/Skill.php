<?php
class Skill {
	const INICIANTE = 1;
	const AMADOR 	= 2;
	const JUNIOR 	= 3;
	const PLENO 	= 4;
	const SENIOR 	= 5;

	public static function getString($int) {
		switch($int) {
			case Skill::INICIANTE: 	return "Iniciante";
			case Skill::AMADOR: 	return "Amador";
			case Skill::JUNIOR: 	return "Júnior";
			case Skill::PLENO: 		return "Pleno";
			case Skill::SENIOR: 	return "Sênior";
			
			default:				return "Indefinido";
		}
	}

	public static function add($data) {
		$db = new DBConn();
		$id_user = Auth:: id();

		$data = $db->insert(
			"INSERT INTO user_skill (id_user, title, level, time)
			VALUES(
				{$id_user},
				'{$data->title}',
				'{$data->level}',
				'{$data->time}'
			)
		");	

		return $db->last_id();
	}

	public static function update($data) {
		$db = new DBConn();
		$id_user = Auth:: id();

		return $db->update(
			"
			UPDATE user_skill
			SET 
				title = '{$data->title}',
				level = {$data->level},
				time = {$data->time}
			WHERE id_user = {$id_user} AND id = {$data->content_id}
		");	
	}

	public static function remove($id_skill) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->update(
			"UPDATE user_skill
			SET active = 0 
			WHERE id_user = {$id_user} AND id = {$id_skill} AND active = 1
		");	
	}
}