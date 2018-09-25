<?php
class DbConn {
	private $link;
	private $query;
	private $select;
	private $table;
	private $where;
	private $order;
	private $limit;
	private $error;
	private $last_query;
	private $affected_rows = 0;
	private $last_id;

	public function __construct() {
		$this->link = @mysqli_connect(DB_HOST, DB_USER, DB_PASS, DB_NAME) or die($this->error());
	}

	// Apply Query methods
	public function query($query, $returnArray = false) {
		return $this->getResult($query, $returnArray);
	}

	public function exec() {
		if($this->table == "") die("Table not selected");
		
		$select = $this->select == "" ? "*" : $this->select;
		$where = $this->where == "" ? "1 = 1" : $this->where;
		$query = "
			SELECT {$select}
			FROM {$this->table}
			WHERE {$where}
		";
		
		return $this->getResult($query);
	}

	// Set Query methods
	public function select($select) {
		$this->select = $select;
	}

	public function table($table) {
		$this->table = $table;
	}	

	public function where($condition) {
		$this->where = $condition;
	}

	public function rows() {
		return $this->last_query['result']->num_rows;
	}

	public function insert($query) {
		$success = FALSE;
		$result = mysqli_query($this->link, $query) or die($this->error());

		$rows = mysqli_affected_rows($this->link);
		if($rows == 1 && $result === TRUE) {
			$success = TRUE;
			$this->storeLastQuery($result, "INSERT");
			$this->last_id = mysqli_insert_id($this->link);
		}

		return $success;
	}

	public function update($query) {
		$success = FALSE;
		$result = mysqli_query($this->link, $query) or die($this->error());

		$rows = mysqli_affected_rows($this->link);
		if($rows >= 1 && $result === TRUE) {
			$success = TRUE;
			$this->affected_rows = $rows;
			$this->storeLastQuery($result, "UPDATE");
		}

		return $success;
	}

	public function delete($query) {
		$success = FALSE;
		$result = mysqli_query($this->link, $query) or die($this->error());

		$rows = mysqli_affected_rows($this->link);
		if($rows >= 1 && $result === TRUE) {
			$success = TRUE;
			$this->affected_rows = $rows;
			$this->storeLastQuery($result, "DELETE");
		}

		return $success;
	}

	public function last_id() {
		return $this->last_id;
	}

	// Helper methods
	private function getResult($query, $returnArray = false) {
		$data = NULL;
		$result = mysqli_query($this->link, $query) or die($this->error());

		if(mysqli_num_rows($result) == 1) {
			$data = toUTF(mysqli_fetch_object($result));			
			$this->storeLastQuery($result, $data);
			
			if($returnArray) {
				$array[] = $data;
				return $array;
			} 
			else return $data;
		}
		else {
			while($fetch = mysqli_fetch_object($result)) {
				$data[] = toUTF($fetch);
			}
			$this->storeLastQuery($result, $data);

			return $data;
		}
	}

	private function error() {
		// Custom error message
		echo "<h1>Database error</h1>";
		if($this->link !== FALSE) {
			die(mysqli_error($this->link));			
		}
		else {
			die("Connection error.");
		}
	}

	private function storeLastQuery($result, $data) {
		$this->last_query = array(
			"result" => $result,
			"data" => $data
		);
	}
}