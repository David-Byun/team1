<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<script>
    function apply(){
        $('#apply').click(
            Swal.fire({
                title: '프로젝트에 지원했어요!',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            })
        )
    }
</script>
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
                                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(${post.img}); background-repeat: no-repeat; background-size: cover;" >
                                </div>
                                <!--/.bg-holder-->

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
                                    <div class="avatar avatar-xl mr-4">
                                        <img class="rounded-circle" style="width:60px; height:60px;" src="/assets/img/skill/${item}.png" alt="" />
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>

                                <div class="px-4 px-sm-6 px-md-8 pb-6">
                                <div class="hr-sect d-flex justify-content-center">
                                    <div class="bg-white text-center d-flex align-items-center z-index-1 px-3"><span class="py-0 py-sm-1 font-weight-bold text-1000 ml-2">Share</span>
                                        <div> <a class="fs-4 text-decoration-none uil uil-facebook" href="#"> </a><a class="fs-4 text-decoration-none uil uil-blogger" href="#"></a><a class="fs-4 text-decoration-none uil uil-linkedin" href="#"></a></div>
                                    </div>
                                </div>
                                <h3 class="text-center text-800">리더에게 문의해 보세요</h3>
                                <p class="text-center text-600">매일 9시부터 18시까지 응답해드릴 수 있어요</p>
                                <form class="mailbluster-subscribe">
                                    <div class="mailbluster-feedback"></div>
                                    <input type="hidden" value="Thank you so much for subscribing!" />
                                    <div class="input-group-icon mb-2">
                                        <input class="form-control form-control-lg input-box" type="email" placeholder="Email address" aria-label="Email" /><span class="uil uil-envelope fs-2 input-box-icon"> </span>
                                    </div>
                                    <button class="btn btn-primary btn-block py-2" type="submit">Subscribe to our newsletter </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>