<?php
  class File {

    private static $dir   = "../../uploads/trabalhos/";
    private static $size  = 1024 * 1024 * 30; // Mb
    private static $ext   = array ('pdf', 'doc', 'docx');

    public static function upload($file, $name) {
    
      global $dbConn;
      
      // Verifica se houve algum erro com o upload. Se sim, exibe a mensagem do erro
      if ($_FILES['arquivo']['error'] != 0) {
        return "N�o foi poss�vel fazer o upload, erro:" . $_FILES['arquivo']['error'];
      }
      
      // Faz a verifica��o da extens�o do arquivo
      $extensao = self::getExt($_FILES['arquivo']['name']);

      // if (array_search($extensao, self::$ext) === false) {
      //   return "Por favor, envie arquivos com as seguintes extens�es: pdf, doc ou docx";
      // }
      
      // Faz a verifica��o do tamanho do arquivo
      if (self::$size < $_FILES['arquivo']['size']) {
        return "O arquivo enviado � muito grande, envie arquivos de at� 30Mb.";
      }

      // O arquivo passou em todas as verifica��es, hora de tentar mov�-lo para a pasta
      // Cria um nome baseado no UNIX TIMESTAMP atual e com extens�o .pdf
      $nome_final = $name;

      // Depois verifica se � poss�vel mover o arquivo para a pasta escolhida
      @mkdir(self::$dir . self::nextid($dbConn)."/", 0777);
      if (@move_uploaded_file($_FILES['arquivo']['tmp_name'], self::$dir . self::nextid($dbConn)."/" . $nome_final)) {
        return 'upload_success';
      } 
      else {
        return "N�o foi poss�vel enviar o arquivo, tente novamente";
      }
    }

    public static function update($file, $name, $id) {
    
      global $dbConn;
      
      // Verifica se houve algum erro com o upload. Se sim, exibe a mensagem do erro
      if ($_FILES['arquivo']['error'] != 0) {
        return "N�o foi poss�vel fazer o upload, erro:" . $_FILES['arquivo']['error'];
      }
      
      // Faz a verifica��o da extens�o do arquivo
      $extensao = self::getExt($_FILES['arquivo']['name']);

      // if (array_search($extensao, self::$ext) === false) {
      //   return "Por favor, envie arquivos com as seguintes extens�es: pdf, doc ou docx";
      // }
      
      // Faz a verifica��o do tamanho do arquivo
      if (self::$size < $_FILES['arquivo']['size']) {
        return "O arquivo enviado � muito grande, envie arquivos de at� 30Mb.";
      }

      // O arquivo passou em todas as verifica��es, hora de tentar mov�-lo para a pasta
      // Cria um nome baseado no UNIX TIMESTAMP atual e com extens�o .pdf
      $nome_final = $name;

      // Depois verifica se � poss�vel mover o arquivo para a pasta escolhida
      @mkdir(self::$dir . $id."/", 0777);
      if (@move_uploaded_file($_FILES['arquivo']['tmp_name'], self::$dir . $id."/" . $nome_final)) {
        return 'upload_success';
      } 
      else {
        return "N�o foi poss�vel enviar o arquivo, tente novamente";
      }
    }
    public static function getExt($string) {
      $extensao = explode('.', $string);
      return strtolower($extensao[1]);
    }

    private static function nextid($dbConn) {
      $query = "
        SELECT `AUTO_INCREMENT` id
        FROM  INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = 'mpefp_db' AND TABLE_NAME = 'trabalho'
      ";

      $result = mysqli_query($dbConn, $query);
      $fetch = mysqli_fetch_object($result);

      return $fetch->id;
    }
}