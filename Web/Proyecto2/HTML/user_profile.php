<?php
	session_start();
	if( !isset($_SESSION['usuario']) ){
		header('location: ./index.html');
		exit();
	}
?>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<title>Banjimex</title>
		<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
		<link rel="stylesheet" type="text/css" href="css/styles.css">
		<script src="js/init.js"></script> 
	</head>
	<body>
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>
		<script src="js/init.js"></script>
		<script type="text/javascript" async src="https://platform.twitter.com/widgets.js"></script>

		<!-- Inicio del nav -->
	  	<!-- Dropdown Structure -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="create_account.php">Apertura</a></li>
			<li class="divider"></li>
			<li><a href="close_account.php">Cierre</a></li>
			<li class="divider"></li>
			<li><a href="account.php">Actualizar</a></li>
			<li class="divider"></li>
		</ul>

		<nav class="z-depth-1 deep-orange accent-4">
			<div class="nav-wrapper">
				<a href="#" class="brand-logo"> <img src="img/logo.png " width="70" height="65">   </a>        
				<ul id="nav-mobile" class="right hide-on-med-and-down">  
					<li class="active"><a href="user_profile.php">Inicio</a></li> 
				  	<li><a class="dropdown-button" href="#!" data-activates="dropdown1">Cuentas<i class="material-icons right"></i></a></li>     
				  	<li><a href="modify.php">Mi usuario</a></li>
				  	<li><a href="logout.php">Cerrar Sessión</a></li>
				</ul>
		  	</div>
		</nav>
	 
		<!-- Fin del nav -->
		<!-- Inicio del contenido de la pagina -->

		<main>
			<div class="row">
				<div class="col s3">
					<div class="row">
						<div class="col s12 m12">
							<div class="card deep-orange accent-4">
								<div class="card-content white-text">
									<span class="card-title">Cuentas</span>
									<p>Del lado izquierdo usted podrá ver el estado de sus cuentas.</p>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col s12 m12">
							<div class="card deep-orange accent-4">
								<div class="card-content white-text">
									<span class="card-title">Prestamos</span>
									<p>Del lado derecho podrá pedir prestamos para sus cuentas.</p>
								</div>
							</div>
						</div>
					</div>


					<div class="row">
						<div class="col s12 m12">
							<div class="card deep-orange accent-4">
								<div class="card-content white-text">
									<span class="card-title">Mas opciones</span>
									<p>Para todas las demás acciones podrá interactuar con los menus de arriba</p>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col s6">
					<div class="row">
						<div class="col s3">
						</div>
						<div class="col s6">
							<table class="table center">
								<thead>
									<tr>
										<th>Nombre</th>
										<th>Cantidad</th>
									</tr>
								</thead>
								<tbody>
									<?php
										include 'database.php';
										$pdo = Database::connect();
										$user =$_SESSION['usuario'];

									$sql = "SELECT * FROM saldo WHERE usuario= '" .mysql_real_escape_string($_SESSION['usuario']). "'";
										$saldo = 0;
										// query ejecuta una sentencia SQL, devolviendo un conjunto de resultados
										foreach ($pdo->query($sql) as $row) {
											echo '<tr>';
											echo '<td>'. $row['nombre_saldo'] . '</td>';
											echo '<td>'. $row['saldo'] . '</td>';
											echo '</tr>';
											$saldo = $saldo + $row['saldo'];
										}
											echo '<tr>';
											echo '<td>TOTAL</td>';
											echo '<td>'.$saldo.'</td>';
											echo '</tr>';
										Database::disconnect();
									?>
								</tbody>
							</table>
						</div>
						<div class="col s3"></div>
					</div>
				</div>
				<div class="col s3">

					<div class="row">
						<div class="col s12 m12">
							<div class="card deep-orange accent-4">
								<div class="card-content white-text">
									<span class="card-title">¿Cambio de datos personales?</span>
									<p>Recuerde que en la pestaña de Mi Usuario ested podrá cambiar sus datos</p>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col s12 m12">
							<div class="card deep-orange accent-4">
								<div class="card-content white-text">
									<span class="card-title">Aperturas</span>
									<p>En la pestaña de cuentas podrá manejar sus cuentas</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	   </main>


		<!--fin del contenido de la pagina-->

		<!-- Inicio del footer -->
		<footer class="page-footer deep-orange accent-4">
		  <div class="container">
			<div class="row">
			  <div class="col l4 m12 s12">
				<h5 class="white-text">Encuentranos en</h5>
				  <p class="grey-text text-lighten-4">Esta es una diccion abosultamente falsa.</p>
			  </div>
			  <div class="col l4 m12 s12">
				<h5 class="white-text">Redes sociales</h5>
				  <ul>
					<li><a class="grey-text text-lighten-3" href="http://www.facebook.com">Siguenos en  Facebook</a></li>
					<li><a class="grey-text text-lighten-3" href="http://www.twitter.com">Siguenos en   Twitter</a></li>
				  </ul>
			  </div>
			  <div class="col l4 m12 s12">
				  <h5 class="white-text"> Deja un mensaje</h5>
				<form>
				  <div class="input-field ">
					<input id="first_name" type="text" class="validate white-text">
					<label class="white-text" for="first_name">Nombre</label>
				  </div>
				  <div class="input-field">
					<textarea id="textarea1" class="materialize-textarea white-text"></textarea>
					<label class="white-text" for="textarea1">Mensaje</label>
				  </div>
				  <button type="submit" name="submit" class="waves-effect waves-light btn right ptc">Enviar</button>
				</form>
			  </div>

			</div>
		  </div>

		  <div class="footer-copyright">
			<div class="container">
			  Copyright  2016 Grupos financieros banjimex
			  <a class="grey-text text-lighten-4 right" href="about_us.html" target="_blank">About us</a>
			</div>
		  </div>
		</footer> 
		<!-- Fin del footer -->

		<!-- Scripts -->
  		<script type="text/javascript">
			$(document).ready(function(){
  			$(".dropdown-button").dropdown();
		  	});
	  	</script>

	  	<script type="text/javascript">
			$(document).ready(function(){
	  		$('.modal-trigger').leanModal();
			});
	  	</script>
  	</body>

 </html>