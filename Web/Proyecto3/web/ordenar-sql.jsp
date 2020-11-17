
<%@page import="java.sql.*" %>
<%@page import ="java.util.* "%>

<%

    String username = session.getAttribute("username").toString();
    String platillo = request.getParameter("platillo");
    
    String estado = "PENDIENTE";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();

    int i = st.executeUpdate( "INSERT INTO Pedido Values (\'" + username + "\',\'" + estado  + "\',\'" + platillo+ ")"
  );
%>

