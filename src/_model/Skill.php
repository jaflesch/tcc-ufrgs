<?php
class Skill {
	const INICIANTE = 1;
	const AMADOR 	= 2;
	const JUNIOR 	= 3;
	const PLENO 	= 4;
	const SENIOR 	= 5;

	public static function getString($int) {
		switch($int) {
			case Skill::INICIANTE: 	return "Iniciante";
			case Skill::AMADOR: 	return "Amador";
			case Skill::JUNIOR: 	return "Júnior";
			case Skill::PLENO: 		return "Pleno";
			case Skill::SENIOR: 	return "Sênior";
			
			default:				return "Indefinido";
		}
	}
}