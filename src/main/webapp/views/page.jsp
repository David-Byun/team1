<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- ===============================================-->
    <!--    Document Title-->
    <!-- ===============================================-->
    <title>KB SidePJ</title>

    <!-- ===============================================-->
    <!--    Favicons-->
    <!-- ===============================================-->
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/img/favicons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/assets/img/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/assets/img/favicons/favicon-16x16.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicons/favicon.ico">
    <link rel="manifest" href="/assets/img/favicons/manifest.json">
    <meta name="msapplication-TileImage" content="/assets/img/favicons/mstile-150x150.png">
    <meta name="theme-color" content="#ffffff">

    <!-- ===============================================-->
    <!--    Stylesheets-->
    <!-- ===============================================-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700%7cPoppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    <link href="/assets/lib/perfect-scrollbar/perfect-scrollbar.css" rel="stylesheet">
    <link href="/assets/lib/unicons/css/unicons.css" rel="stylesheet">
    <link href="/assets/lib/loaders.css/loaders.min.css" rel="stylesheet">
    <link href="/assets/css/theme.css" rel="stylesheet">

</head>
<body>

<!-- ===============================================-->
<!--    Main Content-->
<!-- ===============================================-->
<main class="main" id="top">
    <div id="preloader">
        <div class="line-scale">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-light navbar-top bg-light fs--1 fixed-top py-0 pl-0"><a class="navbar-brand navbar-brand-custom" href="index.html">
        <div class="logo-icon"><span class="uil uil-apps text-light fs--1" aria-hidden="true"></span></div><span class="text-light ml-2 fs-1"><strong>Grid</strong>Works</span>
    </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-vertical-collapse" aria-controls="navbar-vertical-collapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse align-items-center py-2" id="topnav">
            <ul class="navbar-nav align-items-center">
                <li class="dropdown nav-item mr-2"><a class="nav-link" href="#" id="navbarDropdownUser" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="avatar avatar-xl">
                        <img class="rounded-circle" src="assets/img/icons/user-icon.png" alt="" />

                    </div>
                </a>
                    <div class="dropdown-menu dropdown-center py-0" aria-labelledby="navbarDropdownUser">
                        <div class="bg-white rounded-soft py-2">
                            <a class="dropdown-item font-weight-bold text-primary" href="#!"><span>Purchage Now</span></a>

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="/login">Login</a>
                            <a class="dropdown-item" href="/account">Profile &amp; account</a>
                            <a class="dropdown-item" href="/form">등록</a>

                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#!">Settings</a>
                            <a class="dropdown-item" href="#!">Logout </a>
                        </div>
                    </div>
                </li>
                <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-twitter fs-2"></span></a></li>
                <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-facebook-f fs-2"></span></a></li>
                <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-instagram-alt fs-2"> </span></a></li>
                <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-google-drive fs-2">     </span></a></li>
            </ul>
            <form class="mailbluster-subscribe form-inline ml-auto">
                <div class="mailbluster-feedback"></div>
                <input type="hidden" value="Thank you so much for subscribing!" />
                <div class="input-group-icon">
                    <input class="form-control form-control-lg input-box" type="email" placeholder="Email Address" aria-label="Email" required="" /><span class="uil uil-envelope fs-2 input-box-icon"></span>
                </div>
                <button class="btn btn-light btn-lg border-primary text-primary ml-3" type="submit">Stay Updated</button>
            </form>
        </div>
    </nav>
    <nav class="navbar navbar-vertical navbar-light bg-white">
        <div class="collapse navbar-collapse align-items-center perfect-scrollbar scrollbar" id="navbar-vertical-collapse">
            <div class="d-flex d-md-block flex-column mt-2">
                <ul class="navbar-nav align-items-center navbar-social-icons">
                    <li class="dropdown nav-item mr-2"><a class="nav-link" href="#" id="navbarDropdownUserResponsive" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <div class="avatar avatar-xl">
                            <img class="rounded-circle" src="assets/img/icons/user-icon.png" alt="" />

                        </div>
                    </a>
                        <div class="dropdown-menu dropdown-center py-0" aria-labelledby="navbarDropdownUserResponsive">
                            <div class="bg-white rounded-soft py-2">
                                <a class="dropdown-item font-weight-bold text-primary" href="#!"><span>Purchage Now</span></a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#!">Set status</a>
                                <a class="dropdown-item" href="#!">Profile &amp; account</a>
                                <a class="dropdown-item" href="#!">Feedback</a>

                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#!">Settings</a>
                                <a class="dropdown-item" href="#!">Logout </a>
                            </div>
                        </div>
                    </li>
                    <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-twitter fs-2"></span></a></li>
                    <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-facebook-f fs-2"></span></a></li>
                    <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-instagram-alt fs-2"> </span></a></li>
                    <li class="nav-item"><a class="nav-link px-0" href="#"><span class="uil uil-google-drive fs-2">     </span></a></li>
                </ul>
                <form class="mailbluster-subscribe navbar-email-form float-right order-1 order-md-0">
                    <div class="mailbluster-feedback"></div>
                    <input type="hidden" value="Thank you so much for subscribing!" />
                    <div class="row no-gutters">
                        <div class="col-12 col-md-auto px-md-2">
                            <div class="input-group-icon">
                                <input class="form-control form-control-lg input-box" type="email" placeholder="Email Address" aria-label="Email" required="" /><span class="uil uil-envelope fs-2 input-box-icon"></span>
                            </div>
                        </div>
                        <div class="col-12 col-md-auto">
                            <button class="btn btn-block btn-light btn-lg border-primary text-primary mt-2 mt-md-0" type="submit">Stay Updated</button>
                        </div>
                    </div>
                </form>
                <ul class="navbar-nav navbar-nav-vertical flex-row">
                    <li class="nav-item"><a class="nav-link" href="index.html"><span class="icons fs-3 uil uil-home-alt"></span><span class="fs--1"> Home</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-services" data-toggle="modal"><span class="icons fs-3 uil uil-bolt"></span><span class="fs--1"> Services</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-contacts" data-toggle="modal"><span class="icons fs-3 uil uil-phone"></span><span class="fs--1"> Contacts</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-components" data-toggle="modal"><span class="icons fs-3 uil uil-cog"></span><span class="fs--1"> Components</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-utilities" data-toggle="modal"><span class="icons fs-3 uil uil-wrench"></span><span class="fs--1"> Utilities</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-documentation" data-toggle="modal"><span class="icons fs-3 uil uil-clipboard-notes"></span><span class="fs--1"> Documentation</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-fire"></span><span class="fs--1"> Features</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-shopping-bag"></span><span class="fs--1"> Cart</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-pen"></span><span class="fs--1"> Blog</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-flower"></span><span class="fs--1"> About</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-swatchbook"></span><span class="fs--1"> Portfolio</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-usd-circle"></span><span class="fs--1"> Pricing</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-unlock"></span><span class="fs--1"> Terms</span></a>
                    </li>
                    <li class="nav-item"><a class="nav-link" href="#modal-demo" data-toggle="modal"><span class="icons fs-3 uil uil-comment-dots"></span><span class="fs--1"> Support</span></a>
                    </li>
                </ul><a class="footer-text order-2 order-md-0" href="https://themewagon.com/">Made with <span class="uil uil-heart-alt fs-1 text-info"></span>by ThemeWagon </a>
            </div>
        </div>
    </nav>
    <div class="content" >
        <div class="row">
            <div class="px-2 col-sm-12 col-lg-12 col-xxl-12">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content overflow-hidden border-0">
                        <div class="modal-body">
                            <div class="position-relative">
                                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(${post.img});">
                                </div>
                                <!--/.bg-holder-->

                                <div class="position-relative pb-3 px-4 px-sm-6 pt-7">
                                    <button class="close btn-close" type="button" style="display:none;" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>
                                    <h1 class="card-title text-white mt-3">${post.title} 🤘</h1>
                                    <div class="d-flex flex-wrap align-items-center justify-content-between mt-6">
                                        <div><span class="uil fs-3 text-300 align-middle uil-lightbulb-alt"></span><span class="text-white fs--1">해시태그</span></div><span class="my-3 mx-3 mx-lg-2 badge badge-pill badge-info">Project Manager : ${post.memberId}</span>
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
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark">지원</button>
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
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark">지원</button>
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
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark">지원</button>
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
                                                <button type="button" class="btn btn-outline-primary btn-rounded" data-mdb-ripple-color="dark">지원</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="text-800 mt-5" >${postDetail.subtitle1}</h3>
                                <hr/>
                                <h6 class="mb-2 text-muted">작성인 : ${post.memberId}</h6>
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
                                    <div class="col-md-6 mt-3">
                                        <div class="text-center">
                                            <img src="https://i.imgur.com/bDLhJiP.jpg" width="100" class="rounded-circle">
                                        </div>
                                        <div class="text-center mt-1">
                                            <span class="bg-secondary p-1 px-4 rounded text-white">Pro</span>
                                            <h5 class="mt-2 mb-0">변다윗</h5>
                                            <span>UI/UX Designer</span>
                                            <div class="px-4 mt-1">
                                                <p class="fonts">리브플랫폼부 근무중</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mt-3">
                                        <div class="text-center">
                                            <img src="https://i.imgur.com/bDLhJiP.jpg" width="100" class="rounded-circle">
                                        </div>
                                        <div class="text-center mt-1">
                                            <span class="bg-secondary p-1 px-4 rounded text-white">Pro</span>
                                            <h5 class="mt-2 mb-0">변다윗</h5>
                                            <span>UI/UX Designer</span>
                                            <div class="px-4 mt-1">
                                                <p class="fonts">리브플랫폼부 근무중</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h3 class="text-800 pt-2">기술/언어</h3>
                                <hr/>
                                <div class="mt-4">
                                    <div class="avatar avatar-xl mr-3">
                                        <img class="rounded-circle" style="width:50px; height:50px;" src="https://cdn.icon-icons.com/icons2/2415/PNG/512/java_original_wordmark_logo_icon_146459.png" alt="" />
                                    </div>
                                    <div class="avatar avatar-xl mr-3">
                                        <img class="rounded-circle" style="width:50px; height:50px;" src="https://cdn3.iconfinder.com/data/icons/logos-and-brands-adobe/512/267_Python-1024.png" alt="" />
                                    </div>
                                    <div class="avatar avatar-xl mr-3">
                                        <img class="rounded-circle" style="width:50px; height:50px;" src="https://developer.apple.com/assets/elements/icons/swift-playgrounds/swift-playgrounds-96x96_2x.png" alt="" />
                                    </div>
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
</main>
<!-- ===============================================-->
<!--    End of Main Content-->
<!-- ===============================================-->




<!-- ===============================================-->
<!--    JavaScripts-->
<!-- ===============================================-->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/popper.min.js"></script>
<script src="/assets/js/bootstrap.js"></script>
<script src="/assets/js/plugins.js"></script>
<script src="/assets/lib/is/is.min.js"></script>
<script src="/assets/lib/stickyfilljs/stickyfill.min.js"></script>
<script src="/assets/lib/sticky-kit/sticky-kit.min.js"></script>
<script src="/assets/lib/perfect-scrollbar/perfect-scrollbar.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyARdVcREeBK44lIWnv5-iPijKqvlSAVwbw&callback=initMap" async></script>
<script src="/assets/js/theme.js"></script>

</body>

</html>
