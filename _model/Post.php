<?php
class Post {
	
	public static function getAllFeed($id_user) {
		$db = new DBConn();
		
		$followers = Follow::getAllFollowing($id_user);
		foreach ($followers['data'] as $f) {
			$id_list[] = $f->id;
		}
		$followers = implode(",", $id_list);
		
		$posts = $db->query("
			SELECT p.*, u.name author, u.login author_login, uj.title user_job_title, ue.title user_education_title, COUNT(pl.id) likes
			FROM post p 
			INNER JOIN user u ON u.id = p.id_author
			LEFT JOIN user_job uj ON uj.id_user = u.id AND uj.selected = 1
			LEFT JOIN user_education ue ON ue.id_user = u.id AND ue.selected = 1
			LEFT JOIN post_like pl ON pl.id_post = p.id AND pl.active = 1
			WHERE 
				(p.id_author IN ({$followers}) AND p.privacy = 0) OR 
				(p.id_author = {$id_user}) AND p.active = 1
			GROUP BY p.id
			ORDER BY p.datetime_published DESC, pl.datetime DESC
		");

		foreach ($posts as &$p) {
			// $time = explode(" ", $p->datetime_published);
			$diff = abs(strtotime($p->datetime_published) - strtotime(date('Y-m-d H:i:s')));
			
			// more than a year
			if( $diff >= 31536000 ) {
				$temp = explode(" ", $p->datetime_published);
				$temp = explode("-", $temp[0]);

				$date_diff = $temp[0];
			}
			// less than a year, more than weeks
			else if( $diff >= 2628000 ) {
				$temp = floor(($diff)/2628000);
				$date_diff = "Há ". $temp. ($temp > 1 ? " meses" : "mês");
			}
			// less than a month, more than hours
			else if( $diff >= 86400 ) {
				$temp = floor(($diff)/86400);
				$date_diff = "Há ". $temp. ($temp > 1 ? " dias" : "dia");
			}
			// less than days, more than minutes
			else if( $diff >= 3600 ) {
				$temp = floor(($diff)/3600);
				$date_diff = $temp."h";	
			}
			// less than hours, more than seconds
			else if ( $diff >= 60) {
				$temp = floor(($diff)/60);
				$date_diff = $temp."min";
			}
			// timestamp in seconds
			else {
				$date_diff = "Agora mesmo";
			}

			$p->date_diff = $date_diff;
			
			$p->likes_list = $db->query("
				SELECT u.name, u.login, u.id
				FROM user u
				LEFT JOIN post_like pl ON pl.id_user = u.id
				WHERE pl.id_post = {$p->id} AND pl.active = 1
				ORDER BY pl.datetime DESC
			", true);
			
			$p->i_liked = false;
			if(is_array($p->likes_list)) {
				foreach ($p->likes_list as $l) {
					if($l->id == Auth::id()) {
						$p->i_liked = true;
						break;
					}
				}				
			}
		}
		
		return $posts;
	}
}