<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="content">
    <div class="row mx-n2" style="padding: 20px; font-size: xx-large;">
        BEST 큽마에
    </div>
    <form class="form-inline my-0 my-lg-0 pt-3" action="/kbmae/findimpl" method="get">
        <%--<input id="searchBox" class="form-control form-control-sm" type="search"
               placeholder="큽마에를 찾으세요!" aria-label="Search" style="border-style: none;"/>--%>
        <input type="text"  id="searchKbmae" name="searchKbmae" placeholder="찾으시는 스킬 입력하세요!"  <c:if test="${value != ''}">value="${value}"</c:if>>
        <button type="submit">검색</button>
    </form>
    <div id="kbmaeList" class="row mx-n2">
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
    </div>
</div>
