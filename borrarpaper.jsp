<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("UTF-8");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/paper", "root", "");
            Statement s = conexion.createStatement();
            try {
                String borrado = "DELETE FROM paper WHERE Idpap=";
                borrado += request.getParameter("borrarpaper");
                s.execute(borrado);
                response.sendRedirect("papers.jsp");
            } catch (com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException e) {
                session.setAttribute("error", "You can't delete a paper wich people currently like and read, in order to do that you must contact with the organizer");
                response.sendRedirect("index.jsp");
            } catch (Exception e) {
                session.setAttribute("error", "Unable to do that, check yourinternet conexion or permissions");
                response.sendRedirect("index.jsp");
            }
            conexion.close();
        %>

    </body>
</html>
