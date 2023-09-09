<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/6.5.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-messaging.js"></script>

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>KB Maestro</title>

    <link rel="icon" sizes="180x180"  href="/assets/img/logos/kbmlogo.png"/>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
<%--    <link rel="apple-touch-icon" sizes="180x180" href="/assets/img/favicons/apple-touch-icon.png">--%>
<%--    <link rel="icon" type="image/png" sizes="32x32" href="/assets/img/favicons/favicon-32x32.png">--%>
<%--    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicons/favicon-16x16.png">--%>
<%--    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicons/favicon.ico">--%>
    <link rel="manifest" href="/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">

    <%--jquery와 부트스트랩--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="/assets/lib/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet">
    <link href="/assets/lib/unicons/css/unicons.css" rel="stylesheet">
    <link href="/assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
    <link href="/assets/css/theme.css" rel="stylesheet">

  </head>

  <script>
    $(function () {
      let web = null;
      function getBrowserName ()
      {
        //agent에 브라우저 종류 삽입
        var agent = navigator.userAgent.toLowerCase();
        if(  (navigator.appName == 'Netscape'
                && navigator.userAgent.search('Trident') != -1
                || (agent.indexOf("msie") != -1)  )){

          return "ie";
        } else if ( agent.indexOf("chrome") != -1 ) {

          return "chrome";
        } else if ( agent.indexOf("safari") != -1 ) {

          return "safari";
        } else if ( agent.indexOf("firefox") != -1 ) {

          return "firefox";
        }
      }
      let firebaseConfig = {
        //cloud 게시시 키 변수 셋팅으로 진행 예정
        <%--apiKey: "<c:out value='${apiKey}' />",--%>
        <%--authDomain: "<c:out value='${authDomain}' />",--%>
        <%--projectId: "<c:out value='${projectId}' />",--%>
        <%--storageBucket: "<c:out value='${storageBucket}' />",--%>
        <%--messagingSenderId: "<c:out value='${messagingSenderId}' />",--%>
        <%--appId: "<c:out value='${appId}' />",--%>
        <%--measurementId: "<c:out value='${measurementId}' />"--%>
        apiKey: "AIzaSyCfchQsojha5qRfexQ7faKMa0p4ebjH260",
        authDomain: "nwitter-4c3ea.firebaseapp.com",
        projectId: "nwitter-4c3ea",
        storageBucket: "nwitter-4c3ea.appspot.com",
        messagingSenderId: "613082594223",
        appId: "1:613082594223:web:54d455061bff28bb9c0d5a",
        measurementId: "G-KH0RN141KL"
      };
      web = getBrowserName();
      console.log(web);
      // Initialize Firebase
      firebase.initializeApp(firebaseConfig);

      // Show Notification
      // 메시지 기능 활성화를 알림
      const messaging = firebase.messaging();
      // RequestPermission 첫 어플 시작 시 알림 허용 or 불허를 사용자에게 안내합니다.
      // 허용하지 않을 시 알람 메시지는 가지 않습니다.
      messaging.requestPermission()
              .then(function () {
                // 알람이 허용되었을 때 토큰을 반환합니다.
                // 해당 토큰을 통해 FCM 특정 사용자에게 메시지를 보낼 수 있습니다.
                return messaging.getToken();
              })
              .then(async function (token) {
                console.log(token);
                $.ajax({
                  method:'post',
                  url:'/token',
                  data : {token : token, web : web}
                })
                // 해당 onMessage는 데이터메시지로, 포그라운드인 상태에서
                // FCM 메시지를 전송하는 경우 콘솔에 표기하도록 작성된 코드입니다.

                //************************//
                // messaging.onMessage(payload => {
                //     Swal.fire({
                //         title: payload.notification.title,
                //         text: payload.notification.body,
                //         imageUrl : 'https://help.miricanvas.com/hc/article_attachments/4403560627353/_____________4_.png',
                //         // imageUrl: 'https://unsplash.it/400/200',
                //         imageWidth: 400,
                //         imageHeight: 200,
                //         imageAlt: 'Custom image',
                //         showClass: {
                //             popup: 'animate__animated animate__fadeInDown'
                //         },
                //         hideClass: {
                //             popup: 'animate__animated animate__fadeOutUp'
                //         }
                //     })
                // })
                //************************//

                messaging.onMessage(payload => {
                  Swal.fire({
                    title: payload.notification.title,
                    text: payload.notification.body,
                    imageUrl: 'https://thumbs.dreamstime.com/z/projects-concept-black-chalkboard-d-rendering-handwritten-top-view-office-desk-lot-business-office-supplies-79906734.jpg?w=1200',
                    imageWidth: 400,
                    imageHeight: 200,
                    imageAlt: 'Custom image',
                    toast: true,
                    position: 'top-end',
                    showConfirmButton: false,
                    timer: 5000,
                    timerProgressBar: true,
                    showClass: {
                      popup: 'animate__animated animate__fadeInDown'
                    },
                    hideClass: {
                      popup: 'animate__animated animate__fadeOutUp'
                    }
                  });
                });
              })
    });
  </script>

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
          <div class="logo-icon"><span class="uil uil-apps text-light fs--1" aria-hidden="true"></span></div><span class="text-light ml-2 fs-1"><strong>KB</strong> 마에스트로</span>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-vertical-collapse" aria-controls="navbar-vertical-collapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse align-items-center py-2" id="topnav">
          <ul class="navbar-nav align-items-center">
            <li class="dropdown nav-item mr-2"><a class="nav-link" href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <div class="avatar avatar-xl">
                  <img class="rounded-circle" src="assets/img/icons/user-icon.jpg" alt="user-icon" />

                </div>
              </a>
              <div class="dropdown-menu dropdown-center py-0" aria-labelledby="navbarDropdownUser">
                <div class="bg-white rounded-soft py-2">
                  <a class="dropdown-item font-weight-bold text-primary" href="#!"><span>Purchage Now</span></a>

                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="/login">Login</a>
                  <a class="dropdown-item" href="/account">Profile &amp; account</a>
                  <a class="dropdown-item" href="/form">등록</a>

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

          <div>
            <img src="assets/img/icons/row.png" alt="img" />
          </div>

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
              <li class="nav-item"><a class="nav-link" href="/"><span class="icons fs-3 uil uil-home-alt"></span><span class="fs--1"> 메인</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-contacts" data-toggle="modal"><span class="icons fs-3 uil uil-phone"></span><span class="fs--1">모집중 Project</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-utilities" data-toggle="modal"><span class="icons fs-3 uil uil-wrench"></span><span class="fs--1"> KB마에</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-fire"></span><span class="fs--1"> KB러닝</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-pen"></span><span class="fs--1"> 질문하기</span></a>
              </li>
              <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-swatchbook"></span><span class="fs--1"> 기타</span></a>
              </li>
            </ul>
            <a class="footer-text order-2 order-md-0" href="/" style="justify-content: center;">Made with <span class="uil uil-heart-alt fs-1 text-info"></span>by No.1조</a>
          </div>
        </div>
      </nav>

