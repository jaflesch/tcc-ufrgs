<?php
class Profile {
	/*
		type (int): 
			0	- monitoria
			1	- bolsa ads
			2	- bolsa ic
			3	- estágio
			4 	- trainee
			5 	- clt
	*/

	public static function getAllFeedRelated() {
		$db = new DBConn();
		$user_id = Auth::id();

		return $db->query("
			SELECT 
				u.name, u.id, u.born_in_city, u.born_in_state, u.live_in_city, u.live_in_state,
				uj.title job_title, 
				ue.title education_title
			FROM user u
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE u.active = 1 AND u.id <> {$user_id}
			ORDER BY name
			LIMIT 3
		", true);
	}

	public static function getByLogin($login) {
		$db = new DBConn();
		
		$user = $db->query("
			SELECT *
			FROM user
			WHERE active = 1 AND login = '{$login}'
		");

		$jobs = $db->query("
			SELECT uj.* 
			FROM user_job uj 
			INNER JOIN user u ON u.id = uj.id_user
			WHERE uj.active = 1 AND u.id = {$user->id}
			ORDER BY selected DESC, date_start DESC, title
		", true);

		$educations = $db->query("
			SELECT ue.* 
			FROM user_education ue 
			INNER JOIN user u ON u.id = ue.id_user
			WHERE ue.active = 1 AND u.id = {$user->id}
			ORDER BY selected DESC, date_start DESC, title
		", true);

		$skills = $db->query("
			SELECT us.* 
			FROM user_skill us 
			INNER JOIN user u ON u.id = us.id_user
			WHERE us.active = 1 AND u.id = {$user->id}
			ORDER BY level DESC, time DESC, title
		", true);

		return array(
			"user" => $user,
			"jobs" => $jobs,
			"educations" => $educations,
			"skills" => $skills
		);
	}
}