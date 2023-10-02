<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="content">
    <div class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        HOT 프로젝트
    </div>

    <div id="projectList" class="row mx-n2">
        <c:forEach var="post" items="${posts}">
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/${post.img}" alt="" />
                <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                    <div class="d-flex justify-content-between">
                        <h5 class="card-title text-white">${post.title}</h5>
                        <c:if test="${post.memberId == loginmember.memberId}">
                            <a href="/post/edit?projectId=${post.projectId}" style="z-index: 99999; color: currentColor;">
                                <span id="post_edit_${post.projectId}" class="post-edit svg-icon svg-icon-muted svg-icon-2hx">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path opacity="0.3" fill-rule="evenodd" clip-rule="evenodd" d="M2 4.63158C2 3.1782 3.1782 2
                                        4.63158 2H13.47C14.0155 2 14.278 2.66919 13.8778 3.04006L12.4556 4.35821C11.9009 4.87228
                                        11.1726 5.15789 10.4163 5.15789H7.1579C6.05333 5.15789 5.15789 6.05333 5.15789 7.1579V16.8421C5.15789
                                        17.9467 6.05333 18.8421 7.1579 18.8421H16.8421C17.9467 18.8421 18.8421 17.9467 18.8421 16.8421V13.7518C18.8421
                                         12.927 19.1817 12.1387 19.7809 11.572L20.9878 10.4308C21.3703 10.0691 22 10.3403 22 10.8668V19.3684C22 20.8218
                                         20.8218 22 19.3684 22H4.63158C3.1782 22 2 20.8218 2 19.3684V4.63158Z" fill="currentColor"/>
                                        <path d="M10.9256 11.1882C10.5351 10.7977 10.5351 10.1645 10.9256 9.77397L18.0669 2.6327C18.8479 1.85165 20.1143
                                        1.85165 20.8953 2.6327L21.3665 3.10391C22.1476 3.88496 22.1476 5.15129 21.3665 5.93234L14.2252 13.0736C13.8347
                                        13.4641 13.2016 13.4641 12.811 13.0736L10.9256 11.1882Z" fill="currentColor"/>
                                        <path d="M8.82343 12.0064L8.08852 14.3348C7.8655 15.0414 8.46151 15.7366 9.19388 15.6242L11.8974 15.2092C12.4642
                                        15.1222 12.6916 14.4278 12.2861 14.0223L9.98595 11.7221C9.61452 11.3507 8.98154 11.5055 8.82343 12.0064Z" fill="currentColor"/>
                                    </svg>
                                </span>
                            </a>
                        </c:if>
                    </div>

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
