<?php
//limitar acceso de este archivo!!!
class Database
{
    private static $dbName = 'Banjimex' ;
    private static $dbHost = 'localhost' ;
    private static $dbUsername = 'casa';
    private static $dbUserPassword = 'K4r0sc12';
     
    //private static $dbName = 'u116621762_banji' ;
    //private static $dbHost = 'mysql.hostinger.mx' ;
    //private static $dbUsername = 'u116621762_casa';
    //private static $dbUserPassword = 'K4r0sc12';
   
    private static $cont  = null;
     
    public function __construct() {
        die('Funcion init no permitida');
    }
     
    public static function connect()
    {
       // una sóla conexión en toda la aplicación
       if ( null == self::$cont )
       {     
        try
        {
          self::$cont =  new PDO( "mysql:host=".self::$dbHost.";"."dbname=".self::$dbName, self::$dbUsername, self::$dbUserPassword); 
        }
        catch(PDOException $e)
        {
          die($e->getMessage()); 
        }
       }
       return self::$cont;
    }
     
    public static function disconnect()
    {
        self::$cont = null;
    }
}

?>