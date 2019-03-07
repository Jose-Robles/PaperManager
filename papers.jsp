
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

        <title>Series</title>

        <!--Bootstrap 3-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


        <!--Bootstrap 4-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


        <!--Enlaces propios-->
        <link rel="stylesheet" type="text/css" href="css/general.css">
        <script type="text/javascript" src="javascript.js"></script>
        <link rel="shortcut icon" href="img/favicon.ico">

        <!--Fontawesome-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">

    </head>
    <body>
        <div class="wrapper">
            <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark">
                <a class="navbar-brand mr-auto mr-lg-0 text-warning" href="index">Paper Manager</a>
                <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="papers">Papers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="clients">Clients</a>
                        </li>
                        <li>
                            <a href="#addEmployeeModal" class="btn btn-secondary" data-toggle="modal"><span>Añadir Paper</span></a>						
                        </li>
                    </ul>
                </div>
            </nav>
            <%
                request.setCharacterEncoding("UTF-8");

                Class.forName("com.mysql.jdbc.Driver");
                Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/paper", "root", "");
                Statement s = conexion.createStatement();

                ResultSet listado = s.executeQuery("SELECT * FROM paper");
            %>

            <div class="container">
                <div class="table-wrapper">
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nombre</th>
                                <th>Descripción</th>
                                <th></th>
                                <th>Link</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                while (listado.next()) {
                            %>
                            <tr>
                                <td><% out.println(listado.getString("IdPap"));  %></td>
                                <td><% out.println(listado.getString("NomPap")); %></td>
                                <td><% out.println(listado.getString("DesPap"));%></td>
                                <td></td>
                                <td><a href="<% out.println(listado.getString("UrlPap"));%>"> <% out.println(listado.getString("UrlPap"));%> </a></td>

                                <td>
                                    <a href="#editEmployeeModal<%= listado.getString("IdPap")%>" class="edit" data-toggle="modal"><i class="fas fa-pencil-alt"></i></a>
                                    <!--Actualizar Serie-->
                                    <div id="editEmployeeModal<%= listado.getString("IdPap")%>" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="actualizarpaper.jsp" method="post">
                                                    <div class="modal-header">						
                                                        <h4 class="modal-title">Editar serie</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <input type="hidden" name="actualizarpaper" value="<%= listado.getString("IdPap")%>">
                                                        <div class="form-group">
                                                            <label>Nombre</label>
                                                            <input type="text" class="form-control" name="NomPap" placeholder="<%= listado.getString("NomPap")%>" name="<%= listado.getString("NomPap")%>" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Descripción</label>
                                                            <input type="text" class="form-control" name="DesPap" placeholder="<%= listado.getString("DesPap")%>" name="<%= listado.getString("DesPap")%>" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Descripción</label>
                                                            <input type="text" class="form-control" name="DesPap" placeholder="<%= listado.getString("UrlPap")%>" name="<%= listado.getString("UrlPap")%>" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                                        <input type="submit" class="btn btn-info" value="Editar">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <a href="#deleteEmployeeModal<%= listado.getString("IdPap")%>" class="delete" data-toggle="modal"><i class="fas fa-bomb"></i></a>

                                    <!--Borrar Serie-->
                                    <div id="deleteEmployeeModal<%= listado.getString("IdPap")%>" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="borraserie.jsp" method="post">
                                                    <div class="modal-header">						
                                                        <h4 class="modal-title">Borrar serie</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>
                                                    <div class="modal-body">					
                                                        <p>¿Seguro que quieres borrar esta serie?</p>
                                                        <p><%= listado.getString("NomPap")%></p>
                                                        <input type="hidden" name="borrarSerie" value="<%= listado.getString("IdPap")%>">
                                                        <p class="text-warning"><small>Una vez hecho no podrá recuperarse.</small></p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                                        <input type="submit" class="btn btn-danger" value="Borrar">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
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

            <!--Añadir Serie-->
            <div id="addEmployeeModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="nuevopaper.jsp" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Añadir Paper</h4>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>Nombre</label>
                                    <input type="text" class="form-control" name="NomPap" required>
                                </div>
                                <div class="form-group">
                                    <label>Descripción</label>
                                    <input type="text" class="form-control" name="DesPap" required>
                                </div>
                                <div class="form-group">
                                    <label>Url</label>
                                    <input type="text" class="form-control" name="DesPap" required>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancelar">
                                <input type="submit" class="btn btn-success" value="Añadir">
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
                        <input type="submit" class="btn-danger btn-lg" value="Volver"> 
                    </div>
                </div>
            </form>
        
    </body>
</html>    
