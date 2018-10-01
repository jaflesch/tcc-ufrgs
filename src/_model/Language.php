<?php
class Language {
	public static function getFlag($language_title) {
		switch($language_title) {
			case 'Português': 	return 'Brazil';
			case 'Inglês': 		return 'United-States';
			case 'Francês': 	return 'France';
			case 'Alemão': 		return 'Germany';
			case 'Espanhol': 	return 'Spain';
			case 'Japonês': 	return 'Japan';
			case 'Chinês': 		return 'China';
			case 'Russo': 		return 'Russia';
			case 'Coreano': 	return 'South-Korea';
			case 'Turco': 		return 'Turkey';
			case 'Polaco': 		return 'Poland';
			case 'Egípcio': 	return 'Egypt';
			case 'Ucraniano': 	return 'Ukraine';
			case 'Holandês': 	return 'Netherlands';
			default:			return "Unknown";
		}
	}
}