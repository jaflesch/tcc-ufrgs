<?php
// Tipos
define("LOG_TYPE_USER", 1);
define("LOG_TYPE_JOB", 2);

// Ações
define("LOG_CREATE", 1);
define("LOG_UPDATE", 2);
define("LOG_REMOVE", 3);
define("LOG_FOLLOW", 4);
define("LOG_UNFOLLOW", 5);
define("LOG_BLOCK", 6);
define("LOG_UNBLOCK", 7);
define("LOG_APPLY", 8);
define("LOG_APPLY_ACCEPT", 9);
define("LOG_APPLY_REJECT", 10);
define("LOG_RECOMMEND_USER", 11);
define("LOG_RECOMMEND_JOB", 12);
define("LOG_POST", 13);
define("LOG_FAVORITE", 14);
define("LOG_UNFAVORITE", 15);
define("LOG_COMMENT", 16);
define("LOG_FIRST_LOGIN", 17);
define("LOG_UPDATE_AVATAR", 18);

class Log {
	public static function getAll() {
		$db = new DBConn();
		$id_user = Auth::id();

		$data = $db->query("
			SELECT 
				l.*, 
				j.title job_title, 
				u.name user_name, u.login user_login, u.gender user_gender
			FROM log l
			LEFT JOIN user u ON u.id = l.id_target AND l.type = 1
			LEFT JOIN job j ON j.id = l.id_target AND l.type = 2
			WHERE id_user = {$id_user}
			ORDER BY datetime_created DESC
		", TRUE);

		if(is_array($data)) {
			foreach ($data as &$d) {
				$d->icon = self::getIcon($d->type, $d->action);
				$d->action_str = self::getActionString($d->action);
				$d->job_slug = linkfy(trim($d->job_title));
				$d->data = self::getData($d->datetime_created);
			}		
		}
		$data[] = self::getFirstLogin();
		
		return $data;
	}

	public static function add($target, $type, $action) {
		$db = new DBConn();
		$id_user = Auth::id();

		return $db->insert("
			INSERT INTO log (id_user, id_target, type, action)
			VALUES ({$id_user}, {$id_target}, {$type}, {$action})
		");
	}

	private static function getFirstLogin() {
		$db = new DBConn();
		$id_user = Auth::id();

		$r = $db->query("SELECT datetime_joined FROM user WHERE id = {$id_user}");
		$r->action = LOG_FIRST_LOGIN;
		$r->type = 1;
		$r->icon = self::getIcon($r->type, $r->action);
		$r->action_str = self::getActionString($r->action);
		$r->data = self::getData($r->datetime_joined);

		return $r;
	}

	private static function getIcon($type, $action) {
		switch($action) {
			case LOG_CREATE:	
				if($type == LOG_TYPE_USER)			
					return "user-plus";
				else
					return "briefcase";		
			case LOG_UPDATE:	
				if($type == LOG_TYPE_USER)			
					return "user";
				else
					return "briefcase";		
			case LOG_REMOVE:
				if($type == LOG_TYPE_USER)			
					return "user-times";
				else
					return "briefcase";

			case LOG_FOLLOW:			return "feed";
			case LOG_UNFOLLOW:			return "ban";
			case LOG_BLOCK:				return "lock";
			case LOG_UNBLOCK:			return "unlock-alt";
			case LOG_APPLY:				return "envelope";
			case LOG_APPLY_ACCEPT:		return "thumbs-up";
			case LOG_APPLY_REJECT:		return "thumbs-down";

			case LOG_RECOMMEND_USER:	
			case LOG_RECOMMEND_JOB:		return "share-square-o";
			case LOG_POST:				return "send";
			case LOG_FAVORITE:			return "star";
			case LOG_UNFAVORITE:		return "star-o";
			case LOG_COMMENT:			return "commenting-o";
			case LOG_FIRST_LOGIN:		return "address-card-o";
			case LOG_UPDATE_AVATAR:		return "picture-o";
		}
	}

	private static function getActionString($action) {
		switch($action) {
			case LOG_CREATE:			return "criou";		
			case LOG_UPDATE:			return "editou";
			case LOG_REMOVE:			return "removeu";
			case LOG_FOLLOW:			return "começou a seguir";
			case LOG_UNFOLLOW:			return "deixou de seguir";
			case LOG_BLOCK:				return "bloqueou";
			case LOG_UNBLOCK:			return "desbloqueou";
			case LOG_APPLY:				return "se candidatou";
			case LOG_APPLY_ACCEPT:		return "aprovou a candidatura";
			case LOG_APPLY_REJECT:		return "reprovou a candidatura";
			
			case LOG_RECOMMEND_USER:	
			case LOG_RECOMMEND_JOB:		return "recomendou";
			case LOG_POST:				return "postou";
			case LOG_FAVORITE:			return "adicionou aos favoritos";
			case LOG_FAVORITE:			return "removeu dos favoritos";
			case LOG_COMMENT:			return "comentou na publicação";

			case LOG_FIRST_LOGIN:		return "realizou primeiro login";
			case LOG_UPDATE_AVATAR:		return "atualizou a foto de perfil";
		}
	}

	private static function getData($datetime) {
		$p = explode(" ", $datetime);
		$d = explode("-", $p[0]);

		switch ((int)$d[1]) {
			case 1:		$d[1] = "Jan"; break;
			case 2:		$d[1] = "Fev"; break;
			case 3:		$d[1] = "Mar"; break;
			case 4:		$d[1] = "Abr"; break;
			case 5:		$d[1] = "Mai"; break;
			case 6:		$d[1] = "Jun"; break;
			case 7:		$d[1] = "Jul"; break;
			case 8:		$d[1] = "Ago"; break;
			case 9:		$d[1] = "Set"; break;
			case 10:	$d[1] = "Out"; break;
			default:
			case 11:	$d[1] = "Nov"; break;
			case 12:	$d[1] = "Dez"; break;
		}
		$d[0] = date('Y') == $d[0] ? "" : " ".$d[0];
		
		return $d[2]." ".$d[1].$d[0];
	}
}