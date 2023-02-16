<?php

class MySqlBackupLite {
 
	private $host;
	private $user;
	private $pass;
	private $name;
   
	private $fileName = "mySqlBackup.sql";
	private $fileDir = "./";
	private $fileCompression = true;
   
	private $timeZone = '+00:00';
   
	private $mySqli;
	private $sqlString = '';
	private $arrayTables;
   
	private $tableFieldCount = 0;
	private $tableNumberOfRows = 0;
	private $queryResult;
   
   
   
	public function __construct(array $arrayConnConfig) {
   
		if (
		  (!isset($arrayConnConfig['host'])) ||
		  (!isset($arrayConnConfig['user'])) ||
		  (!isset($arrayConnConfig['pass'])) ||
		  (!isset($arrayConnConfig['name']))
		) {
			throw new Exception('Missing connection data.');
   
		}
		$this->setHost($arrayConnConfig['host']);
		$this->setUser($arrayConnConfig['user']);
		$this->setPass($arrayConnConfig['pass']);
		$this->setName($arrayConnConfig['name']);
   
	}
   
   
   
	public function backUp() {
   
	  $this->connectMySql();
	  $this->getTables();
	  $this->generateSqlHeader();
	  $this->createTableStaments();
	  $this->insertStaments();
	  $this->generateSqlFooter();
   
	}
   
   
   
	private function setHost($host) {
	  $this->host = $host;
	}
   
   
   
	private function setUser($user) {
	  $this->user = $user;
	}
   
   
   
	private function setPass($password) {
	  $this->pass = $password;
	}
   
   
   
	private function setName($name) {
	  $this->name = $name;
	}
   
   
   
	public function setFileName($name) {
	  $this->fileName = $name;
	}
   
   
   
	public function setFileDir($dir) {
	  $this->fileDir = $dir;
	}
   
   
   
	public function setFileCompression($compression) {
	  $this->fileCompression = $compression;
	}
   
   
   
	private function connectMySql() {
   
	  $this->mySqli = new mysqli($this->host, $this->user, $this->pass, $this->name);
	  $this->mySqli->select_db($this->name);
	  $this->mySqli->query("SET NAMES 'utf8'");
   
	}
   
   
   
	private function getTables() {
   
		$respuesta = ModeloUsuarios::mdlMostrarOrderTable();
        
		foreach($respuesta as $value){

			$this->arrayTables[]= $value[0];

		}
	
	}
   

   
	private function generateSqlHeader() {
   
	  $this->sqlString  = 'SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";' . "\r\n";
	  $this->sqlString .= 'SET time_zone = "' . $this->timeZone . '";' . "\r\n\r\n\r\n";
	  $this->sqlString .= '/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;' . "\r\n";
	  $this->sqlString .= '/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;' . "\r\n";
	  $this->sqlString .= '/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;' . "\r\n";
	  $this->sqlString .= '/*!40101 SET NAMES utf8 */;' . "\r\n";
	  $this->sqlString .= '--' . "\r\n";
	  $this->sqlString .= 'Use ' . $this->name . ';' . "\r\n";
	  $this->sqlString .= '--' . "\r\n\r\n\r\n";
   
	  return;
   
	}
   
   
   
	private function createTableStaments() {
   
	//   foreach($this->arrayTables as $table){
	// 	$this->sqlCreateTableStament($table);
	//   }
   
	}
   
   
   
	private function sqlCreateTableStament($table) {
   
	  $res = $this->mySqli->query('SHOW CREATE TABLE '.$table);
	  $temp = $res->fetch_row();
		  $this->sqlString .= "\n\n" . str_ireplace('CREATE TABLE `','CREATE TABLE IF NOT EXISTS `', $temp[1]) . ";\n\n";
   
	}
   
   
   
	private function insertStaments() {
   
	  foreach($this->arrayTables as $table){
		$this->sqlInsertStaments($table);
	  }
   
	}
   
   
   
	private function sqlInsertStaments($table) {
   
		  $this->getTableData($table);
   
	  if($this->tableFieldCount == 0) {
		return;
	  }
   
   
	  $i = 0;
		  while($row = $this->queryResult->fetch_row()) {
   
		$this->insertResultHeader($table, $i);
		$this->insertSingleResult($row);
   
		$i++;
		$this->sqlString .= (($i != 0) && ($i % 100 == 0) || ($i == $this->tableNumberOfRows)) ? ";" : ",";
   
		  }
   
	  $this->sqlString .= "\n\n\n";
   
	}
   
   
   
