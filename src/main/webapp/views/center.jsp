<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="content">
    <div class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        HOT 프로젝트
    </div>

    <div id="projectList" class="row mx-n2">
        <c:forEach var="post" items="${posts}">
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/${post.img}" alt=""/>
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <h5 class="card-title text-white">${post.title}</h5>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-lightbulb-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">
                            <c:forEach var="item" items="${post.hashtag}">
                            #${item}
                            </c:forEach>
                        </span></div>
                        <a class="badge badge-pill stretched-link ml-2 badge-success" href="/post/${post.projectId}">Project Manager : ${post.memberId}</a>
                    </div>
                </div>
            </div>
        </div>
        </c:forEach>
    </div>
    <div style="height: 50px">
    </div>
    <div class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        BEST 큽마에
    </div>
    <div id="kbmaeList" class="row mx-n2">
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-6.png" alt="" />
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <h5 class="card-title text-white">큽마에1</h5>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-users-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Pick Your Team</span></div><a class="badge badge-pill stretched-link ml-2 badge-info" href="/page">Personal Development</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-7.png" alt="" />
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <h5 class="card-title text-white">큽마에2</h5>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-book-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Coworking Business Model</span></div><a class="badge badge-pill stretched-link ml-2 badge-primary" href="/page">Life Lessons</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-7.png" alt="" />
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <h5 class="card-title text-white">큽마에3</h5>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-book-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Coworking Business Model</span></div><a class="badge badge-pill stretched-link ml-2 badge-primary" href="/page">Life Lessons</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        참여후기
    </div>
    <div id="review" class="row mx-n2">
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-6.png" alt="" />
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <h5 class="card-title text-white">참여후기</h5>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-users-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Pick Your Team</span></div><a class="badge badge-pill stretched-link ml-2 badge-info" href="/page">Personal Development</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-7.png" alt="" />
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <h5 class="card-title text-white">참여후기</h5>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-book-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Coworking Business Model</span></div><a class="badge badge-pill stretched-link ml-2 badge-primary" href="/page">Life Lessons</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-7.png" alt="" />
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <h5 class="card-title text-white">참여후기</h5>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-book-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Coworking Business Model</span></div><a class="badge badge-pill stretched-link ml-2 badge-primary" href="/page">Life Lessons</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
