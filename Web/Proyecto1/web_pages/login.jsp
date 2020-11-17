
<%-- 
    Document   : login
    Created on : 28-oct-2016, 20:35:46
    Author     : bruni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
  <head>
    <meta   charset="UTF-8">
    <title>Inicio</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Share+Tech+Mono" rel="stylesheet">
  </head>
        
  <body class="container-fluid">
    <div id="titulo" class="letra">
                <h1>PROTECO FOOD</h1>
    </div>

       <center>
    <div id="menu" class="letramenu">
      <ul>
        <li class="active"><a class="menu" href="index.jsp">Inicio</a></li>
        <li><a class="menu" href="who_we_are.jsp">¿Quienes somos?</a></li>
        <li><a class="menu" href ="login.jsp">Usuario/Visita</a></li>

      </ul>
    </div>
      
        <div id="menu" class="letramenu">
      <ul>
        <li><a class="menu" href="#">Platillos</a></li>
        <li><a class="menu" href="./registro.jsp">Registrarse</a></li>
      </ul>
    </div>
           
           

        
        
            <div class="row">
                <form class="col s6 ">
                    <div class="row">
                        <div class="input-field col s6" method="POST" action="vista_mesero.jsp">
                            <input  id="first_name" name="user" type="text" class="validate">
                            <label for="first_name">Usuario</label>
                            
                            <input id="password" name="pass" type="password" class="validate">
                            <label for="last_name">Contraseña</label>
                            <!--input type="submit" value="Registrarse"-->
                            <button type="submit">Ingresar</button>
                    </div>
                </form>
            </div>
        </div>
        
        
    <div id="footer" class="letramenu">
      <ul> 
          <li><a class="menu" href="http://www.proteco.mx" target="_blank">Página Oficial</a></li>
          <li><a class="menu" href="https://www.facebook.com/proteco/?fref=ts" target="_blank">Página de Facebook</a></li>      
      </ul>
    </div>
    </center>
  </body>
</html>

