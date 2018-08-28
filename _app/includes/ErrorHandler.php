<?php
class ErrorHandler {
    private $lastError;
    private $backtrace = NULL;

    public function watch() {
    	ini_set("display_errors", "1");
		error_reporting(E_ALL);
		set_error_handler(array($this, 'handleErrors'));
	}

	public function sleep() {
    	ini_set("display_errors", "0");
		error_reporting(0);
	}

	public function handleErrors($errno, $errstr, $errfile, $errline) {
	    // Save error Log
	    $this->backtrace = debug_backtrace();
	   	$this->setLastError($errno, $errstr, $errfile, $errline);

	   	// Generate log file at /error_log/output.txt
	    $this->store();

	    // Show information on screen to user
	    // https://secure.php.net/manual/en/errorfunc.constants.php
	    switch ($this->lastError->type) {
	    	case E_ERROR: 		
	    	case E_PARSE: 		
	    	case E_USER_ERROR: 		
	    		$this->friendlyReport('danger'); 
	    		break;

	    	case E_WARNING: 	
	    	case E_NOTICE: 			
	    	case E_USER_WARNING: 	
	    	case E_USER_NOTICE: 	
	    		$this->friendlyReport('warning'); 
	    		break;

	    	case E_DEPRECATED: 		
	    	case E_USER_DEPRECATED: 
	    	default:
	    		$this->friendlyReport('info'); 
	    		break;
	    }	    
    }

    private function setLastError($errno, $errstr, $errfile, $errline) {
    	$this->lastError = new stdclass();
    	$this->lastError->type = $errno;
    	$this->lastError->type_string = $this->getErrorTypeString($errno);
    	$this->lastError->string = $errstr;
    	$this->lastError->file = $errfile;
    	$this->lastError->relative_path = str_replace(BASE_PATH, "", $this->lastError->file);
    	$this->lastError->line = $errline;
    }

    private function store() {
    	$handle = fopen(ERROR_LOG_PATH.'output.txt', "w+");
    	
    	$CRLF = PHP_EOL."======".PHP_EOL;
    	$string = "Last Error:";
    	$string .= $CRLF;
    	$string .= $this->formatArrayOutput($this->lastError).PHP_EOL.PHP_EOL;
    	$string .= 'Backtrace:';
    	$string .= $CRLF;
    	$string .= $this->formatArrayOutput($this->backtrace);
    	$string .= $CRLF;
    	$string .= "File created at: ".date("d/m/Y H:i:s");

    	$bytes = fwrite($handle, $string);

    	return $bytes > 0 ? $bytes : FALSE;
    }

    private function friendlyReport($status) { ?>
    	<section id="error-log">
    		<div class="container">
    			<div class="panel-group">
					<div class="panel panel-<?=$status?>">
						<div class="panel-heading">
							<h3><?= $this->lastError->type_string ?></h3>
						</div>
						<div class="panel-body">
							<h4><?= $this->lastError->string ?></h4>
							<p>Em <?php echo $this->lastError->relative_path." na linha ".$this->lastError->line; ?></p>
						</div>
					</div>
				</div>
			</div>
    	</section>
    <?php 
	}

	private function getErrorTypeString($error_code) {
		switch ($error_code) {
			case 1: 
			case 256:	
				return "Erro";
			case 2:
			case 512: 	
				return "Aviso";
			case 4: 	
				return "Erro no parse";
			case 8: 	
			case 1024: 	
				return "Notícia";
			case 8192:	
			case 16384:	
				return "Código depreciado";
		}
	}

    private function formatArrayOutput($object) {
    	$result = print_r($object, true);
		$result = explode(PHP_EOL, $result);
    	$array = implode(" ", $result);

    	return $array;
    }
}
?>