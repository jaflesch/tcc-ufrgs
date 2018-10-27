<?php
require_once("PHPmailer/PHPmailer.php");

class Mail {
	private $subject;
	private $mailer;
	private $template;
	private $data;
	private $controller;

	public function __construct($subject, $controller) {
		$this->setSubject($subject);
		$this->mailer = new PHPMailer();
		$this->controller = $controller;

		$this->initialConfig();
	}

	public function bind($template, $data) {
		$this->template = $template;
		$this->data = $data;
	}
	
	public static function validateAddress($email_address) {
		return PHPMailer::ValidateAddress($email_address);
	}
	
	/*
	 * Set initial configurations for PHP Mailer
	 */
	private function initialConfig() {
		$this->mailer->isHTML(TRUE);
		$this->mailer->FromName = SMTP_FROM_NAME;
		$this->mailer->From = SMTP_SENDER;
		$this->mailer->Sender = SMTP_SENDER;

		$this->mailer->IsSMTP();                           
		$this->mailer->SMTPAuth   = TRUE;  
		$this->mailer->SMTPSecure = SMTP_SECURE;                
		$this->mailer->Host       = SMTP_HOST; 
		$this->mailer->Port       = SMTP_PORT;                    
		$this->mailer->Username   = SMTP_EMAIL_ACCOUNT; 
		$this->mailer->Password   = SMTP_EMAIL_PASSWORD;        

		//Subject
		$this->mailer->Subject = $this->getSubject();
	}
	
	/*
	 * Retrieve Subject
	 * @return String
	 */
	public function getSubject() {
		return $this->subject;
	}
	
	/*
	 * Set subject
	 * @param $subject String
	 * @return void
	 */
	public function setSubject($subject) {
		$this->subject = utf8_decode($subject);
	}
	
	/*
	 * Add BCC
	 * @param $email String
	 * @param $name String
	 * @return void
	 */
	public function addBCC($email, $name) {
		$this->mailer->AddBCC($email, $name);
	}
	
	/*
	 * Add CC
	 * @param $email String
	 * @param $name String
	 * @return void
	 */
	public function addCC($email, $name) {
		$this->mailer->AddCC($email, $name);
	}
	
	/*
	 * Add address
	 * @param $email String
	 * @param $name String
	 * @return void
	 */
	public function addAddress($email, $name) {
		$this->mailer->AddAddress($email, $name);
	}
	
	/*
	 * Set HTML e-mail body
	 * @param $body String
	 * @return void
	 */
	public function setBody($body) {
		$this->mailer->MsgHTML(utf8_decode($body));
	}
	
	public function attachment($first, $second) {
		$this->mailer->AddAttachment($first, $second);
	}
	
	/*
	 * Send the e-mail
	 * @return boolean
	 */
	public function send($echo = false) {
		if(!$echo) {
			$this->setBody($this->controller->render("_mail/".$this->template, $this->data, false) );
			return $this->mailer->Send();
		}
		else {
			$this->controller->render("_mail/".$this->template, $this->data, true);
		}
	}
}
?>