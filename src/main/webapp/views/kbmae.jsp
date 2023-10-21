<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="content">
    <div class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        BEST 큽마에
    </div>
    <div id="kbmaeList" class="row mx-n2">
        <c:forEach var="obj" items="${kbmaelist}">
            <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
                <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/${obj.img}" alt="" />
                    <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                        <h5 class="card-title text-white">${obj.name}[${obj.nickname}]</h5>
                        <div class="d-flex flex-wrap align-items-center justify-content-between">
                            <div><span class="uil fs-3 text-300 align-middle uil-users-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">${obj.company}</span></div>
                            <a class="badge badge-pill stretched-link ml-2 badge-info" href="/page">${obj.memo}</a>
                            <c:forEach var="innerobj" items="${obj.hashtagList}">
                                <a class="badge badge-pill stretched-link ml-2 badge-danger" href="/page">${innerobj}</a>
                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
        </c:forEach>
    </div>
</div>
