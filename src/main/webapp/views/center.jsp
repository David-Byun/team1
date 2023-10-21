<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>
    #review {
        display: flex;
        overflow: hidden;
        width: 100%;
    }

    .review-1 {
        flex: 0 0 33.33%;
        display: none; /* 처음에 모든 슬라이드를 숨김 */
        white-space: normal; /* 슬라이드 내부의 텍스트 줄 바꿈 설정 */
    }

    .row {
        margin-bottom: 0;
        overflow: hidden; /* 텍스트가 넘치는 경우 가릴 부분을 숨김 */
    }
</style>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const reviewContainer = document.getElementById("review");
        const slides = reviewContainer.getElementsByClassName("col-xxl-4");

        let currentSlideIndex = 0;
        const slidesPerView = 3;
        const slideWidth = slides[0].offsetWidth;

        reviewContainer.style.transform = `translateX(-${currentSlideIndex * slideWidth}px)`;

        function showSlides(startIndex) {
            for (let i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (let i = startIndex; i < startIndex + slidesPerView; i++) {
                if (i < slides.length) {
                    slides[i].style.display = "block";
                }
            }
            reviewContainer.style.transform = `translateX(-${startIndex * slideWidth}px)`;
        }

        function nextSlides() {
            currentSlideIndex = (currentSlideIndex + slidesPerView) % slides.length;
            showSlides(currentSlideIndex);
        }

        function autoSlide() {
            nextSlides();
        }

        setInterval(autoSlide, 5000); // 2초마다 슬라이드 전환

        showSlides(currentSlideIndex);
    });
</script>
<div class="carousel slide" id="carouselExampleControls" data-ride="carousel">
    <ol class="carousel-indicators">
        <li class="active" data-target="#carouselExampleControls" data-slide-to="0"></li>
        <li data-target="#carouselExampleControls" data-slide-to="1"></li>
        <li data-target="#carouselExampleControls" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner rounded"   style="padding-top: 4%;">
        <div class="carousel-item active"><img class="d-block w-100" src="/assets/img/banner/banner_1.png" alt="First slide" /></div>
        <div class="carousel-item"><img class="d-block w-100" src="/assets/img/banner/banner_2.png" alt="Second slide"/></div>
        <div class="carousel-item"><img class="d-block w-100" src="/assets/img/banner/banner_3.png" alt="Third slide" /></div>
    </div>
    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<div class="content col-xxl-9" style="margin: auto; padding: 5% 0% 0% 0%">
    <div class="row mx-n2" style="padding: 20px; font-size: x-large; font-weight: bold;">
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
                            <div style="display: flex;">
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
                                <a href="/project/progress?projectId=${post.projectId}" style="z-index: 99998; color: currentColor;">
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
    <div class="row mx-n2" style="padding : 20px;font-size: x-large; font-weight: bold;">
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
    <div class="row mx-n2" style="padding: 20px; font-size: x-large; font-weight: bold;">
        참여후기
    </div>
    <div id="review" class="row mx-n2">
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4 review-1">
            <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/page.jpeg" alt="" />
                <div class="card-img-overlay d-flex flex-column justify-content-between">
                    <h5 class="card-title text-black">KB국민은행 인재개발부 변다윗 대리</h5>
                    <div class="text-black">사이드 프로젝트를 진행하면서 팀원을 구하는데 큽MAESTRO를 많이 이용하고 있습니다. 개발자 이외에 디자이너, 기획 등 다양한 분야의 사람들을 만날 수 있는 유용한 사이트인 것 같습니다. 큽MAESTRO를 통해 좋은 사람들을 만나서 즐겁게 프로젝트 진행하고 있습니다.</div>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div></div><a class="badge badge-pill stretched-link ml-2 badge-info" href="/page">백엔드 개발자</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4 review-1">
            <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/page.jpeg" alt="" />
                <div class="card-img-overlay d-flex flex-column justify-content-between">
                    <h5 class="card-title text-black">KB국민은행 개인여신부(P) 이나은 계장</h5>
                    <div class="text-black">누구나에게 꿈은 있으리라 판단이 됩니다. 다만 현실과의 간극 때문에 이를 꿈으로만 남겨두는 경우가 다수인데요. 큽MAESTRO은 그 꿈을 현실로써 이룰 수 있는 가장 좋은 도구라 생각합니다. 나와 비슷한 상황에 내가 부족한 부분을 채워줄 수 있는 훌륭하신 분들이 많아 너무나 좋았습니다.</div>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div></div><a class="badge badge-pill stretched-link ml-2 badge-primary" href="/page">기획자</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4 review-1">
            <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/page.jpeg" alt="" />
                <div class="card-img-overlay d-flex flex-column justify-content-between">
                    <h5 class="card-title text-black">KB국민은행 스타뱅킹부(P) 유성진 과장</h5>
                    <div class="text-black">새로 팀원들을 구인하는데 우연한 계기로 사이드프로젝트에 대해서 알게 됐습니다. 생각보다 많은 분들이 지원해주셔서 놀랐고, 다른 사이트들보다 구성원들이 열의가 있어서 좋았습니다!!</div>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div></div><a class="badge badge-pill stretched-link ml-2 badge-primary" href="/page">기획자</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="px-2 col-sm-6 col-lg-4 col-xxl-4 review-1">
            <div class="card card-blog"><img class="card-img img-fluid" src="/assets/img/group/page.jpeg" alt="" />
                <div class="card-img-overlay d-flex flex-column justify-content-between">
                    <h5 class="card-title text-black">KB국민은행 스타뱅킹부(P) 박선미 대리</h5>
                    <div class="text-black">새로 팀원들을 구인하는데 우연한 계기로 큽MAESTRO에 대해서 알게 됐습니다. 생각보다 많은 분들이 지원해주셔서 놀랐고, 다른 사이트들보다 구성원들이 열의가 있어서 좋았습니다!!</div>
                    <div class="d-flex flex-wrap align-items-center justify-content-between">
                        <div><span class="uil fs-3 text-300 align-middle uil-book-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Coworking Business Model</span></div><a class="badge badge-pill stretched-link ml-2 badge-primary" href="/page">디자이너</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
