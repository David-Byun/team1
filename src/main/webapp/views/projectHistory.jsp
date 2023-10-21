<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Nanum+Gothic&family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet">

<%--<div class="text-white bg-success" style="width: 100%; max-width: 100%;">--%>
<%--  <div class="content col-xxl-9" style="padding: 6.5rem 0 2rem 0; width: 100%; max-width: 1200px; margin: 0 auto;">--%>
<%--    <p class="text-white text-900" style="font-size: 1.5rem; font-weight: bolder;">참여한 프로젝트--%>
<%--      <br/><span style="font-size: 0.9rem; font-weight: revert;">프로젝트 참여내역</span>--%>
<%--    </p>--%>
<%--  </div>--%>
<%--</div>--%>

<div class="content">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">

    <div class="row">
      <div class="col-md-12">
        <ul class="nav nav-pills flex-column flex-md-row mb-3">
          <li class="nav-item">
            <a class="nav-link" href="/mypage?memberId=${loginmember.memberId}"><i class="bx bx-user me-1"></i> 마이페이지 </a>
          </li>
          <li class="nav-item">
            <a class="nav-link  active"  href="javascript:void(0);"
            ><i class="bx bx-bell me-1"></i> 프로젝트 참여내역 </a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kbHistory?memberId=${loginmember.memberId}"
            ><i class="bx bx-link-alt me-1"></i> 큽 사용내역</a
            >
          </li>
        </ul>
        <div class="card mb-4">
          <h5 class="card-header">내가 모집한 프로젝트</h5>
          <!-- Account -->
          <div id="projectList1" class="row mx-n2">
                <c:forEach var="uploadedPosts" items="${uploadedPosts}">
                    <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
                        <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/${uploadedPosts.img}" alt="" />
                            <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                                <div class="d-flex justify-content-between">
                                    <h5 class="card-title text-white">${uploadedPosts.title}</h5>
                                    <c:if test="${uploadedPosts.memberId == loginmember.memberId}">
                                        <div style="display: flex;">
                                            <a href="/post/edit?projectId=${uploadedPosts.projectId}" style="z-index: 99999; color: currentColor;">
                                    <span id="uploadedPosts_edit_${uploadedPosts.projectId}" class="uploadedPosts-edit svg-icon svg-icon-muted svg-icon-2hx">
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
                                            <a href="/project/progress?projectId=${uploadedPosts.projectId}" style="z-index: 99998; color: currentColor;">
                                    <span class="svg-icon svg-icon-muted svg-icon-2hx">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path opacity="0.3" d="M14 3V21H10V3C10 2.4 10.4 2 11 2H13C13.6 2 14 2.4 14 3ZM7 14H5C4.4 14 4 14.4 4 15V21H8V15C8 14.4 7.6 14 7 14Z" fill="currentColor"/>
                                            <path d="M21 20H20V8C20 7.4 19.6 7 19 7H17C16.4 7 16 7.4 16 8V20H3C2.4 20 2 20.4 2 21C2 21.6 2.4 22 3 22H21C21.6 22 22 21.6 22 21C22 20.4 21.6 20 21 20Z" fill="currentColor"/>
                                        </svg>
                                    </span>
                                            </a>
                                        </div>
                                    </c:if>
                                </div>

                                <div class="d-flex flex-wrap align-items-center justify-content-between">
                                    <div><span class="uil fs-3 text-300 align-middle uil-lightbulb-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">
                            <c:forEach var="item" items="${uploadedPosts.hashtag}">
                                #${item}
                            </c:forEach>
                        </span></div>
                                    <a class="badge badge-pill stretched-link ml-2 badge-success" href="/post/${uploadedPosts.projectId}">Project Manager : ${uploadedPosts.memberId}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
          <hr class="my-0" />
          <h5 class="card-header">내가 참여한 프로젝트</h5>
            <!-- Account -->
          <div id="projectList2" class="row mx-n2">
                <c:forEach var="joinedPosts" items="${joinedPosts}">
                    <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
                        <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/${joinedPosts.img}" alt="" />
                            <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                                <div class="d-flex justify-content-between">
                                    <h5 class="card-title text-white">${joinedPosts.title}</h5>
                                    <c:if test="${joinedPosts.memberId == loginmember.memberId}">
                                        <div style="display: flex;">
                                            <a href="//post/edit?projectId=${joinedPosts.projectId}" style="z-index: 99999; color: currentColor;">
                                    <span id="joinedPosts_edit_${joinedPosts.projectId}" class="joinedPosts-edit svg-icon svg-icon-muted svg-icon-2hx">
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
                                            <a href="/project/progress?projectId=${joinedPosts.projectId}" style="z-index: 99998; color: currentColor;">
                                    <span class="svg-icon svg-icon-muted svg-icon-2hx">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path opacity="0.3" d="M14 3V21H10V3C10 2.4 10.4 2 11 2H13C13.6 2 14 2.4 14 3ZM7 14H5C4.4 14 4 14.4 4 15V21H8V15C8 14.4 7.6 14 7 14Z" fill="currentColor"/>
                                            <path d="M21 20H20V8C20 7.4 19.6 7 19 7H17C16.4 7 16 7.4 16 8V20H3C2.4 20 2 20.4 2 21C2 21.6 2.4 22 3 22H21C21.6 22 22 21.6 22 21C22 20.4 21.6 20 21 20Z" fill="currentColor"/>
                                        </svg>
                                    </span>
                                            </a>
                                        </div>
                                    </c:if>
                                </div>

                                <div class="d-flex flex-wrap align-items-center justify-content-between">
                                    <div><span class="uil fs-3 text-300 align-middle uil-lightbulb-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">
                            <c:forEach var="item" items="${joinedPosts.hashtag}">
                                #${item}
                            </c:forEach>
                        </span></div>
                                    <a class="badge badge-pill stretched-link ml-2 badge-success" href="/post/${joinedPosts.projectId}">Project Manager : ${joinedPosts.memberId}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

          <hr class="my-0" />

          <!-- /Account -->
        </div>
        <div class="card">

        </div>
      </div>
    </div>
  </div>
  <!-- / Content -->
</div>
<!-- Content wrapper -->
<!-- Core JS -->
<!-- build:js assets/vendor/js/core.js -->
<script src="../assets/vendor/libs/popper/popper.js"></script>
<script src="../assets/vendor/js/bootstrap.js"></script>
<script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="../assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->

<!-- Main JS -->
<script src="../assets/js/main.js"></script>

<!-- Page JS -->
<script src="../assets/js/pages-account-settings-account.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

