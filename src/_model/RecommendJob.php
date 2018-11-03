<?php
class RecommendJob {
	public static function getAllFromJobId($id) {
		$db = new DBConn();

		return $db->query("
			SELECT 
				rj.*, 
				u.name user_name, u.login user_login, u.id user_id, u.avatar user_avatar, u.gender user_gender,
				u.born_in_city user_born_in_city, u.born_in_state user_born_in_state, 
				u.live_in_city user_live_in_city, u.live_in_state user_live_in_state,
				uj.title user_job_title, 
				ue.title user_education_title
			FROM recommendation_job rj 
			INNER JOIN user u ON u.id = rj.id_user AND u.active = 1
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE rj.id_job = {$id} AND rj.active = 1
			ORDER BY rj.datetime_last_edit DESC
		", true);
	}

	public static function add($post) {
		$db = new DBConn();
		$id_user = Auth::id();

		$r = $db->query(
			"SELECT id 
			FROM recommendation_job 
			WHERE id_user = {$id_user} AND id_job = {$post->job_id} AND active = 1
		");

		if($r == NULL) {
			return $db->insert("
				INSERT INTO recommendation_job (id_user, id_job, text, datetime_created, datetime_last_edit)
				VALUES ({$id_user}, {$post->job_id}, '{$post->text}', NOW(), NOW())
			");			
		}
		else {
			return $db->insert("
				UPDATE recommendation_job 
				SET 
					text = '{$post->text}',
					datetime_last_edit = NOW()
				WHERE id_user = {$id_user} AND id_job = {$post->job_id} AND active = 1
			");				
		}
	}

	public static function hasRecommend($id_job) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->query("
			SELECT *
			FROM recommendation_job
			WHERE id_user = {$id_user} AND id_job = {$id_job} AND active = 1
		");
	}
}