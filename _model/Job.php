<?php
class Job {
	/*
		type (int): 
			0	- monitoria
			1	- bolsa ads
			2	- bolsa ic
			3	- estágio
			4 	- trainee
			5 	- clt
	*/

	public static function getAllFeedRelated() {
		$db = new DBConn();
		
		return $db->query("
			SELECT *
			FROM job 
			WHERE active = 1 
			ORDER BY date_start, title
			LIMIT 3
		");		
	}
}