

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id_pedido");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();

    st.executeUpdate("UPDATE Pedido SET "
            + "estado=\'SERVIDO\'"
            + "WHERE id_pedido=" + id + ";");%>
            <%=id%>
                    <%
    
    //response.sendRedirect("pedidos.jsp");
        
%>