<%--      <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="modal-services">--%>
<%--        <div class="modal-dialog modal-lg" role="document">--%>
<%--          <div class="modal-content overflow-hidden border-0">--%>
<%--            <div class="modal-body scroll-modal-height perfect-scrollbar scrollbar">--%>
<%--              <div class="position-relative">--%>
<%--                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(assets/img/illustrations/services.png);">--%>
<%--                </div>--%>
<%--                <!--/.bg-holder-->--%>

<%--                <div class="position-relative pb-3 px-4 px-sm-6 pt-3">--%>
<%--                  <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>--%>
<%--                  <h1 class="card-title text-white mt-3">Set projects to excellence</h1>--%>
<%--                  <p class="text-white"> Our team always enjoys interesting projects that are challenging and original. No matter the task is, we are up to it. While we have the ability of learning new things quickly and can take on just anything you throw at us, here are a few areas we specialize in.</p>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <div class="px-7 py-3 text-center"> <img class="mb-3" src="assets/img/illustrations/web-app.png" alt="" width="200" />--%>
<%--                <h5 class="text-800 mb-3">Web applications</h5>--%>
<%--                <p>Web apps are the backbone of today's most popular software as a service product. We will help you succeed by conducting through market research and providing you actionable insights to position your product in the top.</p>--%>
<%--                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/mobile-app.png" alt="" width="200" />--%>
<%--                <h5 class="text-800 mb-3">Mobile applications</h5>--%>
<%--                <p>Over 50% of the smartphone users start using their phone just after waking up in the morning and spend more than 3 hours per day. Our team can help you design an incredible iOS or Android application no matter the complexity.</p>--%>
<%--                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/web-design.png" alt="" width="200" />--%>
<%--                <h5 class="text-800 mb-3">Web design</h5>--%>
<%--                <p>Technext Website Design team creates state of the art design ensuring the consistency and perfection across all major operating systems. It creates synergy between visuals, feelings, and experiences. </p>--%>
<%--                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/e-commerce.png" alt="" width="200" />--%>
<%--                <h5 class="text-800 mb-3">eCommerce Sites</h5>--%>
<%--                <p>Web apps are the backbone of today's most popular software as a service product. We will help you succeed by conducting through market research and providing you actionable insights to position your product in the top. </p>--%>
<%--                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/web-portal.png" alt="" width="200" />--%>
<%--                <h5 class="text-800 mb-3">Web portals</h5>--%>
<%--                <p>Consumers are driving crazy to online stores and shops in record numbers. Our team can help you monetize your checkout page, create seamless buying experience on handheld devices, setup email marketing solution and help you sell more.</p>--%>
<%--                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/data-driven.png" alt="" width="200" />--%>
<%--                <h5 class="text-800 mb-3">Data driven apps</h5>--%>
<%--                <p class="mb-5">Web apps are the backbone of today's most popular software as a service product. We will help you succeed by conducting through market research and providing you actionable insights to position your product in the top. </p>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="modal-contacts">--%>
<%--        <div class="modal-dialog modal-lg" role="document">--%>
<%--          <div class="modal-content overflow-hidden border-0">--%>
<%--            <div class="modal-body scroll-modal-height perfect-scrollbar scrollbar">--%>
<%--              <div class="position-relative">--%>
<%--                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(assets/img/group/street.jpg);">--%>
<%--                </div>--%>
<%--                <!--/.bg-holder-->--%>

