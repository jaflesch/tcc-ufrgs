<?php
require MODEL_PATH.'Skill.php';
require MODEL_PATH.'Language.php';

class Profile {
	public static function getAllFeedRelated() {
		$db = new DBConn();
		$user_id = Auth::id();

		return $db->query("
			SELECT 
				u.name, u.login, u.id, u.born_in_city, u.born_in_state, u.live_in_city, u.live_in_state, u.avatar, u.gender,
				uj.title job_title, 
				ue.title education_title
			FROM user u
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE 
				u.active = 1 AND u.id <> {$user_id} AND 
				u.id NOT IN (
					SELECT f.id_following 
					FROM follow f
					WHERE f.id_follower = {$user_id} AND f.active = 1
				) AND 
				u.id NOT IN (
					SELECT b.id_blocked 
					FROM block b 
					WHERE b.id_blocker = {$user_id} AND b.active = 1
				)
			ORDER BY name
			LIMIT 3
		", true);
	}

	public static function getAllFeedRelatedExceptBy($login) {
		$db = new DBConn();
		$user_id = Auth::id();

		return $db->query("
			SELECT 
				u.name, u.login, u.id, u.born_in_city, u.born_in_state, u.live_in_city, u.live_in_state, u.avatar, u.gender,
				uj.title job_title, 
				ue.title education_title
			FROM user u
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1
			WHERE 
				u.active = 1 AND u.id <> {$user_id} AND 
				u.login <> '{$login}' AND 
				u.id NOT IN (
					SELECT f.id_following 
					FROM follow f
					WHERE f.id_follower = {$user_id} AND f.active = 1
				) AND 
				u.id NOT IN (
					SELECT b.id_blocked 
					FROM block b 
					WHERE b.id_blocker = {$user_id} AND b.active = 1
				)
			ORDER BY name
			LIMIT 10
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

		$langs = $db->query("
			SELECT ul.* 
			FROM user_language ul 
			INNER JOIN user u ON u.id = ul.id_user
			WHERE ul.active = 1 AND u.id = {$user->id}
			ORDER BY level DESC, title
		", true);

		$my_id = Auth::id();
		$follow = $db->query("
			SELECT id 
			FROM follow 
			WHERE id_follower = {$my_id} AND id_following = {$user->id} AND active = 1
		");
		$block = $db->query("
			SELECT id 
			FROM block 
			WHERE id_blocker = {$my_id} AND id_blocked = {$user->id} AND active = 1
		");

		// Format data
		$data = explode(" ", $user->datetime_joined);
		$data = explode("-", $data[0]);
		$user->date_joined = Data::getMonth($data[1])." de ".$data[0];

		if($user->live_in_city != "" && $user->live_in_state != "") {
			$user->live_in_string = $user->live_in_city.", ".$user->live_in_state;
		}

		if($skills !== NULL) {
			foreach ($skills as $skill) {
				$skill->level_string = Skill::getString($skill->level);
			}			
		}
		if($langs !== NULL) {
			foreach ($langs as $lang) {
				$lang->flag = Language::getFlag($lang->title);
				$lang->level_str = Language::getLevelString($lang->level);
			}			
		}

		// Return all
		return array(
			"user" => $user,
			"jobs" => $jobs,
			"educations" => $educations,
			"skills" => $skills,
			"languages" => $langs,
			"follow" => $follow !== NULL ? true : false,
			"block" => $block !== NULL ? true : false
		);
	}

	public static function updateBio($post) {
		$db = new DBConn();
		$id = Auth::id();
		return $db->update("UPDATE user SET short_bio = '{$post->short_bio}' WHERE id = {$id}");
	}
}