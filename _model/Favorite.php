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

		// Check if it's already favorited
		$result = $db->query("
			SELECT id 
			FROM favorite 
			WHERE id_user = {$id_user} AND id_object = {$id_object} AND type = {$type} AND active = 1
		");

		if($result == NULL) {
			return $db->insert("
				INSERT INTO favorite (id_user, id_object, type) 
				VALUES ({$id_user}, {$id_object}, {$type})
			");			
		}
	}

	public static function delete($id_object, $type) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->update("
			UPDATE favorite 
			SET active = 0 
			WHERE id_user = {$id_user} AND id_object = {$id_object} AND type = {$type} AND active = 1
		");
	}
}