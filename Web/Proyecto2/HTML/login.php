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
			 		<li><a href="#modal2" class="modal-trigger">Informacion</a></li>
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
	  			<div class="col s1">
	  			</div>

	  			<div class="col s8">
					<div class="row">
						<div class="row">
			  				<div class="col s12 center">
			  					<br>
								<img src="img/usuario.jpg " alt="Inicio" height="300" width="300" >
			  				</div>
							<div class="row">
								<div class="col s12">
			  						<form action = 'validate.php' method = 'POST'>
										<div class="input-field col s12">
										  <input id="icon_prefix" name="usuario" type="text" class="validate">
										  <label for="icon_prefix">Usuario </label>
										</div>

										<div class="input-field col s12">
										  <input id="icon_telephone" type="password" name="contrasena" class="validate">
										  <label for="icon_telephone">Contraseña</label>
										</div>
										<button type="submit" name="submit" class="waves-effect waves-light btn right ptc">Enviar</button> 
			  						</form>
								</div>
							</div>
						</div>
					</div>
	  			</div>
	  			<div class="col s3">
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