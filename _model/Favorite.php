<?php
class Favorite {
	/**
	 * Type of favorite for [id_object] field at table
	 */
	const JOB = 1;
	const USER = 2;

	public static function save($id_object, $type) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->insert("
			INSERT INTO favorite (id_user, id_object, type) 
			VALUES ({$id_user}, {$id_object}, {$type})
		");
	}
}