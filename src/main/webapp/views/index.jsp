<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Calendar -->
    <link href='/fullcalendar-5.1.0/lib/main.css' rel='stylesheet'/>
    <script src='/fullcalendar-5.1.0/lib/main.js'></script>
    <!-- The core Firebase JS SDK is always required and must be listed first -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://www.gstatic.com/firebasejs/6.5.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/5.9.2/firebase-messaging.js"></script>

    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>KB Maestro</title>

    <link rel="icon" sizes="180x180" href="/assets/img/logos/kbmlogo.png"/>

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
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900"
          rel="stylesheet">
    <link href="/assets/lib/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet">
    <link href="/assets/lib/unicons/css/unicons.css" rel="stylesheet">
    <link href="/assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
    <link href="/assets/css/theme.css" rel="stylesheet">


    <!--sunmi-->
    <!--Dropzone-->
    <link href="/assets/plugins/global/plugins.bundle.css" rel="stylesheet" type="text/css"/>
    <link href="/assets/css/style.bundle.css" rel="stylesheet" type="text/css"/>
    <link rel="canonical" href="https://preview.keenthemes.com/start-html-pro"/>
    <!--FullCalendar-->
    <link href="/assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css"/>
    <!--Font-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <%--    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">--%>
    <%--    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">--%>
    <%--    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">--%>
    <%--    <link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">--%>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Nanum+Gothic&family=Noto+Sans+KR:wght@300&display=swap"
          rel="stylesheet">

</head>

<style>
    /*
    sunmi
     */
    html body {
        font-family: 'Gothic A1', sans-serif;
        font-family: 'Nanum Gothic', sans-serif;
        font-family: 'Noto Sans KR', sans-serif;
    }

    /*html body {*/
    /*    font-family: 'IBM Plex Sans KR', sans-serif;*/
    /*}*/
    #navBox {
        box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.31);
    }

    li.nav-item > a {
        color: #506690;
    }

    li.nav-item > a:hover {
        color: #5cbca2;
    }

    #searchBox:focus {
        border: 1.5px solid #5cbca2 !important;
        outline: none;
        box-shadow: none;
    }

    .not-hover:hover {
        color: #5cbca2;
        outline: none;
        background-color: transparent;
    }
</style>

