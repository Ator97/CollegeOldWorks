

<%@page import="java.sql.*" %>
<%
    String cliente = session.getAttribute("username").toString();
    String id_platillo = request.getParameter("platillo");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();

    int i = st.executeUpdate("INSERT INTO Pedido (id_cliente,id_platillo,estado)"
                + " VALUES (\'" + cliente + "\'," + id_platillo + ",\'PENDIENTE\')");
    if (i > 0) {
        response.sendRedirect("pedido.jsp");
    }
    
    else {
        response.sendRedirect("error.jsp");
    }
%>