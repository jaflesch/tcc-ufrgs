<?php 
class Dictionary {
	private $dictionary = array();
	private $language;
	private $file;

	public function __construct($file = "app.dict") {
		$this->setDictionary($file);
		$this->file = $file;
		$this->language = isset($_SESSION['language'])? $_SESSION['language'] : 'pt_br';
	}

	public function append($object) {
		/*
			@param:: {id, text_language1, text_language2, ...}
			@return:: NULL
		*/
			
		foreach ($this->dictionary as $key => $value) {
			$this->dictionary[$key][$object['token']] = $object["word_".$key];
		}
	}

	public function appendMultiple($object) {
		/*
			@param:: {{id, text_language1, text_language2, ...}, {}, ... }
			@return:: NULL
		*/
			
		for($i = 0; $i < count($object['token']); $i++) {
			foreach ($this->dictionary as $key => $value) {
				$this->dictionary[$key][$object['token'][$i]] = $object["word_".$key][$i];
			}
		}
	}

	public function update($id, $text) {
		/*
			@param:: (string), (array)[text_language1, text_language2, ...]
			@return:: NULL
		*/
		print_r($this->getFullDictionary());
		
		$i = 0; 
		foreach ($this->dictionary as $key => $value) {
			$this->dictionary[$key][$value[$id]] = $text[$i];
			echo $this->dictionary[$key][$value[$id]]."<br/>";
			$i++;
		}
	}

	public function export($file = "") {
		// open handler
		$file = $file == "" ? $this->file : $file;
		$handle = fopen($file, 'w');

		// languages section
		$string = "# languages\r\n";
		$languages = $this->getLanguages();
		foreach ($languages as $language) {
			$string .= $language."\r\n";
		}
		$string .= "\r\n";

		// words section
		$string .= "# words\r\n";
		$i = 0;
		
		// create associative arrays from dictionary
		$id_words = array_keys($this->dictionary[$languages[0]]);
		foreach ($this->dictionary as $language) {
			foreach ($language as $key => $value) {
				$words[$i][] = $value;
			}
			$i++;
		}

		// write data to file
		for($i = 0; $i < count($id_words); $i++) {
			$string .= $id_words[$i]."\r\n";

			for($j = 0; $j < count($words); $j++) {
				$string .= $words[$j][$i]."\r\n";
			}
			$string .= "\r\n";
		}
		fwrite($handle, $string);
		return fclose($handle);
	}

	public function getDictionary($language = null) {
		return ($language)? $this->getDictionaryFromLanguage($language) : $this->getDictionaryFromLanguage($this->language);
	}

	public function getLanguages() {
		$languages = array();
		foreach ($this->dictionary as $lang=>$value) {
			$languages[] = $lang;
		}

		return $languages;
	}

	public function getFullDictionary() {
		return $this->dictionary;
	}

	public function getFullDictionaryFormatted() {
		$tokens = array();

		foreach ($this->dictionary as $key => $value) {
			foreach ($value as $key => $value) { $tokens[] = $key; } 
			break;
		}
		$dict = array();
		$dict[] = $tokens;
		foreach ($this->dictionary as $key => $value) { $dict[] = array_values($value); }

		return $dict;
	}

	private function getDictionaryFromLanguage($language) {
		if(isset($this->dictionary[$language])) {
			return $this->dictionary[$language];
		}
		// undefined language
		else return false;
	}

	protected function setDictionary($file) {
		$handle = file_get_contents($file);
		$lines = explode("\r\n", $handle);
		
		// get all the languages
		for($i = 0; $i < count($lines); $i++) {
			if($lines[$i] == "# words") {
				$index = $i + 1;
				break;
			}
			else if(@$lines[$i][0] != "#" && $lines[$i] != "") {
				$languages[] = str_replace(array("-"," "), "_", $lines[$i]);
			}	
		}
		
		// mount the words for each language
		for($i = $index; $i < count($lines); $i++) {
			if($lines[$i] == "")
				continue;

			$id = $i;
			$j = 1;
			$k = 0;
			foreach ($languages as $language) {
				@$this->dictionary[$language][$lines[$id]] = $lines[$id + $j];
				$j++;
				$k++;
			}
			$i += $k;
		}
	}

	public function getLanguage() {
		return $this->language;
	}

	public function getLanguageText($language = null) {
		$string = $language ? $language : $this->language;

		switch(strtolower($string)) {
			case 'pt_br': return 'Português - Brasil';
			case 'pt': return 'Português - Portugal';
			case 'en': return 'Inglês';
			case 'es': return 'Espanhol';
			case 'al':
			case 'de': return 'Alemão';
			case 'fra': return 'Francês';
			case 'ita': return 'Italiano';
			case 'jp': return 'Japonês';
			case 'la': return 'Latim';
			default: return '??';
		}
	}

	public function getLanguagesText() {
		$languages = $this->getLanguages();
		$array = array();

		foreach ($languages as $lang) {
			$array[] = $this->getLanguageText($lang);
		}

		return $array;
	}

	public function setLanguage($language) {
		$this->language = $language;
	}

	public function debug() {
		session_start();
		echo "<strong>Idioma selecionado:</strong> {$this->language} <br/>";
		echo "<strong> Dicionário gerado: </strong> <br/><pre>";
		print_r($this->dictionary);
		echo "</pre>";
	}
}
?>