<script>
    $(function () {
        let web = null;

        function getBrowserName() {
            //agent에 브라우저 종류 삽입
            var agent = navigator.userAgent.toLowerCase();
            if ((navigator.appName == 'Netscape'
                && navigator.userAgent.search('Trident') != -1
                || (agent.indexOf("msie") != -1))) {

                return "ie";
            } else if (agent.indexOf("chrome") != -1) {

                return "chrome";
            } else if (agent.indexOf("safari") != -1) {

                return "safari";
            } else if (agent.indexOf("firefox") != -1) {

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
                    method: 'post',
                    url: '/token',
                    data: {token: token, web: web}
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

        //sunmi
        let point = '${loginmember.point}';
        let memberPoint = point.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        console.log(point);
        console.log(memberPoint);
        document.getElementById('point').innerHTML = memberPoint;
    });
</script>
<body>

<!-- ===============================================-->
<!--    Main Content-->
<!-- ===============================================-->
<main class="main" id="top">
    <div id="navBox" class="bg-white fixed-top navbar-nav" style="width: 100%; height: 8%; display: flex; justify-content: center;">
        <nav class="navbar navbar-expand-lg fs--1 bg-white" style="width:100%; max-width: 1270px; height: 8%;margin: 0 auto; display: flex;">
            <a class="navbar-brand" href="/"><img src="/assets/img/logos/logo_kor.png" alt="logo" style="width: 10rem;"/></a>
            <div class="collapse navbar-collapse" id="navbarContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"><a class="nav-link pl-7 px-3 pt-3 fs-0" href="#">프로젝트</a></li>
                    <li class="nav-item"><a class="nav-link px-3 pt-3 fs-0" href="#">프로덕트</a></li>
                    <li class="nav-item"><a class="nav-link px-3 pt-3 fs-0" href="/study">스터디/회의실</a></li>
                    <li class="nav-item"><a class="nav-link px-3 pt-3 fs-0" href="/kbmae">KB마에</a></li>
                </ul>
                <form class="form-inline my-2 my-lg-0 pt-3">
                    <input id="searchBox" class="form-control form-control-sm" type="search"
                           placeholder="큽큽큽" aria-label="Search" style="border-style: none;"/>
                </form>
            </div>
            <div class="navbar">
                <ul class="navbar-nav align-items-center" style="display: flex; justify-content: flex-end;">
                    <li class="dropdown nav-item mr-2">
                        <c:choose>
                            <c:when test="${loginmember!=null}">
                                <a class="nav-link pt-3" href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img class="avatar avatar-xl" src="/assets/img/icons/${loginmember.img}" alt="회원이미지"/>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right py-0 px-3" aria-labelledby="navbarDropdownUser" style="width: 200px;">
                                    <div class="bg-white rounded-soft py-2">
                                        <div>
                                            <div class="align-items-center" style="display: flex">
                                                <img class="avatar avatar-xl" src="/assets/img/icons/${loginmember.img}" style="margin-right: 1rem;" alt="회원이미지"/>
                                                <div>
                                                    <span class="fs-0">${loginmember.name}</span><br/>
                                                    <span style="font-size: 0.7rem;">${loginmember.company} | ${loginmember.position}</span>
                                                </div>
                                            </div>
                                            <div class="mt-2 mx-2 py-2 pl-2 pr-2 justify-content-between rounded" style="display: flex; background-color: rgba(92,188,162,0.18);" >
                                                <div>
                                                    포인트
                                                </div>
                                                <div>
                                                    <span id="point" style="color: #5cbca2; font-weight: bolder;"></span>
                                                    큽
                                                </div>
                                            </div>

                                            <div class="dropdown-divider"></div>
                                            <a class="not-hover dropdown-item" href="#"><span class='uil uil-folder-heart'></span>내 프로젝트</a>
                                            <a class="not-hover dropdown-item" href="#"><span class='uil uil-cog'></span>마이페이지</a>
                                            <a class="not-hover dropdown-item" href="#"><span class='uil uil-pen'></span>작성한 글</a>
                                            <a class="not-hover dropdown-item" href="/account"><span class='uil uil-heart'></span>좋아요</a>
                                            <div class="dropdown-divider"></div>
                                            <div class="align-items-center" style="display: flex; padding: 0;">
                                                <a class="not-hover dropdown-item" href="#"><span class='uil uil-question-circle'></span>문의</a>
                                                <a class="not-hover dropdown-item" href="/logout">로그아웃<span class='uil uil-sign-out-alt'></span></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <a class="nav-link pt-3" href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <div class="avatar avatar-xl">
                                    <span class="svg-icon svg-icon-muted svg-icon-2hx">
                                        <svg width="33" height="33" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path opacity="0.3" d="M16.5 9C16.5 13.125 13.125 16.5 9 16.5C4.875 16.5 1.5 13.125 1.5 9C1.5 4.875 4.875 1.5 9 1.5C13.125 1.5 16.5 4.875 16.5 9Z" fill="text-secondary"/>
                                            <path d="M9 16.5C10.95 16.5 12.75 15.75 14.025 14.55C13.425 12.675 11.4 11.25 9 11.25C6.6 11.25 4.57499 12.675 3.97499 14.55C5.24999 15.75 7.05 16.5 9 16.5Z" fill="currentColor"/>
                                            <rect x="7" y="6" width="4" height="4" rx="2" fill="currentColor"/>
                                        </svg>
                                    </span>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right py-0 px-3" aria-labelledby="navbarDropdownUser">
                                    <div class="bg-white rounded-soft py-2">
                                        <a class="dropdown-item font-weight-bold text-success" href="/register"><span>회원가입</span></a>
                                        <a class="dropdown-item font-weight-bold" href="/login">로그인</a>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </li>
                </ul>
            </div>
        </nav>
    </div>

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

<footer>
    <div class="d-flex justify-content-center bg-200 mb-2">
        <img src="assets/img/icons/row.png" alt="img"/>
    </div>
</footer>


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
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARdVcREeBK44lIWnv5-iPijKqvlSAVwbw&callback=initMap"
        async></script>
<script src="/assets/js/theme.js"></script>

</body>

</html>