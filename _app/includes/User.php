<?php
class User {
	const ADMIN = 1;
	const PROFESOR = 2;
	const EMPLOYEE = 3;
	const STUDENT = 4;
	const MALE = 0;
	const FEMALE = 1;

	private $id;
	private $login;
	private $email;
	private $name;
	private $age;
	private $born_in;
	private $live_in;
	private $role;
	private $role_str;
	private $phone;
	private $birthday;
	private $gender;
	private $avatar;
	private $datetime_joined;
	private $personal_link;

	public function __construct($data) {
		$this->id 		= $data->id;		
		$this->login 	= $data->login;		
		$this->email 	= $data->email;		
		$this->name 	= $data->name;		
		$this->age 		= $data->age;		
		$this->born_in 	= $data->born_in;		
		$this->live_in 	= $data->live_in;		
		$this->role 	= $data->role;		
		$this->role_str = $this->getString();		
		$this->phone 	= $data->phone;		
		$this->birthday = $data->birthday;		
		$this->gender 	= $data->gender;		
		$this->avatar 	= $data->avatar;		
		$this->datetime_joined = $data->datetime_joined;
		$this->personal_link = $data->personal_link;
	}

	public function getName() {
		return $this->name;
	}
	
	public function getLogin() {
		return $this->login;
	}
	
	public function getEmail() {
		return $this->email;
	}
	
	public function getAge() {
		return $this->age;
	}
	
	public function getLocation() {
		return array(
			"born_in" => $this->born_in,
			"live_in" => $this->live_in
		);
	}
	public function getRole() {
		return array(
			"code" => $this->role,
			"title" => $this->role_str
		);
	}
	
	public function getPhone() {
		return $this->phone;
	}
	
	public function getBirthday() {
		return $this->birthday;
	}
	
	public function getGender() {
		return $this->gender == self::MALE ? "masculino" : "feminino";
	}
	
	public function getAvatar() {
		return $this->avatar;
	}

	public function getPersonalLink() {
		return $this->personal_link;
	}

	public function getJoinedDatetime() {
		$pieces = explode(" ", $this->datetime_joined);
		$date = $pieces[0];
		$time = $pieces[1];
		unset($pieces);
		$pieces = explode("-", $date);

		$string = Data::getMonth($pieces[1])." de ".$pieces[0];

		return array(
			"raw" => $this->datetime_joined,
			"str" => $string,
			"time" => $time,
			"date" => $date
		);
	}

	// Helpers
	private function getString() {
		if($this->gender == self::MALE) {
			switch ($this->role) {
				case self::ADMIN: 		return "administrador";
				case self::PROFESSOR: 	return "professor";
				case self::EMPLOYEE:	return "técnico";
				case self::STUDENT: 	return "aluno";
			}
		}
		else {
			switch ($this->role) {
				case self::ADMIN: 		return "administradora";
				case self::PROFESSOR: 	return "professora";
				case self::EMPLOYEE:	return "técnica";
				case self::STUDENT: 	return "aluna";
			}	
		}
	}
}