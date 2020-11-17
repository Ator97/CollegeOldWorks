<%-- 
    Document   : platillos
    Created on : 28/10/2016, 03:22:13 AM
    Author     : dakedekaane
    Descripcion: Página donde se muestran los platillos
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <a href="#!" class="brand-logo center"><img src="img/img_1.jpeg" width="64" height="64"></a>
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
        
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
            Statement st = con.createStatement();
            ResultSet rs;
            rs = st.executeQuery("SELECT * FROM Platillo");
        %>
        <table class="highlight">
            <!--thead>Platillos</thead-->
            <h4>Platillos</h4>
            <thead>
            <tr>
                <th>Imagen</th>
                <th>Nombre platillo</th>
                <th>Descripcion</th>
                <th>Precio</th>
            </tr>
            </thead>
                        <% while(rs.next()){ %>
            <tr>
                <td></td>
                <td> <%= rs.getString(2) %></td>
                <td> <%= rs.getString(3) %></td>
                <td> $<%= rs.getString(4) %></td>
            </tr>
            <% } %>
        </table>
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
    </body>
</html>