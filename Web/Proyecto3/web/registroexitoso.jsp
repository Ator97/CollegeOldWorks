
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <title>Proteco Food</title>
    <link rel="stylesheet" type="text/css" href="css/materialize.min.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    

</head>
<body>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!--script type="text/javascript" src="js/jquery-migrate-3.0.0.js"></script-->
    <script type="text/javascript" src="js/materialize.js"></script>
    <script>
        $(document).ready(function(){
            $('.parallax').parallax();
            $(".button-collapse").sideNav();
            $('.modal-trigger').leanModal();
        });
    </script>
        
      <div class="row">
        <div class="col s12 m6">
          <div class="card blue-grey darken-1">
            <div class="card-content white-text">
              <span class="card-title">¡Exito!</span>
              <p>El proceso de registro a sido exitoso. Da click para continuar.</p>
            </div>
              <div class="card-action">
              <a href="./index.jsp">Continuar</a>
            </div>
          </div>
        </div>
      </div>
        
    </body>
</html>