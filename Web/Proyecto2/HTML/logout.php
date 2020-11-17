<?php
	session_start();
	if( isset($_SESSION['usuario']) ){
		session_unset(); 
		session_destroy();
		header('location:./login.php');
	}
	else{
		header('location:./error.html');	
	}

	exit();
	
?>