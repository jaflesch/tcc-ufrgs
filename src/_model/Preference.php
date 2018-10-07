<?php
class Preference {
	/*
		0 - more private
		1 - more free
	*/
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

	public static function like($id_post) {
		$db = new DBConn();
		$id_user_liked = Auth::id();

		// Check if it's already following
		$result = $db->query("
			SELECT id 
			FROM post_like 
			WHERE id_user = {$id_user_liked} AND  id_post = {$id_post} AND active = 1
		");

		if($result == NULL) {
			return $db->insert("
				INSERT INTO post_like (id_user, id_post) 
				VALUES ({$id_user_liked}, {$id_post})
			");			
		}
	}

	public static function unlike($id_post) {
		$db = new DBConn();
		$id_user_liked = Auth::id();

		return $db->update("
			UPDATE post_like 
			SET active = 0 
			WHERE id_user = {$id_user_liked} AND  id_post = {$id_post} AND active = 1
		");
	}

	public static function add($post) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->insert("
			INSERT INTO post (id_author, text, datetime_published, datetime_last_edit, privacy, allow_comments) 
			VALUES ({$id_user}, '{$post->post_text}', NOW(), NOW(), {$post->privacy}, 1)
		");			
	}

	public static function delete($id) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->update("
			UPDATE post 
			SET 
				active = 0,
				datetime_last_edit = NOW()
			WHERE id = {$id} AND active = 1 AND id_author = {$id_user}
		");			
	}
}