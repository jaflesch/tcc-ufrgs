<?php
class RecommendUser {
	public static function getAllFromUserId($id) {
		$db = new DBConn();

		return $db->query("
			SELECT 
				ru.*, 
				u.name user_name, u.login user_login, u.id user_id, 
				u.born_in_city user_born_in_city, u.born_in_state user_born_in_state, 
				u.live_in_city user_live_in_city, u.live_in_state user_live_in_state,
				uj.title user_job_title, 
				ue.title user_education_title
			FROM recommendation_user ru 
			INNER JOIN user u ON u.id = ru.id_user AND u.active = 1
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE ru.id_target = {$id} AND ru.active = 1
			ORDER BY ru.datetime_last_edit DESC
		", true);
	}

	public static function add($post) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->insert("
			INSERT INTO recommendation_user (id_user, id_target, text, datetime_created, datetime_last_edit)
			VALUES ({$id_user}, {$post->user_id}, '{$post->text}', NOW(), NOW())
		");
	}
}