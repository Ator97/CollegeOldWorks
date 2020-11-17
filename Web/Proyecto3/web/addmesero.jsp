

<%@page import="java.sql.*" %>
<%
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    String nombre = request.getParameter("nombre");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();

    int i = st.executeUpdate("INSERT INTO Empleado (username,password,nombre,puesto)"
            + " VALUES (\'" + username + "\',\'" + password + "\',\')" + nombre + "\',\'MESERO')");
    if (i > 0) {
        response.sendRedirect("registroexitoso.jsp");
    }
    else {
        response.sendRedirect("error.jsp");
    }
%>