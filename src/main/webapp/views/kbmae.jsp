<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="/assets/css/study.css" rel="stylesheet"/>
@import url('https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');

<style>
*{
font-family: 'Poppins', sans-serif;
}

.container .card{
position: relative;
width: 320px;
height: 450px;
background: #232323;
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
background: #9bdc28;
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
left: -20%;
font-size: 12em;
font-weight: 800;
font-style: italic;
color: rgba(255,255,25,0.05);
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
color: #fff;
margin: 0;
}

.container .card .contentBx .size, .container .card .contentBx .color {
display: flex;
justify-content: center;
align-items: center;
padding: 8px 20px;
transition: 0.5s;opacity: 0;
visibility: hidden;
padding-top: 0;
padding-bottom: 0;
}

.container .card:hover .contentBx .size{
opacity: 1;
visibility: visible;
transition-delay: 0.5s;
}

.container .card:hover .contentBx .color{
opacity: 1;
visibility: visible;
transition-delay: 0.6s;
}

.container .card .contentBx .size h3, .container .card .contentBx .color h3{
color: #fff;
font-weight: 300;
font-size: 14px;
text-transform: uppercase;
letter-spacing: 2px;
margin-right: 10px;
}

.container .card .contentBx .size span{
width: 50px;
height: 26px;
text-align: center;
line-height: 26px;
font-size: 14px;
display: inline-block;
color: #111;
background: #fff;
margin: 0 5px;
transition: 0.5s;
color: #111;
border-radius: 4px;
cursor: pointer;
}

.container .card .contentBx .size span:hover{
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
    <form action="/kbmae/findimpl" method="get">
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

<div class="content">
    <%--로그인 했을경우 내 프로젝트를 보여주며 해당 프로젝트에 필요한 스킬을 보유한 kb마에들을 보여준다--%>
    <c:choose>
        <c:when test="${loginmember!=null}">
                <div><b class="font32">내 프로젝트</b></div><br>
                <div id="kbmaeList"<%-- class="row mx-n2"--%> class="col">
                    <c:forEach var="obj" items="${myPosts}">
                        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
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
                        <div class="px-1 col-sm-3 col-lg-2 col-xxl-2">
                            <c:forEach var="innerobj2" items="${obj.kbmae}">
                                <span class="badge badge-pill stretched-link ml-2 badge-success">${innerobj2.name}: ${innerobj2.hashtag} </span>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </div>
        </c:when>
    </c:choose>

    <div class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        BEST 큽마에
    </div>
        <div id="kbmaeList" class="row mx-n2">
        <c:forEach var="obj" items="${kbmaelist}">
            <div class="container px-2 col-sm-6 col-lg-4 col-xxl-4">
                <div class="card">
                    <div class="imgBx">
                        <img src="assets/img/group/${obj.img}">
                    </div>
                    <div class="contentBx">
                        <h2>${obj.name}</h2>
                        <div class="size">
                            <h3>Skill</h3>
                            <c:forEach var="innerobj" items="${obj.hashtagList}">
                                <span>${innerobj}</span>
                            </c:forEach>
                        </div>
                        <div class="color">
                            <h3>Color :</h3>
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                        <a href="#">연락하기</a>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>


<%--    <div id="kbmaeList" class="row mx-n2">
        <c:forEach var="obj" items="${kbmaelist}">
            <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
                <a href="/page">
                    <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/${obj.img}" alt="" />
                        <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                            <h5 class="card-title text-white">${obj.name}<span class="badge badge-pill stretched-link ml-2 badge-info">${obj.memo}</span></h5>
                            <div class="d-flex flex-wrap align-items-center justify-content-between">
                                <div><span class="uil fs-3 text-300 align-middle uil-users-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">${obj.company}</span></div>
                                <c:forEach var="innerobj" items="${obj.hashtagList}">
                                    <span class="badge badge-pill stretched-link ml-2 badge-danger">${innerobj}</span>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>--%>
</div>
