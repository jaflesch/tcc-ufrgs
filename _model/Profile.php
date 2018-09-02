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
			SELECT u.*, uj.title job_title, ue.title education_title
			FROM user u
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE u.active = 1 AND u.id <> {$user_id}
			ORDER BY name
			LIMIT 3
		", true);		

		debug($data);
	}
}