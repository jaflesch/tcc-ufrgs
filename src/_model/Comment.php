<?php
class Comment {
	
	public static function getAllFromPost($id_post) {
		$db = new DBConn();
		
		return $db->query("
			SELECT *
			FROM comment 
			WHERE id_post = {$id_post} AND active = 1
			ORDER BY datetime_published ASC
		");
	}

	public static function add($data) {
		$db = new DBConn();
		$id_author = Auth::id();

		return $db->insert("
			INSERT INTO comment (id_author, id_post, text) 
			VALUES ({$id_author}, {$data->id}, '{$data->text}')
		");			
	}
}