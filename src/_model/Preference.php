<?php
class Preference {
	/*
		0 - more private
		1 - more free
	*/

	public static function getGeneral() {
		$db = new DBConn();
		$id = Auth::id();

		return $db->query("
			SELECT 
				name,
				email,
				phone
			FROM user u 
			WHERE id = {$id} AND active = 1
		");
	}

	public static function getPrivacy() {
		$db = new DBConn();
		$id = Auth::id();

		return $db->query("
			SELECT 
				show_schollar_info, 
				show_curriculum,
				follower_privacy,
				following_privacy,
				post_privacy
			FROM user u 
			WHERE id = {$id} AND active = 1
		");
	}
}