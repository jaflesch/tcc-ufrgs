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
}