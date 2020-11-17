<?php   
	session_start();

	require 'database.php';
 
	if ( !empty($_POST)) {
	  // érrores de validacion
	  $nameError          = null;
	  $emailError         = null;
	  $a_paternoError     = null;
	  $a_maternoError     = null;
	  $contrasenaError    = null;
	  $contrasenaValError = null;
	  $usuarioError       = null;
		 
	  // guardar valores post
	  $name          = $_POST['name'];
	  $email         = $_POST['email'];
	  $usuario      = $_POST['usuario'];
	  $a_paterno     = $_POST['a_paterno'];
	  $a_materno     = $_POST['a_materno'];
	  $contrasena    = $_POST['contrasena'];
	  $contrasenaVal = $_POST['contrasenaVal'];
		 
	  // validate input
	  $valid = true;
	  if (empty($name)) {
		$nameError = 'Insertar nombre';
		$valid = false;
	  }

	  if (empty($a_paterno)) {
		$a_paternoError = 'Insertar apellido paterno ';
		$valid = false;
	  }

	  if (empty($a_materno)) {
		  $a_materno = '';
	  }

	  if (empty($usuario)) {
		$usuarioError = 'Insertar nombre de usuario';
		$valid = false;
	  }

	  if (empty($email)) {
		$emailError = 'Insertar email';
		$valid = false;
	  } else if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
		$emailError = 'Insertar email valido';
		$valid = false;
	  }
		 
	  if (empty($contrasena)) {
		$contrasenaError = 'Es necesario ingresar una contraseña';
		$valid = false;
	  }
		 
	  if (empty($contrasenaVal)){
		$contrasenaValError = 'Es necesario que verifique la contraseña';
	  }else if(strcmp($contrasena, $contrasenaVal) != 0){
		$contrasenaValError = 'Las contraseñas no coinciden, por favor verifique';
	  }
		// insert data
	  if ($valid) {
		$pdo = Database::connect();
		$pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		$sql = "INSERT INTO usuario (nombre,a_paterno,a_materno,usuario,correo,contrasena) values (?, ?, ?, ?, ?, ?);";
		$q = $pdo->prepare($sql);
		$array = array($name,$a_paterno,$a_materno,$usuario,$email,$contrasena);
		try{
		  $q->execute($array);
		}catch(PDOException $e){
		  echo 'Connection failed: ' . $e->getMessage();
		  echo $contrasena;
		  exit;
		}
		Database::disconnect();

		header("Location: create.php");
		exit();
	  }
	}
?>

