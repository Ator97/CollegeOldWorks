

<%@page import="java.sql.*" %>
<%
    String username = request.getParameter("user");
    String password = request.getParameter("pass");
    
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3305/PROTECOFood","root","");
    
    Statement st = con.createStatement();
    
    ResultSet rs;
    
    rs = st.executeQuery("SELECT * FROM Cliente WHERE username=\'"+username+"\' and password=\'"+password+"\'");
    
    if(rs.next()){
        session.setAttribute("id_cliente",st.executeQuery("SELECT id_cliente FROM Cliente WHERE username=\'" + username + "\'"));
        session.setAttribute("username",username);
        response.sendRedirect("index.jsp");
    }
    else {
        rs = st.executeQuery("SELECT * FROM Empleado WHERE username=\'"+username+"\' and password=\'"+password+"\'");

        if(rs.next()){
            session.setAttribute("username",username);
            session.setAttribute("puesto",rs.getString(5));
            if(session.getAttribute("puesto").toString().equals("MESERO")) {
                
                response.sendRedirect("index.jsp");
            }
            else if(session.getAttribute("puesto").toString().equals("GERENTE")) {
                %>
        test
        <%
                response.sendRedirect("index.jsp");
            }
            
        }
        else {
            response.sendRedirect("error.jsp");
        }
    }

%>