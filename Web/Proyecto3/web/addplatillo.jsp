

<%@page import="java.sql.*" %>
<%
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String precio = request.getParameter("precio");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();

    int i = st.executeUpdate("INSERT INTO Platillo (nombre,descripcion,precio)"
            + " VALUES (\'" + nombre + "\',\'" + descripcion + "\'," + precio + ")");
    if (i > 0) {
        response.sendRedirect("registroexitoso.jsp");
    }
    else {
        response.sendRedirect("error.jsp");
    }
%>