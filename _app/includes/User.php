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