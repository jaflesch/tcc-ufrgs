<?php
require LIB_PATH.'Mail.php';

class MailTest extends Controller {
	public function index() {
		debug($this->sendMail());
	}

	public function sendMail() {
		// Initiate the mail
		$mail = new Mail("Mensagem de Teste - Portal de Vagas");
		
		$mail->addAddress(MAIL_CONTACT, "Contato");

		// $bag["user_data"] = $user_data;
		$bag["time"] = date("H:i:s");
		$bag["date"] = date('d/m/Y');

		$mail->setBody(self::render("_mail/index", $bag, false));
		
		// Send the e-mail
		return $mail->send();
	}
}