<?php

        if ( empty($_POST['usuario']) || empty($_POST['contrasena'] )) {
            header("Location: ./error_vacio.html");

            exit();
        } else {
        	require 'database.php';
            $pdo = Database::connect();
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $sql = "SELECT * FROM usuario where usuario='".$_POST['usuario']."'";
            $q = $pdo->prepare($sql);
            $q->execute();
            $data = $q->fetch(PDO::FETCH_ASSOC);
            Database::disconnect();

            if($data['contrasena'] == $_POST['contrasena'] ){
            	session_start();
                $_SESSION['usuario'] = $data['usuario'];
				header('location: ./user_profile.php'); 
            	exit();
            }else{
            	header('location:./error_validacion.html');
            	exit();
            }
            
            
        } 
?>