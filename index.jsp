
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="css/index.css">
        <link rel="stylesheet" href="css/general.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script defer src="https://use.fontawesome.com/releases/v5.8.1/js/all.js" integrity="sha384-g5uSoOSBd7KkhAMlnQILrecXvzst9TdC09/VM+pjDTCM+1il8RHz5fKANTFFb+gQ" crossorigin="anonymous"></script>

        <title>Paper menu</title>
    </head>
    <body>
        <div class="alert alert-warning" role="alert" style="color: red; margin-top: <%=session.getAttribute("error") == null ? "" : "7vw"%>;text-align: center">
            <p>
                <%=session.getAttribute("error") == null ? "" : session.getAttribute("error")%>
                <%session.removeAttribute("error");%>
            </p>
        </div>

        <nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-secondary">
            <a class="navbar-brand mr-auto mr-lg-0 text-warning" href="index.jsp"><img style="width: 20vw;" src="css/images/PaperManager.svg"></a>
            <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault" style="font-size: 2vw">
                <ul class="navbar-nav mr-auto offset-1">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="<%=session.getAttribute("name") == null ? "modal" : ""%>" href="<%=session.getAttribute("name") == null ? "#sign-in" : "userlist.jsp"%>"><i class="fas fa-user-circle" style="color: #17a2b8"></i> <%=session.getAttribute("newuser") == null ? "" : "Welcome "%><%=session.getAttribute("name") == null ? "User" : session.getAttribute("name")%></a><% session.removeAttribute("newuser"); %>
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



        <div class="position-relative overflow-hidden p-3 p-md-5 m-md-3 text-center bg-light" id="header">
            <div class="col-sm-7 col-md-6 p-lg-5 mx-auto my-5 text-warning" style="border-radius: 6vw;border:solid black 5px; background-image: url('images/noiseTexture (4).png');background-size: contain;">
                <h1 class="display-4 font-weight-normal">Paper Manager!</h1>
                <p class="lead font-weight-normal text-danger"><marquee><b> Your website where YOU decide what YOU read about. Take a look and make your brain unstoppable!</b></marquee></p>
                <a class="btn btn-outline-secondary" href="papers.jsp" style="margin-bottom: 1vw; background-color: rgba(39, 92, 128, 0.562)"><div id="blackText">See all</div></a>
            </div>
        </div>
        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <a href="papers.jsp?category=Bio">
                <div style="border-radius: 4vw 4vw 0 0;" class="bg-success mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                    <div class="my-3 py-3">
                        <h2 class="display-5">Biology</h2>
                        <p class="lead">Gene expression, molecular dinamics...</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="biology" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
            <a href="papers.jsp?category=Eco">
                <div style="border-radius: 4vw 4vw 0 0;" class="bg-info mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-body overflow-hidden">
                    <div class="my-3 p-3">
                        <h2 class="display-5">Economy</h2>
                        <p class="lead">Bayesian Inference, data analysis, volatility coefficients...</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="economy" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <a href="papers.jsp?category=Mat">
                <div style="border-radius: 4vw 4vw 0 0;" class="bg-warning mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                    <div class="my-3 p-3">
                        <h2 class="display-5">Maths</h2>
                        <p class="lead">Symplectic geometry, geometric topology, Optimization and Control...</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="maths" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
            <a href="papers.jsp?category=Phy">
                <div style="border-radius: 4vw 4vw 0 0;" class="bg-secondary mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                    <div class="my-3 py-3">
                        <h2 class="display-5">Physics</h2>
                        <p class="lead">Cosmology, condensed matter, quantum physics...</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="physics" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <a href="papers.jsp?category=Pol">
                <div style="border-radius: 4vw 4vw 0 0;" class="bg-primary mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                    <div class="my-3 p-3">
                        <h2 class="display-5">Politics</h2>
                        <p class="lead">Fake news, KnowBias, Algorithmic Regulation...</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="politics" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
            <a href="papers.jsp?category=Psi">
                <div style="border-radius: 4vw 4vw 0 0;" class="bg-pink mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                    <div class="my-3 py-3">
                        <h2 class="display-5">Psychology</h2>
                        <p class="lead">Cognitive neuroscience, epilepsy...</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="psicology" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
        </div>

        <footer class="container py-5">
            <div class="row">
                <div class="col-6 col-md">
                    <h5>Features</h5>
                    <ul class="list-unstyled text-small">
                        <li><a class="text-muted" href="#">Cool stuff</a></li>
                        <li><a class="text-muted" href="#">Random feature</a></li>
                        <li><a class="text-muted" href="#">Team feature</a></li>
                        <li><a class="text-muted" href="#">Stuff for developers</a></li>
                        <li><a class="text-muted" href="#">Another one</a></li>
                        <li><a class="text-muted" href="#">Last time</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>Resources</h5>
                    <ul class="list-unstyled text-small">
                        <li><a class="text-muted" href="#">Resource</a></li>
                        <li><a class="text-muted" href="#">Resource name</a></li>
                        <li><a class="text-muted" href="#">Another resource</a></li>
                        <li><a class="text-muted" href="#">Final resource</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>Resources</h5>
                    <ul class="list-unstyled text-small">
                        <li><a class="text-muted" href="#">Business</a></li>
                        <li><a class="text-muted" href="#">Education</a></li>
                        <li><a class="text-muted" href="#">Government</a></li>
                        <li><a class="text-muted" href="#">Gaming</a></li>
                    </ul>
                </div>
                <div class="col-6 col-md">
                    <h5>About</h5>
                    <ul class="list-unstyled text-small">
                        <li><a class="text-muted" href="#">Team</a></li>
                        <li><a class="text-muted" href="#">Locations</a></li>
                        <li><a class="text-muted" href="#">Privacy</a></li>
                        <li><a class="text-muted" href="#">Terms</a></li>
                    </ul>
                </div>
            </div>
        </footer>
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
                                            <input type="text" name="surname"  class="form-control" id="register-lastsurname" aria-describedby="emailHelp" placeholder="Cage">
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
    </body>
</html>
