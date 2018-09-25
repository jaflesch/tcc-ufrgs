<?php
class Search {
	
	public static function getAllFromValue($value) {
		$db = new DBConn();

		return $db->query("
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
		", true);
	}

	public static function getRelated() {
		return true;
	}
}