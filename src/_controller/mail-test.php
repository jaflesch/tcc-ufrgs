<?php
require LIB_PATH.'Mail.php';

class MailTest extends Controller {
	public function index() {
		debug($this->sendMail());
	}

	public function sendMail() {
		// Initiate the mail
		$bag["time"] = date("H:i:s");
		$bag["date"] = date('d/m/Y');
		
		$mail = new Mail("Mensagem de Teste - Portal de Vagas", $this);
		$mail->addAddress(MAIL_CONTACT, "Contato");
		$mail->bind("index", $bag);

		// Send the e-mail
		return $mail->send();
	}
}