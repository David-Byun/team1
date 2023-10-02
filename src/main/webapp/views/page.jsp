<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    #edit_btn:hover,
    #edit_btn:active,
    #edit_btn {
        text-decoration: none;
    }
</style>
<script type='text/javascript'>
    $(document).ready(function() {
        // "리더에게 문의하기" 버튼 클릭 이벤트 처리
        $("#sendEmailButton").click(function() {
            // 폼 데이터 가져오기
            var formData = $("#emailForm").serialize();
            if($('#msg').val() == '' || $('#msg').val() == null){
                Swal.fire(
                    '문의 내용을 입력해주세요!',
                )
                return;
            }

            // 서버로 데이터 전송
            $.ajax({
                type: "POST",
                url: "/sendEmail",
                data: formData,
                success: function(response) {
                    // 서버 응답 처리
                    Swal.fire(
                        '프로젝트 문의 메일을 발송했어요!',
                    )
                    $('#msg').val('');
                }
            });
        });

        // "프로젝트 미팅하기" 버튼 클릭 이벤트 처리
        $("#meetingButton").click(function() {
            // 원하는 동작 수행, 예: 다른 페이지로 이동
            window.location.href = 'https://192.168.0.157:3010/';
        });
    });

    // ID 값을 증가시키는 함수
    function apply(id, button) {
        const element = document.getElementById(id);
        const currentValue = parseInt(element.textContent);
        element.textContent = currentValue + 1;
        $.post("/your-server-url", { id: id, value : currentValue}, function(response) {
            if (response.success) {
                element.textContent = currentValue + 1;
                button.disabled = true; // 버튼 비활성화
            } else {
                alert("지원에 실패했습니다.");
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');

        var calendar = new FullCalendar.Calendar(calendarEl, {
            googleCalendarApiKey: 'AIzaSyDjk_46V4EV_AHXb7MmJdON3zkiNt3WCQs',
            eventSources: [
                {
                    googleCalendarId: 'kbdavid890414@gmail.com',
                    className: '여의도나들이',
                    color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
                    //textColor: 'black'
                },
                {
                    googleCalendarId: 'kbdavid890414@gmail.com',
                    className: '테스트',
                    color: '#204051',
                    //textColor: 'black'
                },
                {
                    googleCalendarId: 'kbdavid890414@gmail.com',
                    className: 'Tasks',
                    color: '#3b6978',
                    //textColor: 'black'
                }
            ]
        });
        calendar.render();
    });
</script>

<style>
    #calendar{
        margin:auto;
    }
</style>
<!-- ===============================================-->
<!--    Main Content-->
<!-- ===============================================-->

    <div class="content" >
        <div class="row">
            <div class="px-2 col-sm-12 col-lg-12 col-xxl-12">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content overflow-hidden border-0">
                        <div class="modal-body">
                            <div class="position-relative">
                                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url('/assets/img/group/${post.img}'); background-repeat: no-repeat; background-size: cover;" >
                                </div>

                                <div class="position-relative pb-3 px-4 px-sm-6 pt-7">
                                    <button class="close btn-close" type="button" style="display:none;" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>
                                    <h1 class="card-title text-white mt-3">${post.title} 🤘
                                        <c:if test="${loginmember.memberId == post.memberId}">
                                            <a href="/post/edit?projectId=${post.projectId}" id="edit_btn" style="color: currentColor;">
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
                                                    </svg><span style="font-size: 1.1rem;">EDIT</span>
                                                </span>
                                            </a>
                                        </c:if>
                                    </h1>
                                    <div class="d-flex flex-wrap align-items-center justify-content-between mt-6">
                                        <div><span class="uil fs-3 text-300 align-middle uil-lightbulb-alt"></span><span class="text-white fs--1" style="font-weight: bold"><c:forEach var="item" items="${post.hashtag}">
                                           #${item}
                                        </c:forEach></span></div><span class="my-3 mx-3 mx-lg-2 badge badge-pill badge-info">Project Manager : ${post.memberId}</span>

                                    </div>
                                </div>
                            </div>
                            <div class="px-4 px-sm-6 pt-4 pt-sm-4">
                                <h3 class="text-800">모집현황</h3>
                                <hr/>
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-8 col-sm-8">
                                            <div class="box">
                                                <p>UI/UX 기획</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p id="plan">${postDetail.plan}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p>/ ${post.plan}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply('plan', this)">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="box">
                                                <p>웹프론트엔드</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p id="front">${postDetail.front}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p>/ ${post.front}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply('front', this)">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="box">
                                                <p>디자인</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p id="design">${postDetail.design}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p>/ ${post.design}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply('design', this)">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="box">
                                                <p>백엔드</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p id="server">${postDetail.server}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-1 col-sm-1">
                                            <div class="box">
                                                <p>/ ${post.server}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply('server', this)">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="text-800 mt-5" >${post.title}</h3>
                                <hr/>
                                <p>${post.content}</p>
                                <img class="rounded img-fluid" src="assets/img/group/pic-9.jpg" alt="" />
                                <h3 class="text-800 mt-5">프로젝트 정보</h3>
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="col">모임 조회수</th>
                                        </tr>
                                        <tr>
                                            <th>${postDetail.viewCnt}</th>
                                        </tr>
                                        <tr>
                                            <th scope="col">모임 기간</th>
                                        </tr>
                                        <tr>
                                            <th>${postDetail.pdate}</th>
                                        </tr>
                                        <tr>
                                            <th scope="col">모임 분야</th>
                                        </tr>
                                        <tr>
                                            <th>${postDetail.subject}</th>
                                        </tr>
                                    </tbody>
                                </table>
                                <h3 class="text-800 pt-2">이 모임을 함께하는 렛플인</h3>
                                <hr/>
                                <div class="row">
                                    <c:forEach var="applicant" items="${applicantList}">
                                    <div class="col-md-3 mt-3">
                                        <div class="text-center">
                                            <c:choose>
                                                <c:when test="${applicant.img == '' || applicant.img == null}">
                                                    <img src="https://i.imgur.com/bDLhJiP.jpg" width="100" height="100" class="rounded-circle">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="/assets/img/avatars/${applicant.img}" width="100" height="100" class="rounded-circle">
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                        <div class="text-center mt-3">
                                            <span class="bg-black p-1 px-4 rounded text-white">Pro</span>
                                            <h5 class="mt-2 mb-0">${applicant.name}</h5>
                                            <span>${applicant.applyPart}</span>
                                            <div class="px-4 mt-1">
                                                근무부서<p class="fonts">${applicant.company}</p>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                                <h3 class="text-800 pt-2">기술/언어</h3>
                                <hr/>
                                <div class="mt-4">
                                    <c:forEach var="item" items="${post.hashtag}">
                                    <div class="avatar avatar-xl mr-2">
                                        <img class="rounded-circle" style="width:30px; height:30px;" src="/assets/img/skill/${item}.png" alt="" />
                                    </div>
                                    </c:forEach>
                                </div>
                                <h3 class="text-800 pt-5">프로젝트 캘린더</h3>
                                <hr/>
                                <div id='calendar'></div>
                            </div>

                            <div class="px-4 px-sm-6 px-md-8 pb-6">
                                <div class="hr-sect d-flex justify-content-center">
                                    <div class="bg-white text-center d-flex align-items-center z-index-1 px-3"><span class="py-0 py-sm-1 font-weight-bold text-1000 ml-2">Share</span>
                                        <div> <a class="fs-4 text-decoration-none uil uil-facebook" href="#"> </a><a class="fs-4 text-decoration-none uil uil-blogger" href="#"></a><a class="fs-4 text-decoration-none uil uil-linkedin" href="#"></a></div>
                                    </div>
                                </div>
                                <h3 class="text-center text-800">리더에게 문의해 보세요</h3>
                                <p class="text-center text-600">매일 9시부터 18시까지 응답해드릴 수 있어요</p>
                                <form method="post" action="/sendEmail" id="emailForm" >
                                    <div class="input-group-icon mb-2">
                                        <input class="form-control form-control-lg input-box" name="msg" type="text" placeholder="문의 내용 발송" id="msg"/><span class="uil uil-envelope fs-2 input-box-icon"></span>
                                    </div>
                                    <input type="hidden" name="name" value="${applicant.name}">
                                    <button id="sendEmailButton" class="btn btn-primary btn-block py-2" type="button">리더에게 문의하기</button>
                                    <button class="btn btn-danger btn-block py-2" type="button" type="button">프로젝트 미팅하기</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>