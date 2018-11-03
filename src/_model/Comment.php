<?php
class Comment {
	
	public static function getAllFromPost($id_post) {
		$db = new DBConn();
		
		return $db->query("
			SELECT c.*, u.name author_name, u.login author_login
			FROM comment c
			INNER JOIN user u ON u.id = c.id_author
			WHERE c.id_post = {$id_post} AND c.active = 1
			ORDER BY c.datetime_published ASC
		", TRUE);
	}

	public static function add($data) {
		$db = new DBConn();
		$id_author = Auth::id();

		$db->insert("
			INSERT INTO comment (id_author, id_post, text) 
			VALUES ({$id_author}, {$data->id}, '{$data->text}')
		");		

		return $db->last_id();	
	}

	public static function remove($id_comment) {
		$db = new DBConn();
		$id_author = Auth::id();
		
		return $db->update("
			UPDATE comment 
			SET active = 0 
			WHERE id_author = {$id_author} AND id = {$id_comment} AND active = 1
		");
	}
}