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
                                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(assets/img/group/pic-1.png);">
                                </div>
                                <!--/.bg-holder-->

                                <div class="position-relative pb-3 px-4 px-sm-6 pt-7">
                                    <button class="close btn-close" type="button" style="display:none;" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>
                                    <h1 class="card-title text-white mt-3">프로젝트 제목 🤘</h1>
                                    <div class="d-flex flex-wrap align-items-center justify-content-between mt-6">
                                        <div><span class="uil fs-3 text-300 align-middle uil-lightbulb-alt"></span><span class="text-white fs--1">Reffering Workspace</span></div><span class="my-3 mx-3 mx-lg-2 badge badge-pill badge-info">Sample Badge          </span>
                                    </div>
                                </div>
                            </div>
                            <div class="px-4 px-sm-6 pt-4 pt-sm-4">
                                <h3 class="text-800">Thiel spends 6 months writing down everything he knows about business. His book sells for $10 on Amazon.</h3>
                                <p class="dropcap dropcap-lg">
                                    Adam Wathan and Steve Schoger spend 6 months writing down everything they know about design. Their “book” sells for $79 online.Believe it or not, both prices make perfect sense.Thiel is selling to the masses and the masses are sensitive to price changes (price elastic). If he raises the price to $30 they wouldn’t think twice before substituting his book for one of the many cheaper alternatives on Amazon.</p><img class="rounded img-fluid" src="assets/img/group/pic-9.jpg" alt="" />
                                <h3 class="text-800 pt-3">8 UI design trends for 2020</h3>
                                <h6 class="mb-2 text-muted">Dawid Tomczyk</h6>
                                <p class="dropcap">The rapid growth of technology influences design trends every year. As designers we need be aware of the existing and upcoming design trends, constantly learning, improving and expanding our design toolkit in order to be up to date on the current market. Based on my research, experience and observations I’ve selected very carefully 8 UI/UX design trends that you should watch in 2020. Let’s get started then! :)</p>
                                <p>Adam Wathan and Steve Schoger spend
                                    <mark>6 months </mark>writing down everything they know about design. Their “book” sells for
                                    Adam Wathan and Steve Schoger spend 6 months writing down everything they know about design. Their “book” sells for <a href="#">$79 online.</a>Believe it or not, both prices make perfect sense.
                                </p>
                                <h3 class="text-800">10 quotes from a bad UX designer</h3>
                                <p class="mb-4">Illustrations have been in digital product design for a long time. Their evolution in the last years is very impressive. Illustrations as very popular design elements add natural feel and “human touch” to overall UX of our products. Illustrations are also very strong attention grabbers: at the top of that by applying motion to these illustrations we might bring our products to the life and make them stand out— adding extra details and personality.</p>
                                <div class="mb-4"> <img class="rounded img-fluid" src="assets/img/group/pic-10.jpg" alt="" /></div>
                                <p class="mb-4">Microinteractions exist pretty much in every single app or website. You see them every time when you’re opening your favourite app —for instance Facebook has tons of different microinteractions and I assume that the “Like” feature is just the perfect example. Sometimes we are not even aware of existence, because they are so so obvious, natural and “blended” into user interfaces. Altough, If you remove them from your product you will notice very quickly that something really important is missing.</p>
                                <div class="mb-4"> <img class="rounded img-fluid" src="assets/img/group/pic-11.jpg" alt="" /></div>
                                <p class="mb-4">
                                    3D graphic exist pretty much everywhere — in movies, video games, adverts on the streets. 3D graphic has been introduced few decades ago and since then has improved and evolved dramatically. Mobile and web technology is also growing rapidly fast. New web browser capabilities have opened the door for 3D graphic allowing us as designers to create and implement amazing 3D graphics into modern web and mobile interfaces.</p>
                                <div class="mb-4"> <img class="rounded img-fluid" src="assets/img/group/pic-12.jpg" alt="" /></div>
                                <div class="jumbotron">
                                    <h3 class="text-800">Why learn? 3 ways SQL basics can boost agency</h3>
                                    <p>Microinteractions exist pretty much in every single app or website. </p>
                                    <hr class="my-4" />
                                    <p>The query I got from our data scientist returned writers who had published within the last 2 days.The real value of these tools is their data. Luckily, most of these tool providers allow you to export their raw data in one way or another. </p><a class="btn btn-light btn-lg border-primary" href="#" role="button">Learn more</a>
                                </div>
                            </div>
                            <div class="px-4 px-sm-6 px-md-8 pb-6">
                                <div class="hr-sect d-flex justify-content-center">
                                    <div class="bg-white text-center d-flex align-items-center z-index-1 px-3"><span class="py-0 py-sm-1 font-weight-bold text-1000 ml-2">Share</span>
                                        <div> <a class="fs-4 text-decoration-none uil uil-facebook" href="#"> </a><a class="fs-4 text-decoration-none uil uil-blogger" href="#"></a><a class="fs-4 text-decoration-none uil uil-linkedin" href="#"></a></div>
                                    </div>
                                </div>
                                <h3 class="text-center text-800">Subscribe To Our Newsletter</h3>
                                <p class="text-center text-600">Join 10,943 marketers getting 2 case studies <br class="d-none d-sm-block d-md-none" />every Tuesday and Friday </p>
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