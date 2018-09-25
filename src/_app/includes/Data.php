<?php
class Data {
	public static function date2str($data) {
		$piece = explode("-", $data);
		return $piece[2]."/".$piece[1]."/".$piece[0];
	}

	public static function str2date($string) {
		$piece = explode("/", $string);
		return $piece[2]."-".$piece[1]."-".$piece[0];
	}

	public static function datetime2str($datetime, $full = false) {
		$hourtime = explode(" ", $datetime);

		$piece = explode("-", $hourtime[0]);

		$string = ($full)? $hourtime[1]." " : "" .$piece[2]."/".$piece[1]."/".$piece[0];
		return $string;
	}

	public static function today() {
		$data = date('d/m/Y');
		$pieces = explode("/", $data);

		return $pieces[0].' de '.self::getMonth($pieces[1]).' de '.$pieces[2];
	}

	public static function diff($date1, $date2) {
		/**
			@param: $date1 (string)
			@param: $date2 (string)
			@return: date difference in days (string)

			Ex.: ("2010-07-06", "2010-07-09") => "-3"
		*/

		$d1 = new DateTime($date1);
		$d2 = new DateTime($date2);

		return $d2->diff($d1)->format("%R%a");
	}

	public static function getMonth($int) {
		switch ($int) {
			case 1: 	return 'janeiro';
			case 2: 	return 'fevereiro';
			case 3: 	return 'março';
			case 4: 	return 'abril';
			case 5: 	return 'maio';
			case 6: 	return 'junho';
			case 7: 	return 'julho';
			case 8: 	return 'agosto';
			case 9: 	return 'setembro';
			case 10: 	return 'outubro';
			case 11: 	return 'novembro';
			case 12: 	return 'dezembro';
		}
	}
}
?>