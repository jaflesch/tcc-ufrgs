<?php
class Block {
	public static function getAllBlockedUsersFromMyList() {
		$db = new DBConn();
		$blocker_user_id = Auth::id();

		// Check if it's already following
		return $db->query("
			SELECT u.id , u.name, u.login, u.gender
			FROM block b 
			INNER JOIN user u ON u.id = b.id_blocked
			WHERE u.active = 1 and b.active = 1 AND b.id_blocker = {$blocker_user_id}
			ORDER BY datetime_created DESC
		", true);
	}

	public static function isUserInMyBlockedList($login) {
		$db = new DBConn();
		$blocker_user_id = Auth::id();

		// Check if it's already following
		$data = $db->query("
			SELECT u.id
			FROM block b 
			INNER JOIN user u ON u.id = b.id_blocked
			WHERE b.active = 1 AND b.id_blocker = {$blocker_user_id} AND u.login = '{$login}'
		");
		
		return $data != NULL ? true : false;
	}

	public static function add($blocked_user_id) {
		$db = new DBConn();
		$blocker_user_id = Auth::id();

		// Check if it's already following
		$result = $db->query("
			SELECT id 
			FROM block 
			WHERE id_blocker = {$blocker_user_id} AND  id_blocked = {$blocked_user_id} AND active = 1
		");

		if($result == NULL) {
			return $db->insert("
				INSERT INTO block (id_blocker, id_blocked) 
				VALUES ({$blocker_user_id}, {$blocked_user_id})
			");			
		}
	}

	public static function remove($blocked_user_id) {
		$db = new DBConn();
		$blocker_user_id = Auth::id();

		return $db->update("
			UPDATE block 
			SET active = 0 
			WHERE id_blocker = {$blocker_user_id} AND  id_blocked = {$blocked_user_id} AND active = 1
		");
	}
}