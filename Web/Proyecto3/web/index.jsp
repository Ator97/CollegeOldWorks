

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
	<!--fin de los scripts-->
    <!--Navbar-->
    <nav>
        <div class="nav-wrapper amber darken-2">
            <ul class="left hide-on-med-and-down">
                <%
                if (session.getAttribute("username") == null) {
                %>
                <li></li>
                <li class="active"><a href="index.jsp">Inicio</a></li>
                <li><a href="platillos.jsp">Platillos</a></li>
                <li><a href="registro.jsp">Regristrarse</a></li>
                <li><a href="login.jsp">Iniciar Sesión</a></li>
                <%
                }
                else if (session.getAttribute("puesto") == null){
                %>
                <li>Excelnte día</li>
                <li class="active"><a href="index.jsp">Inicio</a></li>
                <li><a href="platillos.jsp">Platillos</a></li>
                <li><a href="reservacion.jsp">Regristrarse</a></li>
                <li><a href="ordenar.jsp">Ordenar</a></li>
                <li><a href="historial.jsp">Visitas</a></li>  
                <li><a href="checkout.jsp">Cerrar Sesión</a></li>
                <%
                }
                else if (session.getAttribute("puesto").toString().equals("GERENTE")){
                %>
                <li><a href="./admin-platillos.jsp">Administrar platillos</a></li>
                <li><a href="./admin-meseros.jsp">Administrar meseros</a></li>
                <li><a href="./checkout.jsp">Cerrar sesión</a></li>
                <%
                }
                else if (session.getAttribute("puesto").toString().equals("MESERO")){
                %>
                <li><a href="./pedidos.jsp">Revisar pedidos</a></li>
                <li><a href="./checkout.jsp">Cerrar sesión</a></li>
                <%
               }
                %>             
            </ul>
        </div>
    </nav>
	<!--fin del navbar-->
        
        <div class="col 16">
            <div><!-- class="parallax-container"-->
                <div><!-- class="parallax "-->
                    <center>
                        <img src="img/food1.jpg" style="width:  20% ; height: 20%;">
                    </center>
		</div>
	</div>
           </div>
        
        
	<div class="container" id="info">
		<div>
			<h2 style="text-align: center">Proteco Food</h2>
			<p style="text-align: center">
			 Restaurant de Proteco, especializados en prepara la comida mas nutritiva y deliciosa que podran probar tu y tu familia, amigos o a quien guste acompañarte en esta experiencia culinaria.
			</p>
		</div>
	</div>
	<div class="parallax-container">
		<div class="parallax">
                    <img src="img/food2.jpg">
		</div>
	</div>
		<div class="container" id="info">
		<div>
			<h2 style="text-align: center">Nuestros servicios</h2>
			<p style="text-align: center">
			Contamos con los mejores chefs de toda la región, que estan dispuestos a brindar sus servicios con la mejor actitud.
                        
                        Nuestros meseros y meseras brindan un servicio rapido, elegante y eficiente que no tardaran en llevarte la comida hasta tu mesa.
                        
                        Tambien contamos con el servicio de reservacion, para que tengas ningun incoveniente a la hora de llegar.
			</p>
		</div>
	</div>
        


    <!--Footer -->
    <footer class="page-footer amber darken-2">
      <div class="container">
        <div class="row">

          <div class="col l6 s12">
            <h5 class="white-text">Proteco Food</h5>
            <p class="grey-text text-lighten-4">Proteco Food es una marca mexicana registrada, nos especialiamos en deletitar su paladar y usted a nuestro bolsillo</p>
            <p class="grey-text text-lighten-4">Nuestros horarios son:</p>
            <p class="grey-text text-lighten-4">Lunes a Sábado : 10:00 - 23:00</p>
            <p class="grey-text text-lighten-4">Domingos: 12:00 - 23:00</p>
          </div>

          <div class="col l4 offset-l2 s12">
            <h5 class="white-text">Dirección</h5>
            <p class="grey-text text-lighten-4">Santa Maria la Rivera numero 34, frente al kiosko Morisco, cruzando la avenida</p>
          </div>

        </div>
      </div>
      <div class="footer-copyright">
        <div class="container">
        © 2014 Copyright PROTECO FOOD
        </div>
      </div>
    </footer>
</html>