<?php	
	class Conexion
	{
		private $host = "localhost";
		private $user = "root";
		private $password = "";
		private $db = "Dbo_Paloaguao";
		private $connect;
		public function __construct()
		{
		$connectionstring = "mysql:hos=".$this->host.";dbname=".$this->db.";charset=utf8";

		try {
			$this->connect = new PDO($connectionstring,$this->user,$this->password);
			
			$this->connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXECPTION);	
			echo "Conexión correcta";
			}catch (Exception $e)
			{
				$this->connect ='Error de conexión';
				echo "ERROR: ". $e->getMessage();
			}	
		}
	}
?>