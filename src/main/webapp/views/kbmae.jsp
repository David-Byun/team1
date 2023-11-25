<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="/assets/css/study.css" rel="stylesheet"/>
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

<style>
.e>h1{
    font-size:60px;
    font-weight:bold;
    font-family: 'Montserrat', sans-serif;
    text-align:center;
    color:#ffd800;
    letter-spacing:0px;
    transition:1s;
    -webkit-transition:1s;
    -ms-transition:1s;
    position: relative;
    padding:10px;
}

.e>h1:before,
.e>h1:after{
    content:"";
    position: absolute;
    height: 7px;
    width: 0px;
    background:#ffd800;
    transition:300ms;
    -webkit-transition:1s;
    -ms-transition:1s;
    opacity:0.3;
    left:50%;
}

.e>h1:before{
    bottom:0;

}

.e>h1:after{
    top:0;

}

.e>h1:hover{
    letter-spacing:30px;
}

.e>h1:hover:before,
.e>h1:hover:after{
    width: 95%;
    opacity:1;
    left:0;

}
.e>h1:hover ~ h2{
    opacity:0;
}

.e>h2{
    color:#fff;
    font-family: 'Pinyon Script', cursive;
    text-align:center;
    font-size:100px;
    font-weight:100;
    bottom:40px;
    position: absolute;
    transition:1s;
    -webkit-transition:1s;
    -ms-transition:1s;
    opacity:0.1;
    width: 100%;
}

*{
font-family: 'Poppins', sans-serif;
}

.card:hover .kbmaename .skill {
    margin-bottom:10px;
}

.container{
    margin-bottom:20px;
}

.skill{
    border: black;
}

.container .card{
position: relative;
/*width: 400px;*/
height: 450px;
background: ghostwhite; /*카드 색깔*/
border-radius: 20px;
overflow: hidden;
}

.container .card:before{
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

.container .card:hover:before{
clip-path: circle(300px at 80% -20%);
}

.container .card:after{
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

.container .card .imgBx{
position: absolute;
top: 50%;
transform: translateY(-50%);
z-index: 2; /*10000 에서 2로 변경*/
width: 100%;
height: 220px;
transition: 0.5s;
}

.container .card:hover .imgBx{
top: 0%;
transform: translateY(0%);

}

.container .card .imgBx img{
position: absolute;
top: 50%;
left: 50%;
transform: translate(-50%, -50%);
width: 270px;
}

.container .card .contentBx{
position: absolute;
bottom: 0;
width: 100%;
height: 100px;
text-align: center;
transition: 1s;
z-index: 10;
}

.container .card:hover .contentBx{
height: 210px;
}

.container .card .contentBx h2{
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
transition: 0.5s;opacity: 0;
visibility: hidden;
padding-top: 0;
padding-bottom: 0;
}

.container .card:hover .contentBx .skill{
opacity: 1;
visibility: visible;
transition-delay: 0.5s;
}

.container .card:hover .contentBx .color{
opacity: 1;
visibility: visible;
transition-delay: 0.6s;
}

.container .card .contentBx .skill h3, .container .card .contentBx .color h3{
color: black;
font-weight: 300;
font-size:18px;
text-transform: uppercase;
letter-spacing: 2px;
margin-right: 10px;
}

.container .card .contentBx .skill span{
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

.container .card .contentBx .skill span:hover{
background: #9bdc28;
}

.container .card .contentBx .color span{
width: 20px;
height: 20px;
background: #ff0;
border-radius: 50%;
margin: 0 5px;
cursor: pointer;
}

.container .card .contentBx .color span:nth-child(2){
background: #9bdc28;
}

.container .card .contentBx .color span:nth-child(3){
background: #03a9f4;
}

.container .card .contentBx .color span:nth-child(4){
background: #e91e63;
}

.container .card .contentBx a{
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

.container .card:hover .contentBx a{
opacity: 1;
transform: translateY(0px);
transition-delay: 0.75s;

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
                <input type="text"  id="searchKbmae" name="searchKbmae" placeholder="찾으시는 Skill을 입력하세요" style="width: 400px; text-align: center" <c:if test="${value != ''}">value="${value}"</c:if>>
            </div>
            <div class="search_input__start_date" style="width:100px">
            </div>
            <div class="search_input__end_date" style="width:100px">
            </div>
            <div style="align-content: end">
                <button type="submit" class="search_button" style="text-align: center; background-color: #30A599">
                    <img src="/assets/images/magnifying-glass-svgrepo-com.svg" class="magnifying_glass" >
                </button>
            </div>
        </div>
    </div>
    </form>
</header>

<div class="content" style="margin-top: 0rem; padding:0rem;">
    <%--로그인 했을경우 내 프로젝트를 보여주며 해당 프로젝트에 필요한 스킬을 보유한 kb마에들을 보여준다--%>
    <c:choose>
        <c:when test="${loginmember!=null}">
            <hr>
            <div><b class="font32 e"><h1>My Project</h1></b></div><br>
            <c:forEach var="obj" items="${myPosts}">
                <div id="mypost" class="row">
                    <div class="col px-2 col-sm-6 col-lg-4 col-xxl-4">
                        <a href="/page">
                            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/${obj.img}" alt="" />
                                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                                    <h5 class="card-title text-white">${obj.title}
                                        <br><span class="badge badge-pill stretched-link ml-2 badge-info">${obj.name}</span></h5>
                                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                                        <div><span class="uil fs-3 text-300 align-middle uil-lightbulb"></span><span class="text-white fs--1 mb-0 d-inline-block">Wanted Skill</span></div>
                                        <c:forEach var="innerobj1" items="${obj.wantedhashtag}">
                                            <span class="badge badge-pill stretched-link ml-2 badge-danger">${innerobj1}</span>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                        <%--해당 프로젝트에서 원하는 Skill 보유 한 직원--%>
                    <div class="row col px-1 col-sm-12 col-lg-8 col-xxl-8">
                        <c:forEach var="innerobj2" items="${obj.kbmae}">
                            <div class="col px-1 ml-2" style="">
                                <div>${innerobj2.name}</div>
                                <div>${innerobj2.hashtag}</div>
                                <div>${innerobj2.img}</div>
                                <div>${innerobj2.memo}</div>
                                <div>${innerobj2.company}</div>
                            </div>
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
                        <h2 class="kbmaename">${obj.name}</h2><br>
                        <div class="skill">
                            <h3>Skill</h3>
                            <c:forEach var="innerobj" items="${obj.hashtagList}">
                                <span>${innerobj}</span>
                            </c:forEach>
                        </div><br>
                        <h2 class="git">${obj.gitaddress}</h2>
                        <a href="">연락하기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>

</div>
