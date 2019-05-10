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

          String actualizacion = "UPDATE paper SET NomPap='";
          actualizacion += request.getParameter("NomPap");
          actualizacion += "', DesPap='";
          actualizacion += request.getParameter("DesPap");
          actualizacion += "', UrlPap='";
          actualizacion += request.getParameter("UrlPap");
          actualizacion += "' WHERE IdPap=";
          actualizacion += request.getParameter("actualizarpaper");
          s.execute(actualizacion);
          conexion.close();
        %>

        <script>
            //Redirecciona a la página principal
            location.replace("papers.jsp");
        </script>

    </body>
</html>
