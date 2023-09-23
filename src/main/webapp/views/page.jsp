<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    function apply(){
        $('#apply').click(function(){
            Swal.fire({
                title: '프로젝트에 지원했어요!',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            });
            }
        )
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
                                    <h1 class="card-title text-white mt-3">${post.title} 🤘</h1>
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
                                        <div class="col-md-2 col-sm-2">
                                            <div class="box">
                                                <p>${postDetail.plan}/${post.plan}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2 col-sm-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply()">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="box">
                                                <p>웹프론트엔드</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <p>${postDetail.front}/${post.front}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply()">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="box">
                                                <p>디자인</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <p>${postDetail.design}/${post.design}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply()">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="box">
                                                <p>백엔드</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <p>${postDetail.server}/${post.server}</p>
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <div class="box">
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark" onclick="apply()">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="text-800 mt-5" >${postDetail.subtitle1}</h3>
                                <hr/>
                                <p>${postDetail.content1}</p>
                                <h3 class="text-800 mt-5" >${postDetail.subtitle2}</h3>
                                <hr/>
                                <p>${postDetail.content2}</p>
                                <h3 class="text-800 mt-5" >${postDetail.subtitle3}</h3>
                                <hr/>
                                <p>${postDetail.content3}</p>
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