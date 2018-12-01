<?php
class Search {
	
	public static function store($value) {
		if($value == "") return TRUE;
		
		$db = new DBConn();		

		$r = $db->query("SELECT id FROM search WHERE text = '{$value}'");

		if($r == NULL) {
			return $db->insert("INSERT INTO search (text) VALUES ('{$value}')");
		}
		else {
			return $db->update("
				UPDATE search 
				SET
					datetime_last_search = NOW(),
					total = total + 1
				WHERE text = '{$value}'
			");
		}
	}

	public static function getAllFromValue($value) {
		$db = new DBConn();
		$value = utf8_decode($value);

		$result = $db->query("
			(
				SELECT 
					id, title, 'job' AS category, '' AS login, '' AS avatar, 
					location AS subtitle1, 
					location_city AS subtitle2, 
					location_state AS subtitle3,
					'' AS subtitle4, '' AS subtitle5, '' AS subtitle6
				FROM job
				WHERE active = 1 AND (title LIKE '%{$value}%' OR resume LIKE '%{$value}%' OR text LIKE '%{$value}%')
			)
			UNION
			(
				SELECT 
					u.id, u.name AS title, 'user' AS category, u.login, u.avatar,
					uj.title AS subtitle1, 
					uj.company AS subtitle2,
					ue.title AS subtitle3, 
					ue.subtitle AS subtitle4,
					u.live_in_city AS subtitle5, u.live_in_state AS subtitle6
				FROM user u
				LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1 AND uj.active = 1
				LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1 AND ue.active = 1
				WHERE u.active = 1 AND (u.name LIKE '%{$value}%' OR u.login LIKE '%{$value}%')
			)
			ORDER BY title
		", true);

		if(is_array($result)) {
			foreach ($result as &$r) {
				if($r->category == "job") {
					$r->slug = linkfy(trim($r->title));
				}
			}			
		}

		return $result;
	}

	public static function getJobFromValue($value) {
		$db = new DBConn();

		return $db->query("
			SELECT 
				id, title, 'job' AS category, '' AS login,
				location AS subtitle1, 
				location_city AS subtitle2, 
				location_state AS subtitle3,
				'' AS subtitle4, '' AS subtitle5, '' AS subtitle6
			FROM job 
			WHERE active = 1 AND (title LIKE '%{$value}%' OR resume LIKE '%{$value}%' OR text LIKE '%{$value}%')
			ORDER BY title
		", true);
	}

	public static function getUserFromValue($value) {
		$db = new DBConn();

		return $db->query("
			SELECT 
				u.id, u.name AS title, 'user' AS category, u.login, u.avatar,
				uj.title AS subtitle1, 
				uj.company AS subtitle2,
				ue.title AS subtitle3, 
				ue.subtitle AS subtitle4,
				u.live_in_city AS subtitle5, u.live_in_state AS subtitle6
			FROM user u
			LEFT JOIN user_job uj ON u.id = uj.id_user AND uj.selected = 1 AND uj.active = 1
			LEFT JOIN user_education ue ON u.id = ue.id_user AND ue.selected = 1 AND ue.active = 1
			WHERE u.active = 1 AND (u.name LIKE '%{$value}%' OR u.login LIKE '%{$value}%')
			ORDER BY u.name
		", true);
	}

	public static function getAllUsers() {
		$db = new DBConn();

		return $db->query("
			SELECT id, name AS title, 'user' AS category, login
			FROM user
			WHERE active = 1
			ORDER BY name
		", true);
	}

	public static function getRelated() {
		$db = new DBConn();

		return $db->query("
			SELECT text 
			FROM search 
			ORDER BY total DESC, datetime_last_search DESC
			LIMIT 10
		");
	}
}