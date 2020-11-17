
<%@page import="java.sql.*" %>
<%
    session.removeAttribute("user");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
