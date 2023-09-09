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
    <title>KB SidePJ</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicons/favicon.ico">
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
                  <img class="rounded-circle" src="assets/img/icons/user-icon.png" alt="" />

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