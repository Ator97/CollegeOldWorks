

<%@page import="java.sql.*" %>
<%
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();

    int i = st.executeUpdate("INSERT INTO Cliente (username,password)"
            + " VALUES (\'" + username + "\',\'" + password + "\')");
    if (i > 0) {
        response.sendRedirect("registroexitoso.jsp");
    }
    else {
        response.sendRedirect("error.jsp");
    }
%>


