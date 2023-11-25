<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="/assets/css/study.css" rel="stylesheet"/>
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

<style>
    .e > h1 {
        font-size: 60px;
        font-weight: bold;
        font-family: 'Montserrat', sans-serif;
        text-align: center;
        color: #ffd800;
        letter-spacing: 0px;
        transition: 1s;
        -webkit-transition: 1s;
        -ms-transition: 1s;
        position: relative;
        padding: 10px;
    }

    .e > h1:before,
    .e > h1:after {
        content: "";
        position: absolute;
        height: 7px;
        width: 0px;
        background: #ffd800;
        transition: 300ms;
        -webkit-transition: 1s;
        -ms-transition: 1s;
        opacity: 0.3;
        left: 50%;
    }

    .e > h1:before {
        bottom: 0;

    }

    .e > h1:after {
        top: 0;

    }

    .e > h1:hover {
        letter-spacing: 30px;
    }

    .e > h1:hover:before,
    .e > h1:hover:after {
        width: 95%;
        opacity: 1;
        left: 0;

    }

    .e > h1:hover ~ h2 {
        opacity: 0;
    }

    * {
        font-family: 'Poppins', sans-serif;
    }

    .card:hover .kbmaename .skill {
        margin-bottom: 10px;
    }

    .container {
        margin-bottom: 20px;
    }

    .skill {
        border: black;
    }

    .container .card {
        position: relative;
        /*width: 400px;*/
        height: 450px;
        background: ghostwhite; /*카드 색깔*/
        border-radius: 20px;
        overflow: hidden;
    }

    .container .card:before {
        content: '';
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgb(235, 211, 99); /*반원 색깔*/
        clip-path: circle(150px at 80% 20%);
        transition: 0.5s ease-in-out;
    }

    .container .card:hover:before {
        clip-path: circle(300px at 80% -20%);
    }

    .container .card:after {
        content: 'KB';
        position: absolute;
        top: 30%;
        left: 0%;
        font-size: 12em;
        font-weight: 800;
        font-style: italic;
        color: rgb(235, 211, 99);
        z-index: 1; /*밑에 imgbox출력을 위해서 새로 넣음*/
    }

    .container .card .imgBx {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        z-index: 2; /*10000 에서 2로 변경*/
        width: 100%;
        height: 220px;
        transition: 0.5s;
    }

    .container .card:hover .imgBx {
        top: 0%;
        transform: translateY(0%);

    }

    .container .card .imgBx img {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 270px;
    }

    .container .card .contentBx {
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 100px;
        text-align: center;
        transition: 1s;
        z-index: 10;
    }

    .container .card:hover .contentBx {
        height: 210px;
    }

    .container .card .contentBx h2 {
        position: relative;
        font-weight: 600;
        letter-spacing: 1px;
        color: darkblue;
        margin: 0;
    }

    .container .card .contentBx .skill, .container .card .contentBx .color {
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 8px 20px;
        transition: 0.5s;
        opacity: 0;
        visibility: hidden;
        padding-top: 0;
        padding-bottom: 0;
    }

    .container .card:hover .contentBx .skill {
        opacity: 1;
        visibility: visible;
        transition-delay: 0.5s;
    }

    .container .card:hover .contentBx .color {
        opacity: 1;
        visibility: visible;
        transition-delay: 0.6s;
    }

    .container .card .contentBx .skill h3, .container .card .contentBx .color h3 {
        color: black;
        font-weight: 300;
        font-size: 18px;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-right: 10px;
    }

    .container .card .contentBx .skill span {
        width: 50px;
        height: 26px;
        text-align: center;
        line-height: 26px;
        font-size: 14px;
        display: inline-block;
        color: darkgreen;
        background: #fff;
        margin: 0 5px;
        transition: 0.5s;
        color: #111;
        border-radius: 4px;
        cursor: pointer;
    }

    .container .card .contentBx .skill span:hover {
        background: #9bdc28;
    }

    .container .card .contentBx .color span {
        width: 20px;
        height: 20px;
        background: #ff0;
        border-radius: 50%;
        margin: 0 5px;
        cursor: pointer;
    }

    .container .card .contentBx .color span:nth-child(2) {
        background: #9bdc28;
    }

    .container .card .contentBx .color span:nth-child(3) {
        background: #03a9f4;
    }

    .container .card .contentBx .color span:nth-child(4) {
        background: #e91e63;
    }

    .container .card .contentBx a {
        display: inline-block;
        padding: 10px 20px;
        background: #fff;
        border-radius: 4px;
        margin-top: 10px;
        text-decoration: none;
        font-weight: 600;
        color: #111;
        opacity: 0;
        transform: translateY(50px);
        transition: 0.5s;
        margin-top: 0;
    }

    .container .card:hover .contentBx a {
        opacity: 1;
        transform: translateY(0px);
        transition-delay: 0.75s;
    }

    /*추천 kb마에 시작==============================================================*/
    .container-first {
        display: flex;
        justify-content: center;
        /*align-items: center;*/
        /*min-height: 100vh;*/
        flex-wrap: wrap;
    }

    .card-container {
        position: relative;
        width: 300px;
        height: 420px;
        background: #fff;
        border-radius: 30px;
        box-shadow: 1px 5px 10px 10px rgba(0, 0, 0, 0.05);
        overflow: hidden;
    }

    .top-box {
        background: #593ceb;
        height: 120px;
        border-radius: 30px;
        padding: 20px 30px;
    }

    .top-menu {
        display: flex;
        justify-content: space-between;
    }

    .top-box i {
        font-size: 22px;
    }

    /* Show the dropdown on hover */
    .dropdown:hover .dropdown-content {
        display: block;
    }

    /* Change the background color of the dropdown button when the dropdown content is shown*/
    .dropdown:hover .dropbtn {
        box-shadow: inset 0px 0px 2px 1px #3845a1;
    }

    .menu-list {
        display: flex;
        flex-direction: column;
    }

    .menu-list a {
        text-decoration: none;
        font-size: 15px;
        color: #000;
        padding: 10px 20px;
    }

    .menu-list a:hover {
        background: #ffc9e2;
    }

    .more {
        right: 0;
        padding: 10px;
    }

    .skills-title {
        font-size: 15px;
        color: #ee2482;
    }

    .skills-list {
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
        margin: 5px;
    }

    .skills-list label {
        font-size: 13px;
        background: #7760e6;
        color: #fff;
        padding: 1px 8px;
        border-radius: 3px;
    }

    /* Image Box*/

    .image-box {
        display: flex;
        /*align-items: center;*/
        justify-content: center;
        margin: -75px auto 10px auto;
        height: 160px;
        width: 160px;
        background: #fff;
        border-radius: 50%;
    }

    .image-box img {
        width: 150px;
        border-radius: 50%;
        box-shadow: 0px 3px 2px 1px rgba(0, 0, 0, 0.3);
    }

    /* User Infomation */
    .user-info .name {
        display: flex;
        justify-content: center;
    }

    .user-info .job {
        display: flex;
        justify-content: center;
        font-size: 13px;
        color: #ee2482;
    }

    /* Social icons */
    .social-icons {
        display: flex;
        justify-content: center;
        margin: 10px 0 20px 0;
    }

    .social-icon-box {
        position: relative;
        display: flex;
        align-items: center;
        flex-direction: column;
    }

    .social-icon-box span {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 35px;
        height: 35px;
        border: 1px solid #593ceb;
        margin: 5px;
        border-radius: 50%;
        cursor: pointer;
        transition: .4s;
        z-index: 2;
    }

    .social-icon-box span:hover {
        color: #fff;
        box-shadow: inset 0 0 0 20px #8c78f0;
        transform: translateY(-5px);
    }

    .social-icon-box .social-icon-name {
        position: absolute;
        top: 0;
        opacity: 0;
        padding: 5px 20px;
        font-size: 13px;
        background: #8c78f0;
        color: #fff;
        border-radius: 30px;
        transition: all .3s cubic-bezier(0.07, -0.55, 0.265, 1.55);
    }

    .social-icon-box span:hover ~ .social-icon-name {
        top: -45px;
        opacity: 1;
    }

    /* Hire Button*/
    .btn-box {
        display: flex;
        justify-content: center;
    }

    .btn-box .btn {
        width: 100px;
        height: 35px;
        background: linear-gradient(to right, #9823db, #fb4aef);
        color: #fff;
        border: none;
        border-radius: 30px;
        cursor: pointer;
    }

    .btn-box .btn:hover {
        background: linear-gradient(to right, #fb4aef, #9823db);
    }

    /* Animated circles */
    .circle-1 {
        position: absolute;
        left: -20px;
        top: 35%;
        height: 50px;
        width: 50px;
        border: 2px dashed #c975fb;
        border-radius: 50%;
        animation: circle-1 5s ease-in-out infinite;
    }

    .circle-2 {
        position: absolute;
        right: -20px;
        bottom: -30px;
        height: 100px;
        width: 100px;
        border: 2px dashed #c975fb;
        border-radius: 50%;
        animation: circle-2 15s ease-in-out infinite;
    }

    /* Circle-1 animation */
    @keyframes circle-1 {
        50% {
            left: -20px;
            top: 40%;
        }
    }

    /* Circle-1 animation */
    @keyframes circle-2 {
        from {
            transform: rotate(0deg);
        }
        to {
            transform: rotate(360deg);
        }
    }
    .Project-content{
        margin: 0px;
        border: black;
    }
</style>

<header class="padding80 font_weight600" style="height: 180px">
    <form action="/kbmae">
        <div id="logo">
        </div>
        <div class="search_input_box">
            <div class="search_input">
                <div>
                    <div>KB마에스트로 찾기</div>
                </div>

                <div>
                    <input type="text" id="searchKbmae" name="searchKbmae" placeholder="찾으시는 Skill을 입력하세요"
                           style="width: 400px; text-align: center" <c:if test="${value != ''}">value="${value}"</c:if>>
                </div>
                <div class="search_input__start_date" style="width:100px">
                </div>
                <div class="search_input__end_date" style="width:100px">
                </div>
                <div style="align-content: end">
                    <button type="submit" class="search_button" style="text-align: center; background-color: #30A599">
                        <img src="/assets/images/magnifying-glass-svgrepo-com.svg" class="magnifying_glass">
                    </button>
                </div>
            </div>
        </div>
    </form>
</header>

<div class="content" style="margin-top: 0rem; padding:1rem;">
    <%--로그인 했을경우 내 프로젝트를 보여주며 해당 프로젝트에 필요한 스킬을 보유한 kb마에들을 보여준다--%>
    <c:choose>
        <c:when test="${loginmember!=null}">
            <hr>
            <div><b class="font32 e"><h1 style="color:#7B69EF; background:white;">추천! Maestro</h1></b></div>
            <br>
            <c:forEach var="obj" items="${myPosts}">
                <div id="mypost" class="row">
                    <div class="col px-2 col-sm-6 col-lg-4 col-xxl-4">
                        <a href="/page">
                            <div class="card card-blog"><img class="card-img img-fluid"
                                                             src="assets/img/group/${obj.img}" alt=""/>
                                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                                    <h5 class="card-title text-white">${obj.title}
                                        <br><span
                                                class="badge badge-pill stretched-link ml-2 badge-info">${obj.name}</span>
                                    </h5>
                                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                                        <div><span class="uil fs-3 text-300 align-middle uil-lightbulb"></span><span
                                                class="text-white fs--1 mb-0 d-inline-block">Wanted Skill</span></div>
                                        <c:forEach var="innerobj1" items="${obj.wantedhashtag}">
                                            <span class="badge badge-pill stretched-link ml-2 badge-danger">${innerobj1}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="Project-content" style="">${obj.content}</div>
                    </div>
                    <%--해당 프로젝트에서 원하는 Skill 보유 한 직원--%>
                    <div class="row col px-1 col-sm-12 col-lg-8 col-xxl-8">
                        <c:forEach var="innerobj2" items="${obj.kbmae}">
                            <div class="col px-1 ml-2" style="">
                                <%--추천 kb마에 시작--%>
                                <div class="container-first">
                                    <!------------------------------ card container --------------------------------------->
                                    <div class="card-container">
                                        <div class="top-box">
                                            <div class="top-menu">
                                            </div>
                                        </div>
                                        <!-------------------------- End of top Box(Menu) ---------------------------------->

                                        <div class="image-box">
                                            <img src="assets/img/group/${innerobj2.img}" alt="추천 큽마에 사진">
                                        </div>
                                        <!-------------------------- End of Image Box ---------------------------------->

                                        <div class="main-box">
                                            <div class="user-info">
                                                <span class="name">${innerobj2.name} : ${innerobj2.hashtag} </span>
                                                <span class="name">${innerobj2.memo}</span>
                                                <span class="job">${innerobj2.company}</span>
                                            </div>
                                            <!-------------------------- End of user information ---------------------------------->
<%--                                            <div class="social-icons">
                                                <div class="social-icon-box">
                                                    <span><i class="fe fe-facebook"></i></span>
                                                    <p class="social-icon-name">Facebook</p>
                                                </div>
                                                <div class="social-icon-box">
                                                    <span><i class="fe fe-github"></i></span>
                                                    <p class="social-icon-name">Github</p>
                                                </div>
                                                <div class="social-icon-box">
                                                    <span><i class="fe fe-instagram"></i></span>
                                                    <p class="social-icon-name">Instagram</p>
                                                </div>
                                                <div class="social-icon-box">
                                                    <span><i class="fe fe-gitlab"></i></span>
                                                    <p class="social-icon-name">Gitlab</p>
                                                </div>
                                            </div>--%>
                                            <!---------------------------- End of Social icons ------------------------------>
                                            <div class="btn-box">
                                                <button class="btn">연락하기</button>
                                            </div>

                                            <!---------------------------- End of button box ------------------------------>
                                        </div>
                                        <!---------------------------- Animated circles ------------------------------>

                                        <div class="circle-1"></div>
                                        <div class="circle-2"></div>

                                        <!---------------------------- End of Animated circles ------------------------------>
                                    </div>
                                </div>
                            </div>
                            <%--추천 kb마에 시작--%>
                        </c:forEach>
                    </div>
                </div>
                <hr>
            </c:forEach>
        </c:when>
    </c:choose>
    <link href='https://fonts.googleapis.com/css?family=Montserrat:700|Pinyon+Script' rel='stylesheet' type='text/css'>
    <div class="e" class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        <h1>KB Maestro</h1>
    </div>
    <div id="kbmaeList" class="row mx-n2">
        <c:forEach var="obj" items="${kbmaelist}">
            <div class="container px-5 col-sm-1 col-lg-3 col-xxl-4">
                <div class="card">
                    <div class="imgBx">
                        <img src="assets/img/group/${obj.img}">
                    </div>
                    <div class="contentBx">
                        <h2 class="kbmaename">${obj.name}<h6>(${obj.company})</h6></h2>
                        <h2 class="kbmaename">${obj.memo}</h2><br>
                        <div class="skill">
                            <h3>Skill</h3>
                            <c:forEach var="innerobj" items="${obj.hashtagList}">
                                <span>${innerobj}</span>
                            </c:forEach>
                        </div>
                        <br>
                        <h2 class="git">${obj.gitaddress}</h2>
                        <a href="">연락하기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>