	private function getTableData($table) {
   
	  $this->queryResult   = $this->mySqli->query('SELECT * FROM `' . $table . '`');
	  $this->tableFieldCount = $this->queryResult->field_count;
	  $this->tableNumberOfRows = $this->mySqli->affected_rows;
   
	}
   
   
	private function insertResultHeader($table, $currentRowNumber) {
   
	  if ($currentRowNumber % 100 == 0 || $currentRowNumber == 0 )    {
		$this->sqlString .= "\nINSERT INTO " . $table . " VALUES";
	  }
   
	}
   
   
	private function insertSingleResult($row) {
   
	  $this->sqlString .= "\n(";
   
	  for($i = 0; $i < $this->tableFieldCount; $i++){
   
		$row[$i] = str_replace("\n","\\n", addslashes($row[$i]));
   
		$this->sqlString .= ($row[$i]!=NULL) ? "'".$row[$i]."'" : "NULL";
		if($i < ($this->tableFieldCount-1)){
		  $this->sqlString.= ',';
		}
   
	  }
   
	  $this->sqlString .=")";
   
	}
   
   
	private function generateSqlFooter() {
   
	  $this->sqlString .=  "\r\n\r\n";
	  $this->sqlString .=  '/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;';
	  $this->sqlString .=  "\r\n";
	  $this->sqlString .=  '/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;';
	  $this->sqlString .=  "\r\n";
	  $this->sqlString .=  '/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;';
   
	}
   
   
	public function downloadFile() {
   
		ob_get_clean();
		header('Content-Type: application/octet-stream');
		header("Content-Transfer-Encoding: Binary");
		header('Content-Length: '. (function_exists('mb_strlen') ? mb_strlen($this->sqlString, '8bit'): strlen($this->sqlString)) );
		header("Content-disposition: attachment; filename=\"".$this->fileName."\"");
		echo $this->sqlString; exit;
   
	}
   
   
   
	public function saveToFile() {
   
	  if (!$backupFile = fopen($this->fileDir . $this->fileName, "w+")) {
		  throw new Exception('Imposible to create file.');
	  }
	  fwrite($backupFile, $this->sqlString);
	  fclose($backupFile);
   
	}
   
   
  }


class ControladorBackup{

	/*=============================================
	CREAR BACKUPS
	=============================================*/

	static public function ctrCrearBackup(){

		if(isset($_POST["backup"])){
			error_reporting(0);
			date_default_timezone_set('America/Bogota');
			$arrayDbConf['host'] = 'localhost';
			$arrayDbConf['user'] = 'root';
			$arrayDbConf['pass'] = 'root';
			$arrayDbConf['name'] = 'caticao';
			$fechaActual = date('d-m-Y_H-i-s');
			try {
			 
				$bck = new MySqlBackupLite($arrayDbConf);
				$bck->backUp();
				$bck->setFileDir('backups/');
				$bck->setFileName('CPM_Caticao_'.$fechaActual.'.sql');
				$bck->saveToFile();
			   
			}
			catch(Exception $e) {
			   
				echo $e;
			   
			}
			
			  echo '<script>

			  Swal.fire({
					
				  icon: "success",
				  title: "¡Copia de seguridad creada!",
				  showConfirmButton: false,
				  timer: 1500
					
			  }).then(function(result){
					
					  window.location = "backup";
					
			  });
					
					
			  </script>';

		}

	}


	/*=============================================
	ELIMINAR BACKUP
	=============================================*/
	static public function ctrEliminarBackup(){

		if(isset($_GET["nombreBackup"])){

			$nombreBackup = $_GET["nombreBackup"];

            if (unlink("backups/$nombreBackup")) {
				
				echo '<script>

				Swal.fire({
				
					icon: "success",
					title: "¡La copia de seguridad ha sido eliminada correctamente!",
					showConfirmButton: false,
					timer: 1500
				
				}).then(function(result){
				
						window.location = "backup";
				
				});
				
				
				</script>';

			  }
				
		}


	}



}





	