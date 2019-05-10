<%@page import="java.sql.PreparedStatement"%>
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
    PreparedStatement ps = conexion.prepareStatement("SELECT IdCli FROM client WHERE email = ?");

    String username = request.getParameter("username");
    String surname = request.getParameter("surname");
    String useremail = request.getParameter("useremail");
    String password = request.getParameter("password");
    
    try {
        s.execute("INSERT INTO client (NomCli, ApeCli, email, password) VALUES ('" + username + "', '" + surname + "', '" + useremail + "', '" + password + "')");
        session.setAttribute("newuser", true);
        session.setAttribute("useremail", useremail);
        session.setAttribute("name", username);
        ps.setString(1, useremail);
        ResultSet rs = ps.executeQuery();
        rs.next();
        session.setAttribute("id", rs.getString("IdCli"));
        response.sendRedirect("index.jsp");
    } catch (Exception e) {
        session.setAttribute("error", "Unable to register to the database, please try later."+e);
        response.sendRedirect("index.jsp");
    }
%>