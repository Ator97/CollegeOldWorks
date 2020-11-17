<?php
    session_start();
    if( !isset($_SESSION['usuario']) ){
        header('location: ./index.html');
        exit();
    }
          require 'database.php';

    $pdo = Database::connect();
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $sql = "SELECT * FROM usuario where usuario = ?";
    $q = $pdo->prepare($sql);
    $q->execute(array($_SESSION['usuario']));
    $data = $q->fetch(PDO::FETCH_ASSOC);
    $name = $data['nombre'];
    $a_paterno = $data['a_paterno'];
    $a_materno = $data['a_materno'];
    $correo = $data['correo'];
    $contrasena_master = $data['contrasena'];
    Database::disconnect();

  if (isset($_POST['dates_mail'] ) ) {
    // érrores de validacion
    $mailError          = null;
    $contrasenaError    = null;

    $correo          = $_POST['correo'];
    $contrasena    = $_POST['contrasena'];

    // validate input
    $valid = true;
    if (empty($correo)) {
        $mailError = 'Insertar nuevo correo';
        $valid = false;
    }

    if (empty($contrasena)) {
        $contrasenaError = 'Es necesario ingresar una contraseña';
        $valid = false;
    }else if (strcmp($contrasena, $contrasena_master) != 0){
      $contrasenaError = 'La contraseña no es correcta';
      $valid = false;
    }

    if ($valid) {
      $pdo = Database::connect();
      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $sql = "UPDATE usuario set correo = ? WHERE usuario = ?";
      $q = $pdo->prepare($sql);
      $q->execute(array($correo, $_SESSION['usuario']));
      Database::disconnect();
      header("Location: modify.php");
      exit();
    }
  }
  if (isset($_POST['dates_act'])) {
    // érrores de validacion
    $nameError          = null;
    $a_paternoError     = null;
    $a_maternoError     = null;
    $contrasenaError    = null;

    $name          = $_POST['name'];
    $a_paterno     = $_POST['a_paterno'];
    $a_materno     = $_POST['a_materno'];
    $contrasena    = $_POST['contrasena'];

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

    if (empty($contrasena)) {
        $contrasenaError = 'Es necesario ingresar una contraseña';
        $valid = false;
    }else if (strcmp($contrasena, $contrasena_master) != 0){
      $contrasenaError = 'La contraseña no es correcta';
      $valid = false;
    }

    if ($valid) {
      $pdo = Database::connect();
      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $sql = "UPDATE usuario set nombre = ?, a_paterno = ?, a_materno =? WHERE usuario = ?";
      $q = $pdo->prepare($sql);
      $q->execute(array($name, $a_paterno, $a_materno, $_SESSION['usuario']));
      Database::disconnect();
      header("Location: modify.php");
      exit();
    }
  } 

  if (isset($_POST['dates_pass'] ) ) {
    // érrores de validacion
    $contrasenaError    = null;
    $contrasenaNError = null;
    $contrasenaNValError = null;

    $contrasena    = $_POST['contrasena'];
    $contrasenaN =  $_POST['contrasenaN'];
    $contrasenaNVal = $_POST['contrasenaNVal'];
    $valid = true;

    // validate input

    if (empty($contrasena)) {
        $contrasenaError = 'Es necesario ingresar una contraseña';
        $valid = false;
    }else if (strcmp($contrasena, $contrasena_master) != 0){
      $contrasenaError = 'La contraseña no es correcta';
      $valid = false;
    }

    if (empty($contrasenaN)) {
        $contrasenaNError = 'Es necesario ingresar una contraseña';
        $valid = false;
    }else if (strcmp($contrasena, $contrasenaN) == 0){
      $contrasenaError = 'La contraseña no puede ser igual que la anterior';
      $valid = false;
    } 

    if(empty($contrasenaNVal)) {
        $contrasenaNValError = 'Es necesario ingresar una contraseña';
        $valid = false;
    }else if (strcmp($contrasenaN, $contrasenaNVal) != 0){
      $contrasenaNValError = 'Las contraseñas no coinciden';
      $valid = false;
    }      


    if ($valid) {
      $pdo = Database::connect();
      $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
      $sql = "UPDATE usuario set contrasena = ? WHERE usuario = ?";
      $q = $pdo->prepare($sql);
      $q->execute(array($contrasenaN, $_SESSION['usuario']));
      Database::disconnect();
      header("Location: modify.php");
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
          <li ><a href="user_profile.php">Inicio</a></li> 
            <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Cuentas<i class="material-icons right"></i></a></li>     
            <li class="active"><a href="modify.php">Mi usuario</a></li>
            <li><a href="logout.php">Cerrar Sessión</a></li>
        </ul>
        </div>
    </nav>
   
    <!-- Fin del nav -->
    <!-- Inicio del contenido de la pagina -->
!-- Inicio del contenido de la pagina -->

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

    <form class="form-horizontal" action="modify.php" method="post" name="form1" >
                 <!--para nombre-->
                <div class="control-group <?php echo !empty($nameError)?'error':'';?>">
                  <label class="control-label">Nombre</label>
                    <div class="controls">
                      <i class="material-icons prefix">person</i>
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
            <label class="control-label">Apellido Materno</label>
            <div class="controls">
              <input name="a_materno" type="text" value="<?php echo !empty($a_materno)?$a_materno:'';?>">
              <?php if (!empty($a_maternoError)): ?>
                <span class="help-inline"><?php echo $a_maternoError;?></span>
              <?php endif;?>
            </div>
          </div>

          <!--para apellido materno-->
          <div class="control-group <?php echo !empty($contrasenaError)?'error':'';?>">
            <label class="control-label">Contrseña</label>
            <div class="controls">
              <input name="contrasena" type="password" value="<?php echo !empty($contrasena)?$contrasena:'';?>">
              <?php if (!empty($contrasenaError)): ?>
                <span class="help-inline"><?php echo $contrasenaError;?></span>
              <?php endif;?>
            </div>
          </div>  

          <!--botón-->
          <div class="form-actions">
            <input class="waves-effect waves-light btn" type="submit" name="dates_act" value="Actualizar" >
          </div>
    </form>


    <form class="form-horizontal" action="modify.php" method="post" name="form2" >
                 <!--para correo-->
                <div class="control-group <?php echo !empty($mailError)?'error':'';?>">
                  <label class="control-label">Coreo</label>
                    <div class="controls">
                      <i class="material-icons prefix">person</i>
                      <input id="icon_prefix" name="correo" type="text" value="<?php echo !empty($correo)?$correo:'';?>">
                      <?php if (!empty($mailError)): ?>

                      <span class="help-inline"><?php echo $mailError;?></span>
                      <?php endif; ?>
                    </div>
                </div>

          <!--para apellido materno-->
          <div class="control-group <?php echo !empty($contrasenaError)?'error':'';?>">
            <label class="control-label">Contrseña</label>
            <div class="controls">
              <input name="contrasena" type="password" value="<?php echo !empty($contrasena)?$contrasena:'';?>">
              <?php if (!empty($contrasenaError)): ?>
                <span class="help-inline"><?php echo $contrasenaError;?></span>
              <?php endif;?>
            </div>
          </div>  

          <!--botón-->
          <div class="form-actions">
            <input class="waves-effect waves-light btn" type="submit" name="dates_mail" value="Actualizar" >
          </div>
    </form>


    <form class="form-horizontal" action="modify.php" method="post" name="form3" >

          <!--para contraseña vieja-->
          <div class="control-group <?php echo !empty($contrasenaError)?'error':'';?>">
            <label class="control-label">Contrseña</label>
            <div class="controls">
              <input name="contrasena" type="password" value="<?php echo !empty($contrasena)?$contrasena:'';?>">
              <?php if (!empty($contrasenaError)): ?>
                <span class="help-inline"><?php echo $contrasenaError;?></span>
              <?php endif;?>
            </div>
          </div> 


          <!--para  contraseña nueva-->
          <div class="control-group <?php echo !empty($contrasenaNError)?'error':'';?>">
            <label class="control-label">Contrseña nueva</label>
            <div class="controls">
              <input name="contrasenaN" type="password" value="<?php echo !empty($contrasenaN)?$contrasenaN:'';?>">
              <?php if (!empty($contrasenaNError)): ?>
                <span class="help-inline"><?php echo $contrasenaNError;?></span>
              <?php endif;?>
            </div>
          </div> 


          <!--para rectificacion -->
          <div class="control-group <?php echo !empty($contrasenaNValError)?'error':'';?>">
            <label class="control-label">Rectificacion de la contraseña nueva</label>
            <div class="controls">
              <input name="contrasenaNVal" type="password" value="<?php echo !empty($contrasenaNVal)?$contrasenaNVal:'';?>">
              <?php if (!empty($contrasenaNValError)): ?>
                <span class="help-inline"><?php echo $contrasenaNValError;?></span>
              <?php endif;?>
            </div>
          </div>  

          <!--botón-->
          <div class="form-actions">

            <input class="waves-effect waves-light btn" type="submit" name="dates_pass" value="Actualizar" >
          </div>
    </form>





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