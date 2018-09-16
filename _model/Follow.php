<?php
class Follow {
	public static function getAllFollowers($id_user) {
		$db = new DBConn();
		
		$data = $db->query("
			SELECT u.id, u.name, u.login, f.datetime_created
			FROM follow f 
			INNER JOIN user u ON u.id = f.id_follower AND f.active = 1
			WHERE f.id_following = {$id_user} AND u.active = 1
		", true);

		return array(
			"data" => $data,
			"total" => $db->rows()
		);
	}

	public static function save($following_user_id) {
		$db = new DBConn();
		$follower_user_id = Auth::id();

		// Check if it's already following
		$result = $db->query("
			SELECT id 
			FROM follow 
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
			UPDATE follow 
			SET active = 0 
			WHERE id_user = {$id_user} AND id_object = {$id_object} AND type = {$type} AND active = 1
		");
	}
}