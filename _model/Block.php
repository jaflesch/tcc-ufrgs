<?php
class Block {
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