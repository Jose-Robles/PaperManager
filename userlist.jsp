
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>PaperManager</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

        <!--Enlaces propios-->
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <link rel="shortcut icon" href="img/favicon.ico">

        <!--Fontawesome-->
        <script defer src="https://use.fontawesome.com/releases/v5.8.1/js/all.js" integrity="sha384-g5uSoOSBd7KkhAMlnQILrecXvzst9TdC09/VM+pjDTCM+1il8RHz5fKANTFFb+gQ" crossorigin="anonymous"></script>
    </head>
    <body>
        <%
        %>
        <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-secondary">
            <a class="navbar-brand mr-auto mr-lg-0 text-warning" href="index.jsp"><img style="width: 20vw;" src="css/images/PaperManager.svg"></a>
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault" style="font-size: 2vw">
                <ul class="navbar-nav mr-auto offset-1">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="<%=session.getAttribute("name") == null ? "modal" : ""%>" href="<%=session.getAttribute("name") == null ? "#sign-in" : "#"%>"><i class="fas fa-user-circle" style="color: #17a2b8"></i> <%=session.getAttribute("newuser") == null ? "" : "Welcome "%><%=session.getAttribute("name") == null ? "User" : session.getAttribute("name")%></a><% session.removeAttribute("newuser");%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="papers.jsp"><i class="fas fa-book-reader"></i> Papers</a>
                    </li>

                </ul>
                <ul class="navbar-nav col-4">
                    <li class="nav-item">
                        <a class="nav-link edit" data-toggle="<%=session.getAttribute("name") == null ? "modal" : ""%>" href="<%=session.getAttribute("name") == null ? "#sign-in" : "logout.jsp"%>"><i class="fas <%=session.getAttribute("name") == null ? "fa-user-graduate" : "fa-sign-out-alt"%>" style="color: #28a745"></i> Sign <%=session.getAttribute("name") == null ? "in" : "out"%></a>
                    </li>
                    <li class="nav-item offset">
                        <a class="nav-link edit" data-toggle="modal" <%=session.getAttribute("name") == null ? "href='#sign-up'" : ""%>><i <%=session.getAttribute("name") == null ? "class='fas fa-id-card'" : ""%>></i> <%=session.getAttribute("name") == null ? "Sign up" : ""%></a>
                    </li>
                </ul>
            </div>
        </nav>
        <%
            request.setCharacterEncoding("UTF-8");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/paper", "root", "");
            Statement s = conexion.createStatement();
            String category = "";
            String[] categoryList = {};
            boolean jump = false;
            ResultSet listado;
            try {
                categoryList = request.getParameterValues("category");
            } catch (Exception e) {
                try {
                    category = request.getParameter("category");
                } catch (Exception i) {
                    jump = true;
                }
            }

            String query;
            if (!jump) {
                try {
                    query = "SELECT * FROM paper WHERE IdPap IN (SELECT IdPap FROM clientpaper WHERE IdCli = " + session.getAttribute("id") + ") ORDER BY " + category + " DESC";
                    s.executeQuery(query);
                } catch (Exception e) {
                    try {
                        query = "SELECT * FROM paper WHERE IdPap IN (SELECT IdPap FROM clientpaper WHERE IdCli = " + session.getAttribute("id") + ") ORDER BY ";
                        for (int num = 0; num < categoryList.length; num++) {
                            if (num == categoryList.length - 1) {
                                query += categoryList[num];
                                query += " DESC";
                            } else {
                                query += categoryList[num] + " DESC, ";
                            }
                        }
                        out.println("Este error : " + query + "hola");
                        s.executeQuery(query);
                    } catch (Exception i) {
                        query = "SELECT * FROM paper WHERE IdPap IN (SELECT IdPap FROM clientpaper WHERE IdCli = " + session.getAttribute("id") + ")";
                    }
                }
                listado = s.executeQuery(query);
            } else {
                listado = s.executeQuery("SELECT * FROM paper WHERE IdPap IN (SELECT IdPap FROM clientpaper WHERE IdCli = " + session.getAttribute("id") + ")");
            }

            
            
            final String countQuery = "SELECT IdPap FROM clientpaper WHERE IdCli = ? ";
            PreparedStatement ps = conexion.prepareStatement(countQuery);
            ps.setString(1, (String) session.getAttribute("id"));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                session.setAttribute(rs.getString("IdPap"), "notnull");
            }
            ps.close();

            Statement c = conexion.createStatement();
            ResultSet papersId = c.executeQuery("SELECT IdPap FROM paper");
            final String countQuery2 = "SELECT COUNT(IdPap) as NUM FROM clientpaper WHERE IdPap = ?";

            while (papersId.next()) {
                PreparedStatement ps1 = conexion.prepareStatement(countQuery2);
                ps1.setString(1, papersId.getString("IdPap"));
                ResultSet rs1 = ps1.executeQuery();
                if (rs1.next()) {
                    session.setAttribute("atoms" + Integer.parseInt(papersId.getString("IdPap")), rs1.getString("NUM"));
                } else {
                    session.setAttribute("atoms" + Integer.parseInt(papersId.getString("IdPap")), "0");
                }
            }

        %>

        <div class="container">
            <div class="table-wrapper">
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Synopsis</th>
                            <th></th>
                            <th>Link</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            while (listado.next()) {
                        %>
                        <tr>
                            <td><% out.println(listado.getString("IdPap"));  %></td>
                            <td><% out.println(listado.getString("NomPap")); %></td>
                            <td><% out.println(listado.getString("DesPap"));%></td>
                            <td></td>
                            <td><a href="<% out.println(listado.getString("UrlPap"));%>"> <% out.println(listado.getString("UrlPap"));%> </a></td>

                            <td>
                                <a href="#editPaperModal<%= listado.getString("IdPap")%>" class="edit" data-toggle="modal"><i class="fas fa-pencil-alt"></i></a>
                                <!--Actualizar Paper-->
                                <div id="editPaperModal<%= listado.getString("IdPap")%>" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="actualizarpaper.jsp" method="post">
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Edit paper</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">
                                                    <input type="hidden" name="actualizarpaper" value="<%= listado.getString("IdPap")%>">
                                                    <div class="form-group">
                                                        <label>Name</label>
                                                        <textarea type="text" class="form-control" name="NomPap" name="<%= listado.getString("NomPap")%>" required><%= listado.getString("NomPap")%></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Synopsis</label>
                                                        <textarea type="text" rows="3" class="form-control" rows="3" name="DesPap" name="<%= listado.getString("DesPap")%>" required><%= listado.getString("DesPap")%></textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Link</label>
                                                        <textarea type="text" class="form-control" name="UrlPap" placeholder="<%= listado.getString("UrlPap")%>" name="<%= listado.getString("UrlPap")%>" required></textarea>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Reject">
                                                    <input type="submit" class="btn btn-info" value="Commit changes">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <a href="#deletePaperModal<%= listado.getString("IdPap")%>" class="delete" data-toggle="modal"><i class="fas fa-bomb"></i></a>

                                <!--Borrar Paper-->
                                <div id="deletePaperModal<%= listado.getString("IdPap")%>" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <form action="borrarpaper.jsp" method="post">
                                                <div class="modal-header">						
                                                    <h4 class="modal-title">Delete paper</h4>
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                </div>
                                                <div class="modal-body">					
                                                    <p>¿Are you sure you want to delete this paper?</p>
                                                    <p style="font-style: italic; color: grey"><%= listado.getString("NomPap")%></p>
                                                    <input type="hidden" name="borrarpaper" value="<%= listado.getString("IdPap")%>">
                                                    <p class="text-warning"><small>Once you have done there is <b> no turning back</b>.</small></p>
                                                </div>
                                                <div class="modal-footer">
                                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                    <input type="submit" class="btn btn-danger" value="Delete">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <a style="visibility: <%=session.getAttribute("name") == null ? "hidden" : "visible"%>;" href="<%=session.getAttribute(listado.getString("IdPap")) == null ? "newfav" : "deletefav"%>.jsp?fav=<%= listado.getString("IdPap")%>"><i class="fa<%=session.getAttribute(listado.getString("IdPap")) == null ? "r" : "s fa-2x"%> fa-star" <%=session.getAttribute(listado.getString("IdPap")) == null ? "" : "style='color: #fff351';"%>></i></a>
                                <div style="display: inline-flex; color: darkmagenta;"><i class="fas fa-atom fa-2x"></i> <%=session.getAttribute("atoms" + listado.getString("IdPap"))%></div>
                            </td>
                        </tr>
                        <%
                            }
                            conexion.close();
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <!--Añadir Paper-->
        <div id="addPaperModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="nuevopaper.jsp" method="post">
                        <div class="modal-header">						
                            <h4 class="modal-title">Add new Paper</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name="NomPap" required>
                            </div>
                            <div class="form-group">
                                <label>Synopsis</label>
                                <input type="text" class="form-control" name="DesPap" required>
                            </div>
                            <div class="form-group">
                                <label>Url</label>
                                <input type="text" class="form-control" name="UrlPap" required>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!--Volver al índice-->
        <form action="index.jsp" method="post">
            <div class="col-11">
                <div class="col-xs-6">
                </div>
                <div class="col-xs-2">
                    <input type="submit" class="btn-danger btn-lg come-back" value="Come back"> 
                </div>
            </div>
        </form>
        <div id="sign-in" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-10 mx-auto">
                            <div id="first">
                                <div class="myform form ">
                                    <div class="logo mb-3">
                                        <div class="col-md-12 text-center">
                                            <h1>Login</h1>
                                        </div>
                                    </div>
                                    <form action="login.jsp" method="post" name="login">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" name="useremail"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Password</label>
                                            <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                                        </div>
                                        <div class="form-group">
                                            <p class="text-center">By signing in you accept our <a href="#">Terms Of Use</a></p>
                                        </div>
                                        <div class="col-md-12 text-center ">
                                            <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Login</button>
                                        </div>
                                        <div class="form-group">
                                            <p class="text-center">Don't have account? <a href="#sign-up" data-toggle="modal" id="signup">Sign up here</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="sign-up" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div id="first">
                                <div class="myform form ">
                                    <div class="logo mb-3">
                                        <div class="col-md-12 text-center">
                                            <h1>Register</h1>
                                        </div>
                                    </div>
                                    <form action="signup.jsp" method="post" name="register">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Name</label>
                                            <input type="text" name="username"  class="form-control" id="register-firstname" aria-describedby="emailHelp" placeholder="Nicolas">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Surname</label>
                                            <input type="text" name="surname"  class="form-control" id="register-lastname" aria-describedby="emailHelp" placeholder="Cage">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Email address</label>
                                            <input type="email" name="useremail"  class="form-control" id="email" aria-describedby="emailHelp" placeholder="nicolascage@leavinglasvegas.com">
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1">Password</label>
                                            <input type="password" name="password" id="password"  class="form-control" aria-describedby="emailHelp" placeholder="Enter Password">
                                        </div>
                                        <div class="form-group">
                                            <p class="text-center">By signing up you accept our <a href="#">Terms Of Use</a></p>
                                        </div>
                                        <div class="col-md-12 text-center ">
                                            <button type="submit" class=" btn btn-block mybtn btn-primary tx-tfm">Sign up</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#addPaperModal" class="add-button" data-toggle="modal"><i class="fas fa-plus-circle fa-5x"></i></a>
    </body>
</html>    
