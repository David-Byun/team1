<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Nanum+Gothic&family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet">

<div class="content" style="margin: auto; padding: 5% 0% 0% 0%">
    <!-- Content -->

    <div class="container-xxl flex-grow-1 container-p-y">

        <div class="row">
            <div class="col-md-12">
                <h5 class="card-header">프로필</h5>
                <div class="card-body">
                    <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                                src="/assets/img/icons/${loginmember.img}"
                                alt="user-avatar"
                                class="d-block rounded"
                                height="100"
                                width="100"
                                id="uploadedAvatar"
                        />
                        <div class="button-wrapper">
                            <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                                <span class="d-none d-sm-block">Upload new photo</span>
                                <i class="bx bx-upload d-block d-sm-none"></i>
                                <input
                                        type="file"
                                        id="upload"
                                        class="account-file-input"
                                        hidden
                                        accept="image/png, image/jpeg"
                                />
                            </label>
                            <button type="button" class="btn btn-outline-secondary account-image-reset mb-4">
                                <i class="bx bx-reset d-block d-sm-none"></i>
                                <span class="d-none d-sm-block">Reset</span>
                            </button>

                            <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                        </div>
                    </div>
                    <!-- read only 끝 -->
                </div>
                <hr class="my-0" />
                <div class="card-body" >
                    <form id="formAccountSettings" method="POST" onsubmit="return false">
                        <div class="row" style="padding-bottom: 50px">
                            <h3><label class="form-label text-700" for="gitaddress">참고 사이트</label></h3>
                            <div class="mb-1">
                                <span class="text-muted float-end" style="font-size: 0.8rem;">
                                    <span class="svg-icon svg-icon-success svg-icon-2hx">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                            <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                            <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                        </svg>
                                    </span>깃, 블로그 등 나의 능력을 확인할 수 있는 사이트를 적어주세요!
                                </span>
                            </div>
                            <input id="gitaddress"
                                   class="form-control"
                                   name="gitaddress"
                                   value="${loginmember.gitaddress}"
                            />
                        </div>
                        <div class="row" style="padding-bottom: 50px">
                            <h3><label class="form-label text-700" for="memo"> +α</label></h3>
                            <div class="mb-1">
                                <span class="text-muted float-end" style="font-size: 0.8rem;">
                                    <span class="svg-icon svg-icon-success svg-icon-2hx">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                            <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                            <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                        </svg>
                                    </span>자기소개, 하고 싶은 말 등을 자유롭게 적어주세요
                                </span>
                            </div>
                            <input id="memo"
                                   class="form-control"
                                   name="memo"
                                   value="${loginmember.memo}"
                            />
                        </div >
                        <div class="row" style="float: right;margin: 5%">
                            <button type="submit" class="btn btn-primary me-2">Save changes</button>
                            <button type="reset" class="btn btn-outline-secondary">Cancel</button>
                        </div>
                    </form>
                </div>
                <!-- /Account -->
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
