<?php
class Search {
	
	public static function store($value) {
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
				SELECT id, title, 'job' AS category, '' AS login
				FROM job 
				WHERE active = 1 AND (title LIKE '%{$value}%' OR resume LIKE '%{$value}%' OR text LIKE '%{$value}%')
			)
			UNION
			(
				SELECT id, name AS title, 'user' AS category, login
				FROM user
				WHERE active = 1 AND (name LIKE '%{$value}%' OR login LIKE '%{$value}%')
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
			SELECT id, title, 'job' AS category, '' AS login
			FROM job 
			WHERE active = 1 AND (title LIKE '%{$value}%' OR resume LIKE '%{$value}%' OR text LIKE '%{$value}%')
			ORDER BY title
		", true);
	}

	public static function getUserFromValue($value) {
		$db = new DBConn();

		return $db->query("
			SELECT id, name AS title, 'user' AS category, login
			FROM user
			WHERE active = 1 AND (name LIKE '%{$value}%' OR login LIKE '%{$value}%')
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