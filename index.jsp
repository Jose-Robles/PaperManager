
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/index.css">
        <script src="js/offcanvas.js"></script>
        <title>Paper menu</title>
    </head>
    <body>
        
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
            <a href="see_paper&category=Bio">
                <div class="bg-success mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                    <div class="my-3 py-3">
                        <h2 class="display-5">Biology</h2>
                        <p class="lead">And an even wittier subheading.</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="biology" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
            <a href="see_paper&category=Eco">
                <div class="bg-info mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-body overflow-hidden">
                    <div class="my-3 p-3">
                        <h2 class="display-5">Economy</h2>
                        <p class="lead">And an even wittier subheading.</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="economy" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <a href="see_paper&category=Mat">
                <div class="bg-warning mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                    <div class="my-3 p-3">
                        <h2 class="display-5">Maths</h2>
                        <p class="lead">And an even wittier subheading.</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="maths" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
            <a href="see_paper&category=Phy">
                <div class="bg-secondary mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                    <div class="my-3 py-3">
                        <h2 class="display-5">Physics</h2>
                        <p class="lead">And an even wittier subheading.</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="physics" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
        </div>

        <div class="d-md-flex flex-md-equal w-100 my-md-3 pl-md-3">
            <a href="see_paper&category=Pol">
                <div class="bg-primary mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center text-white overflow-hidden">
                    <div class="my-3 p-3">
                        <h2 class="display-5">Politics</h2>
                        <p class="lead">And an even wittier subheading.</p>
                    </div>
                    <div class="shadow-sm mx-auto" id="politics" style="width: 95%; height: 300px; border-radius: 21px 21px 0 0;"></div>
                </div>
            </a>
            <a href="see_paper&category=Psi">
                <div class="bg-pink mr-md-3 pt-3 px-3 pt-md-5 px-md-5 text-center overflow-hidden">
                    <div class="my-3 py-3">
                        <h2 class="display-5">Psicology</h2>
                        <p class="lead">And an even wittier subheading.</p>
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
    </body>
</html>
