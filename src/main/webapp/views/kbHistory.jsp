<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Nanum+Gothic&family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet">

<div class="content">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="row">
            <div class="col-md-12">
                <ul class="nav nav-pills flex-column flex-md-row mb-3">
                    <li class="nav-item">
                        <a class="nav-link" href="/kb?myPage=${loginmember.memberId}"><i class="bx bx-user me-1"></i> 마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/projectHistory?memberId=${loginmember.memberId}"
                        ><i class="bx bx-bell me-1"></i> 프로젝트 참여내역 </a
                        >
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="javascript:void(0);"
                        ><i class="bx bx-link-alt me-1"></i> 큽 사용내역</a
                        >
                    </li>
                </ul>
                <div class="card mb-4">
                    <h5 class="card-header">큽 사용 내역</h5>
                    <!-- Account -->
                    <hr class="my-0" />
                    <div class="card-body">
                        <form id="formAccountSettings" method="POST" onsubmit="return false">
                            <div class="mt-2">
                                <button type="submit" class="btn btn-primary me-2">Save changes</button>
                                <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                            </div>
                        </form>
                    </div>
                    <!-- /Account -->
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


