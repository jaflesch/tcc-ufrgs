<?php
require 'Comment.php';

class Post {
	
	public static function getAllFeed($id_user) {
		$db = new DBConn();
		
		$followers = Follow::getAllFollowing($id_user);
		
		if(! is_array($followers['data'])) {
			$followers = Auth::id();
		}
		else {
			foreach ($followers['data'] as $f) {
				$id_list[] = $f->id;
			}
			$followers = implode(",", $id_list);			
		}
		
		$posts = $db->query("
			SELECT p.*, u.name author, u.login author_login, uj.title user_job_title, ue.title user_education_title, COUNT(pl.id) likes
			FROM post p 
			INNER JOIN user u ON u.id = p.id_author
			LEFT JOIN user_job uj ON uj.id_user = u.id AND uj.selected = 1
			LEFT JOIN user_education ue ON ue.id_user = u.id AND ue.selected = 1
			LEFT JOIN post_like pl ON pl.id_post = p.id AND pl.active = 1
			WHERE 
			(	
				p.id_author IN ({$followers}) AND 
				p.privacy = 0 AND
				u.id NOT IN (
					SELECT b.id_blocked 
					FROM block b 
					WHERE b.id_blocker = {$id_user} AND b.active = 1
				) 
			)
			OR 
			(
				p.id_author = {$id_user} AND
				p.active = 1 AND
				u.id NOT IN (
					SELECT b.id_blocked 
					FROM block b 
					WHERE b.id_blocker = {$id_user} AND b.active = 1
				)
			)
			GROUP BY p.id
			ORDER BY p.datetime_published DESC, pl.datetime DESC
		", true);

		if(is_array($posts)) {
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

				$p->comments = Comment::getAllFromPost($p->id);
				$p->total_comments = count($p->comments);
			}
		}
		else $posts = NULL;

		return $posts;
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

	public static function getAllUsersLiked($id_post) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->query("
			SELECT 
				u.id,
				u.name,
				u.login,
				u.avatar,
				f.id_following is_following,
				pl.id_user like_author
			FROM post_like pl
			INNER JOIN user u ON u.id = pl.id_user AND pl.active = 1
			LEFT JOIN follow f ON f.id_follower = {$id_user} AND u.id = f.id_following AND f.active = 1
			WHERE 
				pl.id_post = {$id_post} AND
				u.id NOT IN (
					SELECT b.id_blocked 
					FROM block b 
					WHERE b.id_blocker = u.id AND b.active = 1
				) 
			GROUP BY u.id
			ORDER BY pl.datetime DESC
		", TRUE);
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