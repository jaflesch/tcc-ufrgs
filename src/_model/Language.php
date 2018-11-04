<?php
class Language {
	const BASICO = 1;
	const INTERMEDIARIO = 2;
	const AVANCADO = 3;
	const FLUENTE = 4;
	const NATIVO = 5;

	public static function getFlag($language_title) {
		switch($language_title) {
			case 'Português': 	return 'Brazil';
			case 'Inglês': 		return 'United-States';
			case 'Francês': 	return 'France';
			case 'Alemão': 		return 'Germany';
			case 'Espanhol': 	return 'Spain';
			case 'Japonês': 	return 'Japan';
			case 'Chinês': 		return 'China';
			case 'Russo': 		return 'Russia';
			case 'Coreano': 	return 'South-Korea';
			case 'Turco': 		return 'Turkey';
			case 'Polaco': 		return 'Poland';
			case 'Egípcio': 	return 'Egypt';
			case 'Ucraniano': 	return 'Ukraine';
			case 'Holandês': 	return 'Netherlands';
			default:			return "Unknown";
		}
	}

	public static function getLevelString($level) {
		switch ($level) {
			case self::BASICO:			return "Básico";
			case self::INTERMEDIARIO:	return "Intermediário";
			case self::AVANCADO:		return "Avançado";
			case self::FLUENTE:			return "Fluente";
			case self::NATIVO:			return "Nativo";
			default:					return "Indefinido";
		}
	}

	public static function add($data) {
		$db = new DBConn();
		$id_user = Auth:: id();

		$data = $db->insert(
			"INSERT INTO user_language (id_user, title, level)
			VALUES(
				{$id_user},
				'{$data->title}',
				'{$data->level}'
			)
		");	

		return $db->last_id();
	}

	public static function update($data) {
		$db = new DBConn();
		$id_user = Auth:: id();

		return $db->update(
			"
			UPDATE user_language 
			SET 
				title = '{$data->title}',
				level = {$data->level}
			WHERE id_user = {$id_user} AND id = {$data->content_id}
		");	
	}

	public static function remove($id_skill) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->update(
			"UPDATE user_language
			SET active = 0 
			WHERE id_user = {$id_user} AND id = {$id_skill} AND active = 1
		");	
	}
}