<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Nanum+Gothic&family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet">

<%--<div class="text-white bg-success" style="width: 100%; max-width: 100%;">--%>
<%--  <div class="content col-xxl-9" style="padding: 6.5rem 0 2rem 0; width: 100%; max-width: 1200px; margin: 0 auto;">--%>
<%--    <p class="text-white text-900" style="font-size: 1.5rem; font-weight: bolder;">참여한 프로젝트--%>
<%--      <br/><span style="font-size: 0.9rem; font-weight: revert;">프로젝트 참여내역</span>--%>
<%--    </p>--%>
<%--  </div>--%>
<%--</div>--%>

<div class="content">
  <!-- Content -->

  <div class="container-xxl flex-grow-1 container-p-y">

    <div class="row">
      <div class="col-md-12">
        <ul class="nav nav-pills flex-column flex-md-row mb-3">
          <li class="nav-item">
            <a class="nav-link" href="/mypage?memberId=${loginmember.memberId}"><i class="bx bx-user me-1"></i> 마이페이지 </a>
          </li>
          <li class="nav-item">
            <a class="nav-link  active"  href="javascript:void(0);" href="/projectHistory?memberId=${loginmember.memberId}"
            ><i class="bx bx-bell me-1"></i> 프로젝트 참여내역 </a
            >
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/kb?memberId=${loginmember.memberId}"
            ><i class="bx bx-link-alt me-1"></i> 큽 사용내역</a
            >
          </li>
        </ul>
        <div class="card mb-4">
          <h5 class="card-header">프로필</h5>
          <!-- Account -->
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
          </div>
          <hr class="my-0" />
          <div class="card-body">
            <form id="formAccountSettings" method="POST" onsubmit="return false">
              <div class="row">
                <div class="mb-3 col-md-6">
                  <label for="firstName" class="form-label">First Name</label>
                  <input
                          class="form-control"
                          type="text"
                          id="firstName"
                          name="firstName"
                          value="John"
                          autofocus
                  />
                </div>
                <div class="mb-3 col-md-6">
                  <label for="lastName" class="form-label">Last Name</label>
                  <input class="form-control" type="text" name="lastName" id="lastName" value="Doe" />
                </div>
                <div class="mb-3 col-md-6">
                  <label for="email" class="form-label">E-mail</label>
                  <input
                          class="form-control"
                          type="text"
                          id="email"
                          name="email"
                          value="john.doe@example.com"
                          placeholder="john.doe@example.com"
                  />
                </div>
                <div class="mb-3 col-md-6">
                  <label for="organization" class="form-label">Organization</label>
                  <input
                          type="text"
                          class="form-control"
                          id="organization"
                          name="organization"
                          value="ThemeSelection"
                  />
                </div>
                <div class="mb-3 col-md-6">
                  <label class="form-label" for="phoneNumber">Phone Number</label>
                  <div class="input-group input-group-merge">
                    <span class="input-group-text">US (+1)</span>
                    <input
                            type="text"
                            id="phoneNumber"
                            name="phoneNumber"
                            class="form-control"
                            placeholder="202 555 0111"
                    />
                  </div>
                </div>
                <div class="mb-3 col-md-6">
                  <label for="address" class="form-label">Address</label>
                  <input type="text" class="form-control" id="address" name="address" placeholder="Address" />
                </div>
                <div class="mb-3 col-md-6">
                  <label for="state" class="form-label">State</label>
                  <input class="form-control" type="text" id="state" name="state" placeholder="California" />
                </div>
                <div class="mb-3 col-md-6">
                  <label for="zipCode" class="form-label">Zip Code</label>
                  <input
                          type="text"
                          class="form-control"
                          id="zipCode"
                          name="zipCode"
                          placeholder="231465"
                          maxlength="6"
                  />
                </div>
                <div class="mb-3 col-md-6">
                  <label class="form-label" for="country">Country</label>
                  <select id="country" class="select2 form-select">
                    <option value="">Select</option>
                    <option value="Australia">Australia</option>
                    <option value="Bangladesh">Bangladesh</option>
                    <option value="Belarus">Belarus</option>
                    <option value="Brazil">Brazil</option>
                    <option value="Canada">Canada</option>
                    <option value="China">China</option>
                    <option value="France">France</option>
                    <option value="Germany">Germany</option>
                    <option value="India">India</option>
                    <option value="Indonesia">Indonesia</option>
                    <option value="Israel">Israel</option>
                    <option value="Italy">Italy</option>
                    <option value="Japan">Japan</option>
                    <option value="Korea">Korea, Republic of</option>
                    <option value="Mexico">Mexico</option>
                    <option value="Philippines">Philippines</option>
                    <option value="Russia">Russian Federation</option>
                    <option value="South Africa">South Africa</option>
                    <option value="Thailand">Thailand</option>
                    <option value="Turkey">Turkey</option>
                    <option value="Ukraine">Ukraine</option>
                    <option value="United Arab Emirates">United Arab Emirates</option>
                    <option value="United Kingdom">United Kingdom</option>
                    <option value="United States">United States</option>
                  </select>
                </div>
                <div class="mb-3 col-md-6">
                  <label for="language" class="form-label">Language</label>
                  <select id="language" class="select2 form-select">
                    <option value="">Select Language</option>
                    <option value="en">English</option>
                    <option value="fr">French</option>
                    <option value="de">German</option>
                    <option value="pt">Portuguese</option>
                  </select>
                </div>
                <div class="mb-3 col-md-6">
                  <label for="timeZones" class="form-label">Timezone</label>
                  <select id="timeZones" class="select2 form-select">
                    <option value="">Select Timezone</option>
                    <option value="-12">(GMT-12:00) International Date Line West</option>
                    <option value="-11">(GMT-11:00) Midway Island, Samoa</option>
                    <option value="-10">(GMT-10:00) Hawaii</option>
                    <option value="-9">(GMT-09:00) Alaska</option>
                    <option value="-8">(GMT-08:00) Pacific Time (US & Canada)</option>
                    <option value="-8">(GMT-08:00) Tijuana, Baja California</option>
                    <option value="-7">(GMT-07:00) Arizona</option>
                    <option value="-7">(GMT-07:00) Chihuahua, La Paz, Mazatlan</option>
                    <option value="-7">(GMT-07:00) Mountain Time (US & Canada)</option>
                    <option value="-6">(GMT-06:00) Central America</option>
                    <option value="-6">(GMT-06:00) Central Time (US & Canada)</option>
                    <option value="-6">(GMT-06:00) Guadalajara, Mexico City, Monterrey</option>
                    <option value="-6">(GMT-06:00) Saskatchewan</option>
                    <option value="-5">(GMT-05:00) Bogota, Lima, Quito, Rio Branco</option>
                    <option value="-5">(GMT-05:00) Eastern Time (US & Canada)</option>
                    <option value="-5">(GMT-05:00) Indiana (East)</option>
                    <option value="-4">(GMT-04:00) Atlantic Time (Canada)</option>
                    <option value="-4">(GMT-04:00) Caracas, La Paz</option>
                  </select>
                </div>
                <div class="mb-3 col-md-6">
                  <label for="currency" class="form-label">Currency</label>
                  <select id="currency" class="select2 form-select">
                    <option value="">Select Currency</option>
                    <option value="usd">USD</option>
                    <option value="euro">Euro</option>
                    <option value="pound">Pound</option>
                    <option value="bitcoin">Bitcoin</option>
                  </select>
                </div>
              </div>
              <div class="mt-2">
                <button type="submit" class="btn btn-primary me-2">Save changes</button>
                <button type="reset" class="btn btn-outline-secondary">Cancel</button>
              </div>
            </form>
          </div>
          <!-- /Account -->
        </div>
        <div class="card">
          <h5 class="card-header">Delete Account</h5>
          <div class="card-body">
            <div class="mb-3 col-12 mb-0">
              <div class="alert alert-warning">
                <h6 class="alert-heading fw-bold mb-1">Are you sure you want to delete your account?</h6>
                <p class="mb-0">Once you delete your account, there is no going back. Please be certain.</p>
              </div>
            </div>
            <form id="formAccountDeactivation" onsubmit="return false">
              <div class="form-check mb-3">
                <input
                        class="form-check-input"
                        type="checkbox"
                        name="accountActivation"
                        id="accountActivation"
                />
                <label class="form-check-label" for="accountActivation"
                >I confirm my account deactivation</label
                >
              </div>
              <button type="submit" class="btn btn-danger deactivate-account">Deactivate Account</button>
            </form>
          </div>
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




