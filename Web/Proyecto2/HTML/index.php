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
    <?php
      if( !isset($_SESSION['usuario']) ){
    ?>
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
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio minima quas possimus facilis consequatur facere saepe, totam fuga alias labore! Veritatis quaerat quis iusto adipisci modi atque laboriosam. Veniam facilis commodi exercitationem ducimus laborum expedita at quod eveniet est maiores natus non earum rerum quibusdam, eligendi error nostrum hic, nihil corporis nam magni? Voluptatem velit, consectetur amet commodi consequuntur magni fugit impedit? Sequi optio rem reiciendis aliquid atque maiores neque totam sed ut quidem ad mollitia, ullam unde molestias nihil aliquam fuga placeat nostrum. Voluptate facilis iusto possimus accusantium, minima maiores cumque debitis aperiam natus, ipsa voluptatum nostrum, adipisci soluta.
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
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Distinctio minima quas possimus facilis consequatur facere saepe, totam fuga alias labore! Veritatis quaerat quis iusto adipisci modi atque laboriosam. Veniam facilis commodi exercitationem ducimus laborum expedita at quod eveniet est maiores natus non earum rerum quibusdam, eligendi error nostrum hic, nihil corporis nam magni? Voluptatem velit, consectetur amet commodi consequuntur magni fugit impedit? Sequi optio rem reiciendis aliquid atque maiores neque totam sed ut quidem ad mollitia, ullam unde molestias nihil aliquam fuga placeat nostrum. Voluptate facilis iusto possimus accusantium, minima maiores cumque debitis aperiam natus, ipsa voluptatum nostrum, adipisci soluta.
        </p>
      </div>
      <div class="modal-footer">
        <a href="#" class="modal-action modal-close waves-effect waves-green btn-flat">X</a>
      </div>
    </div>

    <nav class="z-depth-2 blue darken-1" >
      <div class="nav-wrapper">
        <a href="#" class="brand-logo"> <img src="img/logo.png " width="70" height="65">   </a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li class="active"><a href="index.html">Inicio</a></li>
          <li><a href="#modal2" class="modal-trigger">Informacion</a></li>
          <li><a href="#modal1" class="modal-trigger">Historia</a></li>
          <li ><a href="services.html">Servicios</a></li>
          <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Sesion<i class="material-icons right"></i></a></li>
        </ul>
      </div>
    </nav>
    <?php
      }else{
    ?>
    <ul id="dropdown1" class="dropdown-content">
      <li><a href="create_account.php">Apertura</a></li>
      <li class="divider"></li>
      <li><a href="close_account.php">Cierre</a></li>
      <li class="divider"></li>
      <li><a href="account.php">Actualizar</a></li>
      <li class="divider"></li>
    </ul>

    <nav class="z-depth-1 blue darken-1">
      <div class="nav-wrapper">
        <a href="#" class="brand-logo">Logo</a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
          <li class="active"><a href="user_profile.php">Inicio</a></li> 
          <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Cuentas<i class="material-icons right"></i></a></li>     
          <li><a href="modify.php">Mi usuario</a></li>
          <li><a href="user_profile.php">Cuenta</a></li>
          <li><a href="logout.php">Cerrar Sessión</a></li>

        </ul>
      </div>
    </nav>
    <?php
      } 
    ?>

    <!-- Fin del nav -->
    <!-- Inicio del contenido de la pagina -->
    <main>
    <div class="row">
      <div class="col s1">
      </div>
      <div class="col s7">
        <div class="slider">
          <ul class="slides">
            <li><img src="img/img_1.jpeg">
              <div class="caption center-align">
                <h3>¿Aun no te afilias?</h3>
                <h5 class="light grey-text text-lighten-3">Crea tu cuenta ya</h5>
                <a class="waves-effect waves-light btn" href="create.php">Crear</a>
              </li>
              <li>
                <img src="img/img_2.jpeg">
                <div class="caption left-align">
                  <h3>Concenos</h3>
                  <h5 class="light grey-text text-lighten-3"></h5>
                  <a class="waves-effect waves-light btn modal-trigger"" href="#modal1">Ir ya</a>
                </li>
                <li>
                  <img src="img/img_3.jpeg">
                  <div class="caption right-align">
                    <h3>¿Tienes dudas?</h3>
                    <h5 class="light grey-text text-lighten-3">Nosotros te las resolvemos.</h5>
                    <a class="waves-effect waves-light btn" href="services.html">Preguntar</a>
                  </li>
                  <li>
                    <img src="img/img_4.jpeg">
                    <div class="caption center-align">
                      <h3>¿Te preocupa tu privacidad?</h3>
                      <h5 class="light grey-text text-lighten-3">Consulta nuestras clausulas de privacidad y mas</h5>
                      <a class="waves-effect waves-light btn" href="about_us.html">Crear</a>
                    </li>
                  </ul>
                </div>
              </div>
              <script type="text/javascript">
              $(document).ready(function(){
              $('.slider').slider({full_width: true});
              });
              </script>
              <div class="col s4">
                <a class="twitter-timeline" data-width="280" data-height="450" data-theme="dark" data-link-color="#F5F8FA" href="https://twitter.com/TwitterDev">Tweets by TwitterDev</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
              </div>
            </div>
            </main>
            <!--fin del contenido de la pagina-->
            <!-- Inicio del footer -->
            <!-- Inicio del footer -->
            <footer class="page-footer blue darken-1">
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