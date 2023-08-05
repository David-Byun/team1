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
    <title>Grid</title>


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
      <div class="content">
        <div class="row mx-n2">
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-1.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Revolutionise Your Workspace With Us At Gridworks</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-lightbulb-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Reffering Workspace</span></div><a class="badge badge-pill stretched-link ml-2 badge-success" data-toggle="modal" href="#modal-card">Entrepreneurship</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2  col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-2.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Coworking Spaces Built For Your Start Startups 🤘</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-brain"></span><span class="text-white fs--1 mb-0 d-inline-block">Define Your Vision</span></div><a class="badge badge-pill stretched-link ml-2 badge-warning" data-toggle="modal" href="#modal-card">Startups Weekly</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-3.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Everything Your Team Could Need, We Have Got It.</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-question-circle"></span><span class="text-white fs--1 mb-0 d-inline-block">Solve Specific Problem</span></div><a class="badge badge-pill stretched-link ml-2 badge-light" data-toggle="modal" href="#modal-card">Week in Review</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-8 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-4.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">How to grow and scale your business without hiring more people</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-map-pin-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Define your Space</span></div><a class="badge badge-pill stretched-link ml-2 badge-danger" data-toggle="modal" href="#modal-card">Creativity</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-5.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">How training my brain to focus helped me to build two profitable businesses</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-list-ui-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">List Your Business Goals</span></div><a class="badge badge-pill stretched-link ml-2 badge-info" data-toggle="modal" href="#modal-card">Motivation</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-6 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-6.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">How to escape competition (and build a business on your own terms)</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-users-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Pick Your Team</span></div><a class="badge badge-pill stretched-link ml-2 badge-info" data-toggle="modal" href="#modal-card">Personal Development</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-6 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-7.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Sell Something Bigger Than Your Otherwise Boring Business</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-book-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Coworking Business Model</span></div><a class="badge badge-pill stretched-link ml-2 badge-primary" data-toggle="modal" href="#modal-card">Life Lessons</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-8 col-xxl-6">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-8.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">The unofficial (slightly sarcastic) thesaurus for business buzzwords.✌️</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-keyhole-circle"></span><span class="text-white fs--1 mb-0 d-inline-block">Key Resources</span></div><a class="badge badge-pill stretched-link ml-2 badge-success" data-toggle="modal" href="#modal-card">Business</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-6">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-13.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Bootstrapping Guide: How to Start a Business with No Money 👌</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-focus-target"></span><span class="text-white fs--1 mb-0 d-inline-block">Target Audience</span></div><a class="badge badge-pill stretched-link ml-2 badge-danger" data-toggle="modal" href="#modal-card">Innovation</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-6 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-14.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">How to make better decisions in life and in business: a mini guide</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-keyhole-square"></span><span class="text-white fs--1 mb-0 d-inline-block">Key Activities</span></div><a class="badge badge-pill stretched-link ml-2 badge-success" data-toggle="modal" href="#modal-card">Hard Work</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-6 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-15.jpg" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Button colors won’t save your business</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-usd-square"></span><span class="text-white fs--1 mb-0 d-inline-block">Revenue Streams</span></div><a class="badge badge-pill stretched-link ml-2 badge-primary" data-toggle="modal" href="#modal-card">Investing</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-8 col-xxl-4">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-16.jpg" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Slow growth is good for business 🔥</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-user-plus"></span><span class="text-white fs--1 mb-0 d-inline-block">Added Value</span></div><a class="badge badge-pill stretched-link ml-2 badge-success" data-toggle="modal" href="#modal-card">Blogging</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-17.jpg" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Why Businesses Should Start Focusing on Google’s Flutter and Fuchsia</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-megaphone"></span><span class="text-white fs--1 mb-0 d-inline-block">Advertising</span></div><a class="badge badge-pill stretched-link ml-2 badge-info" data-toggle="modal" href="#modal-card">Freelancing</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-18.jpg" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">Mapping a Business Model in 5 Steps</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-users-alt"></span><span class="text-white fs--1 mb-0 d-inline-block">Customer Segments</span></div><a class="badge badge-pill stretched-link ml-2 badge-success" data-toggle="modal" href="#modal-card">Development</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-19.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">You Are The Problem With Your Business</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-user-plus"></span><span class="text-white fs--1 mb-0 d-inline-block">Partners</span></div><a class="badge badge-pill stretched-link ml-2 badge-warning" data-toggle="modal" href="#modal-card">Evolution</a>
                </div>
              </div>
            </div>
          </div>
          <div class="px-2 col-sm-6 col-lg-4 col-xxl-3">
            <div class="card card-blog"><img class="card-img img-fluid" src="assets/img/group/pic-20.png" alt="" />
              <div class="card-img-overlay overlay-gradient d-flex flex-column justify-content-between">
                <h5 class="card-title text-white">How to make Subscription Model Work for Your Business</h5>
                <div class="d-flex flex-wrap align-items-center justify-content-between">
                  <div><span class="uil fs-3 text-300 align-middle uil-megaphone"></span><span class="text-white fs--1 mb-0 d-inline-block">Marketing Strategies</span></div><a class="badge badge-pill stretched-link ml-2 badge-light" data-toggle="modal" href="#modal-card">Confidence</a>
                </div>
              </div>
            </div>
          </div>
          <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="modal-card">
            <div class="modal-dialog modal-lg" role="document">
              <div class="modal-content overflow-hidden border-0">
                <div class="modal-body scroll-modal-height perfect-scrollbar scrollbar">
                  <div class="position-relative">
                    <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(assets/img/group/pic-1.png);">
                    </div>
                    <!--/.bg-holder-->

                    <div class="position-relative pb-3 px-4 px-sm-6 pt-7">
                      <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>
                      <h1 class="card-title text-white mt-3">Coworking Spaces Built For Your Start Startups 🤘</h1>
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
      <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="modal-services">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content overflow-hidden border-0">
            <div class="modal-body scroll-modal-height perfect-scrollbar scrollbar">
              <div class="position-relative">
                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(assets/img/illustrations/services.png);">
                </div>
                <!--/.bg-holder-->

                <div class="position-relative pb-3 px-4 px-sm-6 pt-3">
                  <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>
                  <h1 class="card-title text-white mt-3">Set projects to excellence</h1>
                  <p class="text-white"> Our team always enjoys interesting projects that are challenging and original. No matter the task is, we are up to it. While we have the ability of learning new things quickly and can take on just anything you throw at us, here are a few areas we specialize in.</p>
                </div>
              </div>
              <div class="px-7 py-3 text-center"> <img class="mb-3" src="assets/img/illustrations/web-app.png" alt="" width="200" />
                <h5 class="text-800 mb-3">Web applications</h5>
                <p>Web apps are the backbone of today's most popular software as a service product. We will help you succeed by conducting through market research and providing you actionable insights to position your product in the top.</p>
                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/mobile-app.png" alt="" width="200" />
                <h5 class="text-800 mb-3">Mobile applications</h5>
                <p>Over 50% of the smartphone users start using their phone just after waking up in the morning and spend more than 3 hours per day. Our team can help you design an incredible iOS or Android application no matter the complexity.</p>
                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/web-design.png" alt="" width="200" />
                <h5 class="text-800 mb-3">Web design</h5>
                <p>Technext Website Design team creates state of the art design ensuring the consistency and perfection across all major operating systems. It creates synergy between visuals, feelings, and experiences. </p>
                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/e-commerce.png" alt="" width="200" />
                <h5 class="text-800 mb-3">eCommerce Sites</h5>
                <p>Web apps are the backbone of today's most popular software as a service product. We will help you succeed by conducting through market research and providing you actionable insights to position your product in the top. </p>
                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/web-portal.png" alt="" width="200" />
                <h5 class="text-800 mb-3">Web portals</h5>
                <p>Consumers are driving crazy to online stores and shops in record numbers. Our team can help you monetize your checkout page, create seamless buying experience on handheld devices, setup email marketing solution and help you sell more.</p>
                <hr class="mx-9 mt-4 mb-6" /><img class="mb-3" src="assets/img/illustrations/data-driven.png" alt="" width="200" />
                <h5 class="text-800 mb-3">Data driven apps</h5>
                <p class="mb-5">Web apps are the backbone of today's most popular software as a service product. We will help you succeed by conducting through market research and providing you actionable insights to position your product in the top. </p>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="modal-contacts">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content overflow-hidden border-0">
            <div class="modal-body scroll-modal-height perfect-scrollbar scrollbar">
              <div class="position-relative">
                <div class="bg-holder overlay overlay-gradient-1 rounded-top" style="background-image:url(assets/img/group/street.jpg);">
                </div>
                <!--/.bg-holder-->

                <div class="position-relative pb-3 py-5 px-4 px-sm-4">
                  <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>
                  <div class="row no-gutters">
                    <div class="col-md-12 col-lg-6">
                      <h3 class="text-200 pb-2">Keep in touch</h3>
                      <form class="zform" method="post">
                        <input class="form-control" type="hidden" name="to" value="username@domain.extension" />
                        <input class="form-control" type="hidden" name="to" value="user@domain.extension" />
                        <div class="form-group">
                          <input class="form-control" type="text" placeholder="Your Name" required="" />
                        </div>
                        <div class="form-group">
                          <input class="form-control" type="email" placeholder="Email" required="" />
                        </div>
                        <div class="form-group">
                          <textarea class="form-control" rows="4" placeholder="Enter your descriptions here..." required=""></textarea>
                        </div>
                        <div class="zform-feedback"></div>
                        <div class="form-group">
                          <button class="btn btn-light btn-lg border-primary text-primary btn-block" type="submit">Send now</button>
                        </div>
                      </form>
                    </div>
                    <div class="col-md-12 col-lg-6 pl-lg-4">
                      <h3 class="text-200">Contacts</h3>
                      <ul class="list-unstyled mb-0">
                        <li><span class="uil uil-envelope fs-3 text-300 align-middle"></span><a class="text-white ml-sm-2" href="mailto:example@eamil.com">example@eamil.com</a></li>
                        <li><span class="uil fs-3 text-300 align-middle uil uil-phone"></span><a class="ml-sm-2 text-white" href="tel:+604-680-9785">+604-680-9785</a></li>
                        <li><span class="uil fs-3 text-300 align-middle uil uil-map"></span><span class="ml-sm-2 text-white">67 Robson St,British Columbia, Canada</span></li>
                      </ul>
                      <hr class="bg-600 mr-10 ml-1" />
                      <h4 class="text-white">Follow Us On<strong class="text-light">Social Media</strong></h4>
                      <p class="text-500">We are active on various social media platforms. Like, share and follow to get updates.</p><a class="mt-2 text-400" href="#"><span class="uil uil-twitter fs-2"></span></a><a class="mt-2 text-400" href="#"><span class="uil uil-facebook-f fs-2"></span></a><a class="mt-2 text-400" href="#"><span class="uil uil-instagram-alt fs-2"></span></a><a class="mt-2 text-400" href="#"><span class="uil uil-google-drive fs-2"></span></a>
                    </div>
                  </div>
                </div>
              </div>
              <div class="googlemap min-vh-50" data-latlng="48.8583701,2.2922873,17" data-scrollwheel="false" data-icon="assets/img/icons/map-marker.png" data-zoom="17" data-theme="Default">
                <div class="marker-content py-3 pl-4">
                  <h5>Eiffel Tower</h5>
                  <p></p>Gustave Eiffel's iconic, wrought-iron 1889 tower,<br />with steps and elevators to observation decks.
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" tabindex="-1" role="dialog" aria-hidden="true" id="modal-demo">
        <div class="modal-dialog modal-lg" role="document">
          <div class="modal-content overflow-hidden border-0">
            <div class="modal-body scroll-modal-height perfect-scrollbar scrollbar">
              <button class="close btn-close" type="button" data-dismiss="modal" aria-label="Close"><span class="uil uil-times" aria-hidden="true"></span></button>
              <div class="px-sm-8 py-sm-6 px-6 py-4"><img class="img-fluid" src="assets/img/illustrations/d-image.png" alt="" /></div>
              <div class="bg-400 px-3 text-center py-5">
                <h3 class="text-800 mb-3">Start your new project with <br />Grid right now!</h3>
                <button class="btn btn-info btn-lg" type="Submit"><span class="color-white">Simple button              </span></button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="modal-components" tabindex="-1" role="dialog" aria-labelledby="modal-components-title" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header px-5 pb-2 pt-4 border-bottom-0">
              <h5 class="modal-title" id="modal-components-title">Components </h5>
              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body px-5">
              <hr class="mt-0 mb-1" />
              <div class="row pt-2 no-gutters">
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/alerts.html">Alerts</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/background.html">Background</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/badges.html">Badges</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/breadcrumb.html">Breadcrumb</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/buttons.html">Buttons</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/cards.html">Cards</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/carousel.html">Carousel</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/collapse.html">Collapse</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/dropdowns.html">Dropdowns</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/fancyscroll.html">Fancyscroll</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/forms.html">Forms</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/hoverbox.html">Hoverbox</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/list-group.html">List group</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/modals.html">Modals</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/media-object.html">Media object</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/navs.html">Navs</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/navbar.html">Navbar</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/page-headers.html">Page headers</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/pagination.html">Pagination</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/popovers.html">Popovers</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/progress.html">Progress</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/scrollspy.html">Scrollspy</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/spinners.html">Spinners</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/tables.html">Tables</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/tabs.html">Tabs</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/tooltips.html">Tooltips</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/toasts.html">Toasts</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/php-AJAX-form.html">Php AJAX form</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="components/mailbluster.html">Mailbluster</a></li>
                  </ul>
                </div>
              </div>
              <h5>Plugins</h5>
              <hr class="mt-0 mb-1" />
              <div class="row pt-2 pb-4 no-gutters">
                <div class="col-6 col-sm-3">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="plugins/unicons.html">Unicons</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm-3">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="plugins/loaders.html">Loaders</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm-3">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="plugins/google-map.html">Google map</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="modal-utilities" tabindex="-1" role="dialog" aria-labelledby="modal-utilities-title" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header px-5 pb-2 pt-4 border-bottom-0">
              <h5 class="modal-title" id="modal-utilities-title">Utilities</h5>
              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body px-5">
              <hr class="mt-0 mb-1" />
              <div class="row pt-2 pb-4 no-gutters">
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/borders.html">Borders</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/clearfix.html">Clearfix</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/close-icon.html">Close icon</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/colors.html">Colors</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/display.html">Display</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/embed.html">Embed</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/flex.html">Flex</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/figures.html">Figures</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/grid.html">Grid</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/sizing.html">Sizing</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/stretched-link.html">Stretched link</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/spacing.html">Spacing</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/typography.html">Typography</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/vertical-align.html">Vertical align</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="utilities/visibility.html">Visibility</a></li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="modal-documentation" tabindex="-1" role="dialog" aria-labelledby="modal-documentation-title" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header px-5 pb-2 pt-4 border-bottom-0">
              <h5 class="modal-title" id="modal-documentation-title">Documentation</h5>
              <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
            </div>
            <div class="modal-body px-5">
              <hr class="mt-0 mb-1" />
              <div class="row pt-2 pb-4 no-gutters">
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/getting-started.html">Getting started</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/file-structure.html">File structure</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/customization.html">Customization</a></li>
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/gulp.html">Gulp</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled mb-0">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/RTL.html">RTL</a></li>
                  </ul>
                </div>
                <div class="col-6 col-sm">
                  <ul class="list-unstyled">
                    <li class="nav-item"><a class="nav-link py-1 pl-0 text-600" href="documentation/plugins.html">Plugins</a></li>
                  </ul>
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