<style>

  #external-events .fc-event {
    font-weight: bolder;
    padding: 5% 10% 5% 10%;
    border-radius: 10%;
    margin: 3px 0;
    cursor: move;
  }

  .modal-content {
    font-family: 'Gothic A1', sans-serif;
    font-family: 'Nanum Gothic', sans-serif;
    font-family: 'Noto Sans KR', sans-serif;
  }
  .modal-backdrop {
    background-color: rgb(0, 0, 0);
  }
  .cb1 {
    height: 15px;
    width: 15px;
    background-color: transparent;
    border: 1.7px solid #506690;
    border-radius: 25%;
    box-sizing: border-box;
    position: relative;
    display: inline-block;
    transition: border-color ease 0.2s;
    cursor: pointer;
  }

  .cb1::before, .cb1::after {
    position: absolute;
    height: 0;
    width: 4px;
    background-color: #5cbca2;
    box-sizing: border-box;
    display: inline-block;
    transform-origin: left top;
    border-radius: 5px;
    content: ' ';
    transition: opacity ease 0.5;
  }

  .cb1::before {
    top: 14.4px;
    left: 8.2px;
    box-shadow: 0 0 0 1px transparent;
    transform: rotate(-135deg);
  }
  .cb1::after {
    top: 7.4px;
    left: 1px;
    transform: rotate(-45deg);
  }
  .subject:checked + .cb1 {
    border-color: #5cbca2;
  }
  .subject:checked + .cb1::after {
    height: 10px;
    animation: bottomcheck 0.2s ease 0s forwards;
  }
  .subject:checked + .cb1::before {
    height: 24px;
    animation: topcheck 0.4s ease 0s forwards;
  }
  input {
    display: none;
  }
  @keyframes bottomcheck {
    0% {
      height: 0;
    }
    100% {
      height: 10px;
    }
  }
  @keyframes topcheck {
    0% {
      height: 0;
    }
    50% {
      height: 0;
    }
    100% {
      height: 24px;
    }
  }
