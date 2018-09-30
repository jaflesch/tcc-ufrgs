<?php
class Follow {
	public static function getAllFollowers($id_user) {
		$db = new DBConn();
		
		$data = $db->query("
			SELECT u.id, u.name, u.login, f.datetime_created
			FROM follow f 
			LEFT JOIN user u ON u.id = f.id_follower AND f.active = 1
			WHERE f.id_following = {$id_user} AND u.active = 1
		", true);

		return array(
			"data" => $data,
			"total" => $db->rows()
		);
	}

	public static function getAllFollowing($id_follower) {
		$db = new DBConn();

		$data = $db->query("
			SELECT u.id, u.name, u.login, f.datetime_created
			FROM follow f 
			LEFT JOIN user u ON u.id = f.id_following AND f.active = 1
			WHERE f.id_follower = {$id_follower} AND u.active = 1
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
			WHERE id_follower = {$follower_user_id} AND  id_following = {$following_user_id} AND active = 1
		");

		if($result == NULL) {
			return $db->insert("
				INSERT INTO follow (id_follower, id_following) 
				VALUES ({$follower_user_id}, {$following_user_id})
			");			
		}
	}

	public static function delete($following_user_id) {
		$db = new DBConn();
		$follower_user_id = Auth::id();

		return $db->update("
			UPDATE follow 
			SET active = 0 
			WHERE id_follower = {$follower_user_id} AND  id_following = {$following_user_id} AND active = 1
		");
	}
}