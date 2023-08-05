<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>Grid</title>


    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicons/favicon.ico">
    <link rel="manifest" href="assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">


    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="assets/lib/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet">
    <link href="assets/lib/unicons/css/unicons.css" rel="stylesheet">
    <link href="assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
    <link href="assets/css/theme.css" rel="stylesheet">

  </head>


  <body>

    <!-- ===============================================-->
    <!--    Main Content-->
    <!-- ===============================================-->
    <main class="main" id="top">
      <div id="preloader">
        <div class="line-scale">
          <div></div>
          <div></div>
          <div></div>
          <div></div>
        </div>
      </div>
      <nav class="navbar navbar-expand-lg navbar-light navbar-top bg-light fs--1 fixed-top py-0 pl-0"><a class="navbar-brand navbar-brand-custom" href="/">
          <div class="logo-icon"><span class="uil uil-apps text-light fs--1" aria-hidden="true"></span></div><span class="text-light ml-2 fs-1"><strong>Grid</strong>Works</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-vertical-collapse" aria-controls="navbar-vertical-collapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse align-items-center py-2" id="topnav">
          <ul class="navbar-nav align-items-center">
            <li class="dropdown nav-item mr-2"><a class="nav-link" href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <div class="avatar avatar-xl">
                  <img class="rounded-circle" src="assets/img/icons/user-icon.png" alt="" />

                </div>
              </a>
              <div class="dropdown-menu dropdown-center py-0" aria-labelledby="navbarDropdownUser">
                <div class="bg-white rounded-soft py-2">
                  <a class="dropdown-item font-weight-bold text-primary" href="#!"><span>Purchage Now</span></a>

                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#!">Set status</a>
                  <a class="dropdown-item" href="#!">Profile &amp; account</a>
                  <a class="dropdown-item" href="#!">Feedback</a>

                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#!">Settings</a>
                  <a class="dropdown-item" href="#!">Logout </a>
                </div>
              </div>
            </li>
            <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-twitter fs-2"></span></a></li>
            <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-facebook-f fs-2"></span></a></li>
            <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-instagram-alt fs-2"> </span></a></li>
            <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-google-drive fs-2">     </span></a></li>
          </ul>
          <form class="mailbluster-subscribe form-inline ml-auto">
            <div class="mailbluster-feedback"></div>
            <input type="hidden" value="Thank you so much for subscribing!" />
            <div class="input-group-icon">
              <input class="form-control form-control-lg input-box" type="email" placeholder="Email Address" aria-label="Email" required="" /><span class="uil uil-envelope fs-2 input-box-icon"></span>
            </div>
            <button class="btn btn-light btn-lg border-primary text-primary ml-3" type="submit">Stay Updated</button>
          </form>
        </div>
      </nav>
      <nav class="navbar navbar-vertical navbar-light bg-white">
        <div class="collapse navbar-collapse align-items-center perfect-scrollbar scrollbar" id="navbar-vertical-collapse">
          <div class="d-flex d-md-block flex-column mt-2">
            <ul class="navbar-nav align-items-center navbar-social-icons">
              <li class="dropdown nav-item mr-2"><a class="nav-link" href="#" id="navbarDropdownUserResponsive" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <div class="avatar avatar-xl">
                    <img class="rounded-circle" src="assets/img/icons/user-icon.png" alt="" />

                  </div>
                </a>
                <div class="dropdown-menu dropdown-center py-0" aria-labelledby="navbarDropdownUserResponsive">
                  <div class="bg-white rounded-soft py-2">
                    <a class="dropdown-item font-weight-bold text-primary" href="#!"><span>Purchage Now</span></a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#!">Set status</a>
                    <a class="dropdown-item" href="#!">Profile &amp; account</a>
                    <a class="dropdown-item" href="#!">Feedback</a>

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#!">Settings</a>
                    <a class="dropdown-item" href="#!">Logout </a>
                  </div>
                </div>
              </li>
              <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-twitter fs-2"></span></a></li>
              <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-facebook-f fs-2"></span></a></li>
              <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-instagram-alt fs-2"> </span></a></li>
              <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-google-drive fs-2">     </span></a></li>
            </ul>
            <form class="mailbluster-subscribe navbar-email-form float-right order-1 order-md-0">
              <div class="mailbluster-feedback"></div>
              <input type="hidden" value="Thank you so much for subscribing!" />
              <div class="row no-gutters">
                <div class="col-12 col-md-auto px-md-2">
                  <div class="input-group-icon">
                    <input class="form-control form-control-lg input-box" type="email" placeholder="Email Address" aria-label="Email" required="" /><span class="uil uil-envelope fs-2 input-box-icon"></span>
                  </div>
                </div>
                <div class="col-12 col-md-auto">
                  <button class="btn btn-block btn-light btn-lg border-primary text-primary mt-2 mt-md-0" type="submit">Stay Updated</button>
                </div>
              </div>
            </form>
            <ul class="navbar-nav navbar-nav-vertical flex-row">
              <li class="nav-item"><a class="nav-link" href="/"><span class="icons fs-3 uil uil-home-alt"></span><span class="fs--1"> Home</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-services" data-toggle="modal"><span class="icons fs-3 uil uil-bolt"></span><span class="fs--1"> Services</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-contacts" data-toggle="modal"><span class="icons fs-3 uil uil-phone"></span><span class="fs--1"> Contacts</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-components" data-toggle="modal"><span class="icons fs-3 uil uil-cog"></span><span class="fs--1"> Components</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-utilities" data-toggle="modal"><span class="icons fs-3 uil uil-wrench"></span><span class="fs--1"> Utilities</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-documentation" data-toggle="modal"><span class="icons fs-3 uil uil-clipboard-notes"></span><span class="fs--1"> Documentation</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-fire"></span><span class="fs--1"> Features</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-shopping-bag"></span><span class="fs--1"> Cart</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-pen"></span><span class="fs--1"> Blog</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-flower"></span><span class="fs--1"> About</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-swatchbook"></span><span class="fs--1"> Portfolio</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-usd-circle"></span><span class="fs--1"> Pricing</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-unlock"></span><span class="fs--1"> Terms</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-comment-dots"></span><span class="fs--1"> Support</span></a>
              </li>
            </ul><a class="footer-text order-2 order-md-0" href="https://themewagon.com/">Made with <span class="uil uil-heart-alt fs-1 text-info"></span>by ThemeWagon </a>
          </div>
        </div>
      </nav>
      <c:choose>
        <c:when test="${center==null}">
          <jsp:include page="center.jsp"/>
        </c:when>
        <c:otherwise>
          <jsp:include page="${center}.jsp"/>
        </c:otherwise>
      </c:choose>
    </main>
    <!-- ===============================================-->
    <!--    End of Main Content-->
    <!-- ===============================================-->




    <!-- ===============================================-->
    <!--    JavaScripts-->
    <!-- ===============================================-->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/lib/is/is.min.js"></script>
    <script src="assets/lib/stickyfilljs/stickyfill.min.js"></script>
    <script src="assets/lib/sticky-kit/sticky-kit.min.js"></script>
    <script src="assets/lib/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARdVcREeBK44lIWnv5-iPijKqvlSAVwbw&callback=initMap" async></script>
    <script src="assets/js/theme.js"></script>

  </body>

</html>