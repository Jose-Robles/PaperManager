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
    String useremail = request.getParameter("useremail");
    String password = request.getParameter("password");
    ResultSet rs = s.executeQuery("SELECT * FROM client WHERE email='" + useremail + "'");
    try {
        if (rs.next() && password.equals(rs.getString("password"))) {
            session.setAttribute("useremail", useremail);
            session.setAttribute("name", rs.getString("NomCli"));
            session.setAttribute("id", rs.getString("IdCli"));
            response.sendRedirect("index.jsp");
        } else {
            session.setAttribute("error", "Incorrect user or password, try again");
            response.sendRedirect("index.jsp");
        }
    } catch (Exception e) {
        session.setAttribute("error", "Incorrect user or password, try again"+e);
        response.sendRedirect("index.jsp");
    }
    s.close();
%>