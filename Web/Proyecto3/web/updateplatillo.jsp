
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    double precio = Double.parseDouble(request.getParameter("precio"));
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();

    int i = st.executeUpdate("UPDATE Empleado SET "
            + "nombre=" + nombre + ","
            + "descripcion=" + descripcion + ","
            + "precio=" + precio 
            + "WHERE nombre=\'" + nombre + "\'");
    if (i > 0) {
        response.sendRedirect("registroexitoso.jsp");
    }
    else {
        response.sendRedirect("error.jsp");
    }
%>