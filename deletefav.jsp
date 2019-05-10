<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");

    Class.forName("com.mysql.jdbc.Driver");
    Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/paper", "root", "");
    Statement s = conexion.createStatement();

    String idPap = request.getParameter("fav");
    
    try {
        s.execute("DELETE FROM clientpaper WHERE IdCli = " + session.getAttribute("id") + " AND IdPap = "+ idPap + "");
        session.removeAttribute(idPap);
        response.sendRedirect("papers.jsp");
        conexion.close();
    } catch (Exception e) {
        session.setAttribute("error", "Unable to connect to the database"+e);
        response.sendRedirect("index.jsp");
    }
%>