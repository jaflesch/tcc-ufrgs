<?php
class RecommendJob {
	public static function getAll() {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->query("
			SELECT *
			FROM job
			WHERE active = 1
			ORDER BY datetime_last_edit DESC
		", true);
	}

	
}