<!DOCTYPE html>
<html lang="es">
 	<head>
		<meta charset="utf-8">
		<title>Banjimex</title>
		<link rel="stylesheet" type="text/css" href="css/materialize.min.css">
		<link rel="stylesheet" type="text/css" href="css/styles.css">
 	</head>
 	<body>

		<script src="js/init.js"></script>
		<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="js/materialize.min.js"></script>
		<script src="js/init.js"></script>
		<script type="text/javascript" async src="https://platform.twitter.com/widgets.js"></script>
		<!-- Inicio del nav -->

		<!-- Dropdown Structure -->
		<ul id="dropdown1" class="dropdown-content">
			<li><a href="create.php">Crear Usuario</a></li>
			<li class="divider"></li>
			<li><a href="login.php">Ingresar como usuario</a></li>
			<li class="divider"></li>
		</ul>

		<!-- Modal Historia -->
		<div id="modal1" class="modal">
		 	<div class="modal-content">
				<h4>Historia</h4>
				<p>
			 		Fundado en 1970 somos el banco mas imporante del estado del Plan de Abajo, prestamistas experimentados, especialistas en el orden y el progreso.
				</p>
		  	</div>
		  	<div class="modal-footer">
				<a href="#" class="modal-action modal-close waves-effect waves-green btn-flat">X</a>
		  	</div>
		</div>

		<!-- Modal Informacion -->
		<div id="modal2" class="modal">
		 	<div class="modal-content">
				<h4>Informacion</h4>
				<p>
			 		Banjimex ofrece servicios de primera calidad, apoyandonos de servicios de excelente seguridad para que pueda estar seguro de su dinero, nuestro sistema de transacciones permiten un fácil manejo de sus inversiones
				</p>
		  	</div>
		  	<div class="modal-footer">
				<a href="#" class="modal-action modal-close waves-effect waves-green btn-flat">X</a>
		 	</div>
		</div>

		<nav class="z-depth-2 deep-orange accent-4" >
		 	<div class="nav-wrapper">
				<a href="#" class="brand-logo"> <img src="img/logo.png " width="70" height="65">   </a>
				<ul id="nav-mobile" class="right hide-on-med-and-down">
			  		<li ><a href="index.html">Inicio</a></li>
			 		<li ><a href="#modal2" class="modal-trigger">Informacion</a></li>
					<li><a href="#modal1" class="modal-trigger">Historia</a></li>
			  		<li ><a href="services.html">Servicios</a></li>
			  		<li class="active"><a class="dropdown-button" href="#!" data-activates="dropdown1">Sesion<i class="material-icons right"></i></a></li>
				</ul>
		  	</div>
		</nav>

		<!-- Fin del nav -->

		<!-- Inicio del contenido de la pagina -->

		<main>

			<div class="row">
				<div class="col s1 m1 l1">
				</div>

				<div class="col s8 m8 l8">
	  				<div class="row">
						<div class="col s12 m12 l12">
		  					<div class="row">
								<div class="col s12 center">
									<br>
									<img src="img/usuario.jpg " alt="Inicio" height="300" width="300" >
								</div>
		  					</div>
						</div>
	  				</div>
					<div class="row"> 
		  				<div class="col s12 m12 l12">
							<form  action="create.php" method="post">

			   					<!--para nombre-->
								<div class="control-group <?php echo !empty($nameError)?'error':'';?>">
									<label class="control-label">Nombre</label>
									<div class="controls">
					  					<input id="icon_prefix" name="name" type="text" value="<?php echo !empty($name)?$name:'';?>">
					  					<?php if (!empty($nameError)): ?>
					  					<span class="help-inline"><?php echo $nameError;?></span>
					  					<?php endif; ?>
									</div>
								</div>

							 	<!--para apellido paterno-->
							 	<div class="control-group <?php echo !empty($a_paternoError)?'error':'';?> ">
									<label class="control-label">Apellido Paterno</label>
									<div class="controls">
								  		<input name="a_paterno" type="text" value="<?php echo !empty($a_paterno)?$a_paterno:'';?>">
								 		<?php if (!empty($a_paternoError)): ?>
											<span class="help-inline"><?php echo $a_paternoError;?></span>
								  		<?php endif;?>
									</div>
								</div>

				 				<!--para apellido materno-->
								<div class="control-group <?php echo !empty($a_maternoError)?'error':'';?>">
									<label class="control-label">Apellido Maternos</label>
									<div class="controls">
									 	<input name="a_materno" type="text" value="<?php echo !empty($a_materno)?$a_materno:'';?>">
										<?php if (!empty($a_maternoError)): ?>
										<span class="help-inline"><?php echo $a_maternoError;?></span>
									 	<?php endif;?>
									</div>
								 </div>  

								<!--para  usuario-->
								<div class="control-group <?php echo !empty($usuarioError)?'error':'';?>">
									<label class="control-label">Usuario</label>
									<div class="controls">
									  <input name="usuario" type="text" value="<?php echo !empty($usuario)?$usuario:'';?>">
									  <?php if (!empty($usuarioError)): ?>
										<span class="help-inline"><?php echo $usuarioError;?></span>
									  <?php endif;?>
									</div>
								</div>

								<!--para  email-->
								<div class="control-group <?php echo !empty($emailError)?'error':'';?>">
									<label class="control-label">Correo electronico</label>
									<div class="controls">
									  <input name="email" type="text" value="<?php echo !empty($email)?$email:'';?>">
									  <?php if (!empty($emailError)): ?>
										<span class="help-inline"><?php echo $emailError;?></span>
									  <?php endif;?>
									</div>
								</div>

								<!--Para la contraseña-->
								<div class="control-group <?php echo !empty($contrasenaError)?'error':'';?>">
									<label class="control-label">Contrasena</label>
									<div class="controls">
									  <input name="contrasena" type="password" value="<?php echo !empty($contrasena)?$contrasena:'';?>">
									  <?php if (!empty($contrasenaError)): ?>
										<span class="help-inline"><?php echo $contrasenaError;?></span>
									  <?php endif;?>
									</div>
								</div>

								<!--Para la confirmacion de lacontraseña-->
								<div class="control-group <?php echo !empty($contrasenaValError)?'error':'';?>">
									<label class="control-label">Confirmar contraseña</label>
									<div class="controls">
									  <input name="contrasenaVal" type="password" value="<?php echo !empty($contrasenaVal)?$contrasenaVal:'';?>">
									  <?php if (!empty($contrasenaValError)): ?>
										<span class="help-inline"><?php echo $contrasenaValError;?></span>
									  <?php endif;?>
									</div>
								</div>

						 		<!--botón-->
						  		<div class="form-actions">
									<button type="submit" class="btn btn-success">Crear usuario</button>
						  		</div>
							</form>
		  				</div>
					</div>
				</div>
				<!--Twitter-->

				<div class="col s3">
					<br>

					<a class="twitter-timeline" data-width="280" data-height="450" data-theme="dark" data-link-color="#F5F8FA" href="https://twitter.com/TwitterDev">Tweets by TwitterDev</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
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
		<script type="text/javascript">
			$(document).ready(function(){
			$(".dropdown-button").dropdown();
			});
		</script>
		<script
			async src="//platform.twitter.com/widgets.js" charset="utf-8">
		</script>
		<script type="text/javascript">
			$(document).ready(function(){
			$('.modal-trigger').leanModal();
			});
		</script>
	</body>
</html>