</style>
<div class="content col-xxl-9" style="margin: auto;">
  <!-- style="margin-left: 16.25rem-->
  <div style="margin-top: 0.9rem;">
    <div class="card body p-3 pt-3">
      <form id="project_register">
        <input type="hidden" name="memberId" value="${loginmember.memberId}" />
        <input type="hidden" id="pdate1" value=""/>
        <input type="hideen" id="pdate2" value=""/>
        <div class="mt-3 mb-7">
          <h3><label class="form-label text-700" for="title">프로젝트명</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span>직관적인 프로젝트명을 사용하시면 클릭률이 올라갑니다.
                        </span>
          </div>
          <input id="title"
                 class="form-control"
                 name="title"
                 placeholder="3-20글자로 적어주세요  예) KB마에스트로"
          />
        </div>
        <div class="mb-7">
          <h3><label class="form-label text-700" for="subject_radio">프로젝트 분야</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span>아래 분야 중에 한가지를 선택해주세요.
                        </span>
          </div>
          <div class="form-group form-check" id="subject_radio">
            <table class="ml-3" style="width:100%;">
              <tr>
                <td style="width:20%;">
                  <input class="form-check-input subject" type="radio" id="O2O" name="subject" value="O2O"/>
                  <label class="form-check-label cb1" for="O2O"></label><span class="ml-2">O2O</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="share_service" type="radio" name="subject" value="공유서비스"/>
                  <label class="form-check-label cb1" for="share_service"></label><span class="ml-2">공유서비스</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="dating_service" type="radio" name="subject" value="데이팅서비스"/>
                  <label class="form-check-label cb1" for="dating_service"></label><span class="ml-2">데이팅서비스</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="travel" type="radio" name="subject" value="여행"/>
                  <label class="form-check-label cb1" for="travel"></label><span class="ml-2">여행</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="social_network" type="radio" name="subject" value="소셜네트워크"/>
                  <label class="form-check-label cb1" for="social_network"></label><span class="ml-2">소셜네트워크</span>
                </td>
              </tr>
              <tr style="height: 0.8rem;"></tr>
              <tr>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="beauty_fashion" type="radio" name="subject" value="뷰티/패션"/>
                  <label class="form-check-label cb1" for="beauty_fashion"></label><span class="ml-2">뷰티/패션</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="ecommerce" type="radio" name="subject" value="이커머스"/>
                  <label class="form-check-label cb1" for="ecommerce"></label><span class="ml-2">이커머스</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="entertainment" type="radio" name="subject" value="엔터테인먼트"/>
                  <label class="form-check-label cb1" for="entertainment"></label><span class="ml-2">엔터테인먼트</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="game" type="radio" name="subject" value="게임"/>
                  <label class="form-check-label cb1" for="game"></label><span class="ml-2">게임</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="health_sports" type="radio" name="subject" value="헬스/스포츠"/>
                  <label class="form-check-label cb1" for="health_sports"></label><span class="ml-2">헬스/스포츠</span>
                </td>
              </tr>
              <tr style="height: 0.8rem;"></tr>
              <tr>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="news_information" type="radio" name="subject" value="뉴스/정보"/>
                  <label class="form-check-label cb1" for="news_information"></label><span class="ml-2">뉴스/정보</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="utility" type="radio" name="subject" value="유틸"/>
                  <label class="form-check-label cb1" for="utility"></label><span class="ml-2">유틸</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="finance" type="radio" name="subject" value="금융"/>
                  <label class="form-check-label cb1" for="finance"></label><span class="ml-2">금융</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="realestate_interior" type="radio" name="subject" value="부동산/인테리어"/>
                  <label class="form-check-label cb1" for="realestate_interior"></label><span class="ml-2">부동산/인테리어</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="religion" type="radio" name="subject" value="종교"/>
                  <label class="form-check-label cb1" for="religion"></label><span class="ml-2">종교</span>
                </td>
              </tr>
              <tr style="height: 0.8rem;"></tr>
              <tr>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="education_hr" type="radio" name="subject" value="교육/HR"/>
                  <label class="form-check-label cb1" for="education_hr"></label><span class="ml-2">교육/HR</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="medi_hospital" type="radio" name="subject" value="의료/병원"/>
                  <label class="form-check-label cb1" for="medi_hospital"></label><span class="ml-2">의료/병원</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="mobility" type="radio" name="subject" value="모빌리티(교통)"/>
                  <label class="form-check-label cb1" for="mobility"></label><span class="ml-2">모빌리티(교통)</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="childcare_delivery" type="radio" name="subject" value="육아/출산"/>
                  <label class="form-check-label cb1" for="childcare_delivery"></label><span class="ml-2">육아/출산</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject" id="universe" type="radio" name="subject" value="우주"/>
                  <label class="form-check-label cb1" for="universe"></label><span class="ml-2">우주</span>
                </td>
              </tr>
            </table>
          </div>
        </div>
        <div class="mt-3 mb-7">
          <h3><label class="form-label text-700" for="kt_dropzonejs_example_1">대표 이미지</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span> 업로드 이미지가 없으면 프로젝트 분야 기본 이미지가 설정됩니다.
                        </span>
          </div>
          <div class="fv-row">
            <div class="dropzone border-dashed border-success" id="kt_dropzonejs_example_1" style="background-color: #e2f4f0">
              <div class="dz-message needsclick p-1" style="align-items: center;">
                <div>
                                    <span class="svg-icon svg-icon-muted" style="text-align:center;">
                                        <svg width="60" height="60" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path opacity="0.3" d="M22 5V19C22 19.6 21.6 20 21 20H19.5L11.9 12.4C11.5 12 10.9 12 10.5 12.4L3
                                            20C2.5 20 2 19.5 2 19V5C2 4.4 2.4 4 3 4H21C21.6 4 22 4.4 22 5ZM7.5 7C6.7 7 6 7.7 6 8.5C6 9.3 6.7
                                            10 7.5 10C8.3 10 9 9.3 9 8.5C9 7.7 8.3 7 7.5 7Z" fill="currentColor"/>
                                            <path d="M19.1 10C18.7 9.60001 18.1 9.60001 17.7 10L10.7 17H2V19C2 19.6 2.4 20 3 20H21C21.6 20
                                            22 19.6 22 19V12.9L19.1 10Z" fill="currentColor"/>
                                        </svg>
                                    </span>
                </div>
                <div>
                                    <span style="font-size: 0.8rem;">· 사진 파일을 끌어 놓으시거나,
                                        <br/>· 업로드를 위해 박스를 클릭하세요.</span>
                </div>
              </div>
            </div>
          </div>
          <div>
                        <span class="text-success"style="font-size: 0.7rem;">
                            <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                    11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                    17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                    7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                </svg>
                            </span>
                        저작권에 위배되지 않는 파일만 업로드해주세요.</span><br/>
            <span class="text-success"style="font-size: 0.7rem;">
                            <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                    11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                    17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                    7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                </svg>
                            </span>
                        가로/세로의 비율이 2:1일 때 썸네일이 가장 예쁩니다.</span>
          </div>
        </div>
        <div class="mb-7">
          <h3><label class="form-label text-700" for="kt_docs_ckeditor_document_toolbar">프로젝트 설명</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span>설명이 풍부한 프로젝트는, 아닌 프로젝트에 비해 지원율이 50% 높습니다.
                        </span>
          </div>
          <div class="rounded-soft border-secondary" id="kt_docs_ckeditor_document_toolbar">

          </div>
          <div class="rounded-soft bg-200 border-0 my-3" id="kt_docs_ckeditor_document" contenteditable="true" style="height: 500px;">
            <h3 style="margin-left: 3%;">1. 프로젝트의 시작 동기</h3>
            <h6 style="margin-left: 5%;">-왜 이 프로덕트를 만들고 싶은지 적어주세요</h6>
            <ul>
              <li>(ex 국내 여행을 가려고 하는데 어떤 곳이 좋은지에 대한 경험이 없어서 어려웠습니다.
                <br/>국내도 해외만큼이나 다양한 지역의 명소가 있는데, 이것이 잘 정리되어있지 않아 잊어버리기 일쑤입니다.
                <br/>전국적인 행사정보와 국내 유명여행지를 모아보여준다면, 사람들이 많이 사용할 것 같습니다.)</li>
            </ul>

            <h6 style="margin-left: 5%;">-만들고자 하는 프로덕트에 대해 알려주세요 </h6>
            <ul>
              <li>(ex 계절별/축제별 국내여행을 모아서 추천해주는 프로덕트를 만들고자합니다.
                <br/>꽃이 피는 시기를 기준으로 , 꽃구경을 갈 수 있는 장소를, 월별로 축제가 있는 지역을 추천합니다.
                <br/>추천시에는 블로그 리뷰 등을 묶어서 해당 부분을 참고할 수 있게 하고 , 이메일이나 앱 푸시등으로 사용자에게 주기적으로 안내합니다.)</li>
            </ul>
            <h3 style="margin-left: 3%;">2. 회의 진행/모임 방식</h3>
            <h6 style="margin-left: 5%;">-만들고자 하는 프로덕트에 대해 알려주세요 </h6>
            <h3 style="margin-left: 3%;">3. 그외 자유기재</h3>
            <h6 style="margin-left: 5%;">-자유로운 방법으로 프로젝트를 어필하세요 </h6>

          </div>
        </div>
        <div class="mb-7">
          <h3><label class="form-label text-700" for="role_apply">모집 인원</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span>각 분야 별 인원을 설정하세요! (추후 변경 가능)
                        </span>
          </div>
          <div id="role_apply">
            <div id="role_1" name="role_1" style="display:flex; margin-bottom: 0.5%;">
              <select id="role_1_name" class="form-control select2"
                      style="width: 50%; margin-right:0.5%;" tabindex="-1" aria-hidden="true">
                <option value="">선택하세요</option>
                <option value="프론트엔드">프론트엔드</option>
                <option value="웹서버">웹서버</option>
                <option value='UX/UI디자인'>UX/UI디자인</option>
                <option value="UX/UI기획">UX/UI기획</option>
                <option value="마케팅">마케팅</option>
              </select>
              <input type='number' min='1' id="role_1_num" class='form-control' style='width: 50%;' value='1'/>
            </div>
          </div>
          <div class="alert alert-info alert-dismissible fade show mb-0 mt-1" role="alert" id="warn_alert">
            이미 <strong>선택한 분야</strong>입니다. 다른 분야를 선택하세요.
            <button class="close" id="warn_close"><span class="font-weight-light" aria-hidden="true">×</span></button>
          </div>
          <div class="alert alert-success alert-dismissible fade show mb-0 mt-1" role="alert" id="min_alert">
            최소한 <strong>한 명</strong> 이상의 구성원을 모집하세요!
            <button class="close" id="min_close"><span class="font-weight-light" aria-hidden="true">×</span></button>
          </div>
          <div class="alert alert-warning alert-dismissible fade show mb-0 mt-1" role="alert" id="max_alert">
            최대 <strong>5개 분야</strong> 까지 설정 가능합니다.
            <button class="close" id="max_close"><span class="font-weight-light" aria-hidden="true">×</span></button>
          </div>
          <div>
                        <span class="text-success"style="font-size: 0.7rem;">
                                <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                        11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                        17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                        7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                    </svg>
                                </span>
                            최대 5개 분야까지 선택 가능합니다.</span>
          </div>
          <div class="mb-3" style="text-align: right;">
            <button class="btn btn-success rounded-capsule mr-1 mb-1 pt-1" id="role_add" type="button">
                            <span class="svg-icon svg-icon-muted">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.5" x="11.364" y="20.364" width="16" height="2" rx="1" transform="rotate(-90 11.364 20.364)" fill="currentColor"/>
                                    <rect x="4.36396" y="11.364" width="16" height="2" rx="1" fill="currentColor"/>
                                </svg>
                            추가</span>
            </button>
            <button class="btn btn-secondary rounded-capsule mr-1 mb-1" id="role_del" type="button">
                            <span class="svg-icon svg-icon-muted    ">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M5 9C5 8.44772 5.44772 8 6 8H18C18.5523 8 19 8.44772 19 9V18C19 19.6569 17.6569 21 16 21H8C6.34315 21 5 19.6569 5 18V9Z" fill="currentColor"/>
                                    <path opacity="0.5" d="M5 5C5 4.44772 5.44772 4 6 4H18C18.5523 4 19 4.44772 19 5V5C19 5.55228 18.5523 6 18 6H6C5.44772 6 5 5.55228 5 5V5Z" fill="currentColor"/>
                                    <path opacity="0.5" d="M9 4C9 3.44772 9.44772 3 10 3H14C14.5523 3 15 3.44772 15 4V4H9V4Z" fill="currentColor"/>
                                </svg>
                            삭제</span>
            </button>
          </div>
        </div>
        <div class="mb-7">
          <h3><label class="form-label text-700" for="drop-remove">프로젝트 기간</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span>아래의 버튼을 드래그하여 프로젝트 시작날짜와 종료날짜를 알려주세요.
                        </span>
          </div>
          <div class="mb-1" style="display: flex;">
            <div id='external-events' style="width: 18%;">
              <div id='external-events-list' style="display: flex; justify-content: center;">
                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event mr-1'>
                  <div class='fc-event-main' id="start">Start</div>
                </div>
                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-even'>
                  <div class='fc-event-main' id="end">End</div>
                </div>
              </div>
              <p>
                <input type='checkbox hidden' id='drop-remove' checked/>
              </p>
            </div>
          </div>
          <div class="mb-1" style="display: flex; justify-content: center;">
            <div id='calendar-wrap' style="width: 95%;">
              <div id='calendar'></div>
            </div>
          </div>

        </div>
        <div class="mt-3 mb-7">
          <h3><label class="form-label text-700" for="post_skilltag">기술·언어</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span> 프로젝트에 적용된/적용하고자 하는 기술/디자인 플랫폼을 적어주세요.
                        </span>
          </div>
          <div class="form-group form-check" id="post_skilltag">
            <table class="ml-3" style="width:100%;">
              <tr>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" type="checkbox" id="js" name="post_skilltag" value="1"/>
                  <label class="form-check-label cb1" for="js"></label><span class="ml-2">JavaScript</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="java" type="checkbox" name="post_skilltag" value="2"/>
                  <label class="form-check-label cb1" for="java"></label><span class="ml-2">Java</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="python" type="checkbox" name="post_skilltag" value="3"/>
                  <label class="form-check-label cb1" for="python"></label><span class="ml-2">Python</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="react" type="checkbox" name="post_skilltag" value="4"/>
                  <label class="form-check-label cb1" for="react"></label><span class="ml-2">React</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="vue" type="checkbox" name="post_skilltag" value="5"/>
                  <label class="form-check-label cb1" for="vue"></label><span class="ml-2">Vue</span>
                </td>
              </tr>
              <tr style="height: 0.8rem;"></tr>
              <tr>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="c++" type="checkbox" name="post_skilltag" value="6"/>
                  <label class="form-check-label cb1" for="c++"></label><span class="ml-2">C++</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="cobol" type="checkbox" name="post_skilltag" value="7"/>
                  <label class="form-check-label cb1" for="cobol"></label><span class="ml-2">Cobol</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="spring" type="checkbox" name="post_skilltag" value="8"/>
                  <label class="form-check-label cb1" for="spring"></label><span class="ml-2">Spring</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="sql" type="checkbox" name="post_skilltag" value="9"/>
                  <label class="form-check-label cb1" for="sql"></label><span class="ml-2">SQL</span>
                </td>
                <td style="width:20%;">
                  <input class="form-check-input subject skilltag" id="kotlin" type="checkbox" name="post_skilltag" value="10"/>
                  <label class="form-check-label cb1" for="kotlin"></label><span class="ml-2">Kotlin</span>
                </td>
              </tr>
            </table>
          </div>
          <div id="selected-items"></div>

          <div>
                        <span class="text-success"style="font-size: 0.7rem;">
                                <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                        11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                        17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                        7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                    </svg>
                                </span>
                            최대 10개까지 등록 가능합니다.</span>
          </div>
        </div>
        <div class="mt-3 mb-7">
          <h3><label class="form-label text-700" for="ref_link">참고 링크</label></h3>
          <div class="mb-1">
                        <span class="text-muted float-end" style="font-size: 0.8rem;">
                            <span class="svg-icon svg-icon-success svg-icon-2hx">
                                <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <rect opacity="0.3" x="2" y="2" width="20" height="20" rx="10" fill="currentColor"/>
                                    <rect x="11" y="14" width="7" height="2" rx="1" transform="rotate(-90 11 14)" fill="currentColor"/>
                                    <rect x="11" y="17" width="2" height="2" rx="1" transform="rotate(-90 11 17)" fill="currentColor"/>
                                </svg>
                            </span> 프로젝트 GitHub 주소 또는, 프로젝트를 정리하신 자료의 웹주소를 등록해주세요.
                        </span>
          </div>
          <input
                  id="ref_link"
                  class="form-control"
                  name="ref_link"
                  placeholder="https://github.com/KBMaestro.git"
          />

          <div>
                        <span class="text-success"style="font-size: 0.7rem;">
                                <span class="svg-icon svg-icon-danger svg-icon-2hx">
                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M9.89557 13.4982L7.79487 11.2651C7.26967 10.7068 6.38251 10.7068 5.85731 11.2651C5.37559
                                        11.7772 5.37559 12.5757 5.85731 13.0878L9.74989 17.2257C10.1448 17.6455 10.8118 17.6455 11.2066
                                        17.2257L18.1427 9.85252C18.6244 9.34044 18.6244 8.54191 18.1427 8.02984C17.6175 7.47154 16.7303
                                        7.47154 16.2051 8.02984L11.061 13.4982C10.7451 13.834 10.2115 13.834 9.89557 13.4982Z" fill="currentColor"/>
                                    </svg>
                                </span>
                            GitHub 주소를 공유하시면, 팀 프로젝트 진행이 원활합니다.</span>
          </div>
        </div>
        <div class="mb-3" style="text-align: center;">
          <a href="javascript:void(0)" id="post_register_btn" class="btn btn-lg btn-success rounded-capsule mr-1 mb-1">작성완료</a>
        </div>
      </form>
    </div>
  </div>

</div>