<%--                <div class="position-relative pb-3 py-5 px-4 px-sm-4">--%>
<%--                  <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>--%>
<%--                  <div class="row no-gutters">--%>
<%--                    <div class="col-md-12 col-lg-6">--%>
<%--                      <h3 class="text-200 pb-2">Keep in touch</h3>--%>
<%--                      <form class="zform" method="post">--%>
<%--                        <input class="form-control" type="hidden" name="to" value="username@domain.extension" />--%>
<%--                        <input class="form-control" type="hidden" name="to" value="user@domain.extension" />--%>
<%--                        <div class="form-group">--%>
<%--                          <input class="form-control" type="text" placeholder="Your Name" required="" />--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                          <input class="form-control" type="email" placeholder="Email" required="" />--%>
<%--                        </div>--%>
<%--                        <div class="form-group">--%>
<%--                          <textarea class="form-control" rows="4" placeholder="Enter your descriptions here..." required=""></textarea>--%>
<%--                        </div>--%>
<%--                        <div class="zform-feedback"></div>--%>
<%--                        <div class="form-group">--%>
<%--                          <button class="btn btn-light btn-lg border-primary text-primary btn-block" type="submit">Send now</button>--%>
<%--                        </div>--%>
<%--                      </form>--%>
<%--                    </div>--%>
<%--                    <div class="col-md-12 col-lg-6 pl-lg-4">--%>
<%--                      <h3 class="text-200">Contacts</h3>--%>
<%--                      <ul class="list-unstyled mb-0">--%>
<%--                        <li><span class="uil uil-envelope fs-3 text-300 align-middle"></span><a class="text-white ml-sm-2" href="mailto:example@eamil.com">example@eamil.com</a></li>--%>
<%--                        <li><span class="uil fs-3 text-300 align-middle uil uil-phone"></span><a class="ml-sm-2 text-white" href="tel:+604-680-9785">+604-680-9785</a></li>--%>
<%--                        <li><span class="uil fs-3 text-300 align-middle uil uil-map"></span><span class="ml-sm-2 text-white">67 Robson St,British Columbia, Canada</span></li>--%>
<%--                      </ul>--%>
<%--                      <hr class="bg-600 mr-10 ml-1" />--%>
<%--                      <h4 class="text-white">Follow Us On<strong class="text-light">Social Media</strong></h4>--%>
<%--                      <p class="text-500">We are active on various social media platforms. Like, share and follow to get updates.</p><a class="mt-2 text-400" href="#"><span class="uil uil-twitter fs-2"></span></a><a class="mt-2 text-400" href="#"><span class="uil uil-facebook-f fs-2"></span></a><a class="mt-2 text-400" href="#"><span class="uil uil-instagram-alt fs-2"></span></a><a class="mt-2 text-400" href="#"><span class="uil uil-google-drive fs-2"></span></a>--%>
<%--                    </div>--%>
<%--                  </div>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <div class="googlemap min-vh-50" data-latlng="48.8583701,2.2922873,17" data-scrollwheel="false" data-icon="assets/img/icons/map-marker.png" data-zoom="17" data-theme="Default">--%>
<%--                <div class="marker-content py-3 pl-4">--%>
<%--                  <h5>Eiffel Tower</h5>--%>
<%--                  <p></p>Gustave Eiffel's iconic, wrought-iron 1889 tower,<br />with steps and elevators to observation decks.--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="modal-demo">--%>
<%--        <div class="modal-dialog modal-lg" role="document">--%>
<%--          <div class="modal-content overflow-hidden border-0">--%>
<%--            <div class="modal-body scroll-modal-height perfect-scrollbar scrollbar">--%>
<%--              <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>--%>
<%--              <div class="px-sm-8 py-sm-6 px-6 py-4"><img class="img-fluid" src="assets/img/illustrations/d-image.png" alt="" /></div>--%>
<%--              <div class="bg-400 px-3 text-center py-5">--%>
<%--                <h3 class="text-800 mb-3">Start your new project with <br />Grid right now!</h3>--%>
<%--                <button class="btn btn-info btn-lg" type="Submit"><span class="color-white">Simple button              </span></button>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="modal fade" id="modal-components" tabindex="-1" role="dialog" aria-labelledby="modal-components-title" aria-hidden="true">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--          <div class="modal-content">--%>
<%--            <div class="modal-header px-5 pb-2 pt-4 border-bottom-0">--%>
<%--              <h5 class="modal-title" id="modal-components-title">Components </h5>--%>
<%--              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body px-5">--%>
<%--              <hr class="mt-0 mb-1" />--%>
<%--              <div class="row pt-2 no-gutters">--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/alerts.html">Alerts</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/background.html">Background</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/badges.html">Badges</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/breadcrumb.html">Breadcrumb</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/buttons.html">Buttons</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/cards.html">Cards</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/carousel.html">Carousel</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/collapse.html">Collapse</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/dropdowns.html">Dropdowns</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/fancyscroll.html">Fancyscroll</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/forms.html">Forms</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/hoverbox.html">Hoverbox</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/list-group.html">List group</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/modals.html">Modals</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/media-object.html">Media object</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/navs.html">Navs</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/navbar.html">Navbar</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/page-headers.html">Page headers</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/pagination.html">Pagination</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/popovers.html">Popovers</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/progress.html">Progress</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/scrollspy.html">Scrollspy</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/spinners.html">Spinners</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/tables.html">Tables</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/tabs.html">Tabs</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/tooltips.html">Tooltips</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/toasts.html">Toasts</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/php-AJAX-form.html">Php AJAX form</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/mailbluster.html">Mailbluster</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--              <h5>Plugins</h5>--%>
<%--              <hr class="mt-0 mb-1" />--%>
<%--              <div class="row pt-2 pb-4 no-gutters">--%>
<%--                <div class="col-6 col-sm-3">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="plugins/unicons.html">Unicons</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm-3">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="plugins/loaders.html">Loaders</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm-3">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="plugins/google-map.html">Google map</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="modal fade" id="modal-utilities" tabindex="-1" role="dialog" aria-labelledby="modal-utilities-title" aria-hidden="true">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--          <div class="modal-content">--%>
<%--            <div class="modal-header px-5 pb-2 pt-4 border-bottom-0">--%>
<%--              <h5 class="modal-title" id="modal-utilities-title">Utilities</h5>--%>
<%--              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body px-5">--%>
<%--              <hr class="mt-0 mb-1" />--%>
<%--              <div class="row pt-2 pb-4 no-gutters">--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/borders.html">Borders</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/clearfix.html">Clearfix</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/close-icon.html">Close icon</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/colors.html">Colors</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/display.html">Display</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/embed.html">Embed</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/flex.html">Flex</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/figures.html">Figures</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/grid.html">Grid</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/sizing.html">Sizing</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/stretched-link.html">Stretched link</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/spacing.html">Spacing</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/typography.html">Typography</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/vertical-align.html">Vertical align</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/visibility.html">Visibility</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>
<%--      <div class="modal fade" id="modal-documentation" tabindex="-1" role="dialog" aria-labelledby="modal-documentation-title" aria-hidden="true">--%>
<%--        <div class="modal-dialog" role="document">--%>
<%--          <div class="modal-content">--%>
<%--            <div class="modal-header px-5 pb-2 pt-4 border-bottom-0">--%>
<%--              <h5 class="modal-title" id="modal-documentation-title">Documentation</h5>--%>
<%--              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>--%>
<%--            </div>--%>
<%--            <div class="modal-body px-5">--%>
<%--              <hr class="mt-0 mb-1" />--%>
<%--              <div class="row pt-2 pb-4 no-gutters">--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/getting-started.html">Getting started</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/file-structure.html">File structure</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/customization.html">Customization</a></li>--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/gulp.html">Gulp</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled mb-0">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/RTL.html">RTL</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--                <div class="col-6 col-sm">--%>
<%--                  <ul class="list-unstyled">--%>
<%--                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/plugins.html">Plugins</a></li>--%>
<%--                  </ul>--%>
<%--                </div>--%>
<%--              </div>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--        </div>--%>
<%--      </div>--%>




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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/assets/js/jquery.min.js"></script>
    <script src="/assets/js/popper.min.js"></script>
    <script src="/assets/js/bootstrap.js"></script>
    <script src="/assets/js/plugins.js"></script>
    <script src="/assets/lib/is/is.min.js"></script>
    <script src="/assets/lib/stickyfilljs/stickyfill.min.js"></script>
    <script src="/assets/lib/sticky-kit/sticky-kit.min.js"></script>
    <script src="/assets/lib/perfect-scrollbar/perfect-scrollbar.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARdVcREeBK44lIWnv5-iPijKqvlSAVwbw&callback=initMap" async></script>
    <script src="/assets/js/theme.js"></script>

  </body>

</html>