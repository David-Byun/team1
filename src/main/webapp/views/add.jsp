<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@300&family=Nanum+Gothic&family=Noto+Sans+KR:wght@300&display=swap"
      rel="stylesheet">
<link href="/assets/plugins/custom/fullcalendar/fullcalendar.bundle.css" rel="stylesheet" type="text/css" />
<!--CKEditor Build Bundles:: Only include the relevant bundles accordingly-->
<script src="/assets/plugins/custom/ckeditor/ckeditor-document.bundle.js"></script>
<!--Dropzone js-->
<script src="/assets/plugins/global/plugins.bundle.js"></script>
<!--FullCalendar-->
<script src="/assets/plugins/custom/fullcalendar/index.global.js"></script>

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
<script>
    document.addEventListener('DOMContentLoaded', function() {

        let containerEl = document.getElementById('external-events-list');
        new FullCalendar.Draggable(containerEl, {
            itemSelector: '.fc-event',
            eventData: function(eventEl) {
                return {
                    title: eventEl.innerText.trim(),
                    backgroundColor: '#54e7a9',
                    borderColor:'#54e7a9'
                }
            }
        });

        let calendarEl = document.getElementById('calendar');
        let calendar = new FullCalendar.Calendar(calendarEl, {
            headerToolbar: {
                left: 'prev today',
                center: 'title',
                right: 'next'
            },
            editable: true,
            droppable: true,
            drop: function(arg) {
                if (document.getElementById('drop-remove').checked) {
                    arg.draggedEl.parentNode.removeChild(arg.draggedEl);
                }
            },
            eventReceive: function (info) {
                let pd = info.event.startStr.trim();
                let parts = pd.split('-');
                let complete = parts[0]+'.'+parts[1]+'.'+parts[2];
                if (info.event.title === 'Start') {
                    document.getElementById('pdate1').value = complete;
                    console.log(complete);
                } else if (info.event.title === 'End') {
                    document.getElementById('pdate2').value = complete;
                    console.log(complete);
                }
            },
            eventDrop: function(info) {
                let movedPd = info.event.startStr.trim();
                let movedParts = movedPd.split('-');
                let movedComplete = movedParts[0]+'.'+movedParts[1]+'.'+movedParts[2];
                if (info.event.title === 'Start') {
                    document.getElementById('pdate1').value = movedComplete;
                    console.log(movedComplete);
                } else if (info.event.title === 'End') {
                    document.getElementById('pdate2').value = movedComplete;
                    console.log(movedComplete);
                }
            }
        });
        calendar.render();
    });
</script>
<script>
    var dropImg;

    function dataURLtoFile(dataurl, filename) {
        var arr = dataurl.split(','),
            mime = arr[0].match(/:(.*?);/)[1],
            bstr = atob(arr[1]),
            n = bstr.length,
            u8arr = new Uint8Array(n);
        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new File([u8arr], filename, {type: mime});
    }

    $(document).ready(function(){
       $('#post_register_btn').click(function(){
           let formModal = $('#form_modal');
           let svg = '<span class="svg-icon svg-icon-muted svg-icon-2hx"><svg width="20" height="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">'+
                    '<path d="M19.4 13.9411L10.7 5.24112C10.4 4.94112 10 4.84104 9.60001 5.04104C9.20001 5.24104 9 5.54107 9 5.94107V18.2411C9 18.6411 9.20001 18.941 9.60001 19.141C9.70001 19.241 9.9 19.2411 10 19.2411C10.2 19.2411 10.4 19.141 10.6 19.041C11.4 18.441 12.1 17.941 12.9 17.541L14.4 21.041C14.6 21.641 15.2 21.9411 15.8 21.9411C16 21.9411 16.2 21.9411 16.4 21.8411C17.2 21.5411 17.5 20.6411 17.2 19.8411L15.7 16.2411C16.7 15.9411 17.7 15.741 18.8 15.541C19.2 15.541 19.5 15.2411 19.6 14.8411C19.8 14.6411 19.7 14.2411 19.4 13.9411Z" fill="currentColor"/>'+
                    '<path opacity="0.3" d="M15 6.941C14.8 6.941 14.7 6.94102 14.6 6.84102C14.1 6.64102 13.9 6.04097 14.2 5.54097L15.2 3.54097C15.4 3.04097 16 2.84095 16.5 3.14095C17 3.34095 17.2 3.941 16.9 4.441L15.9 6.441C15.7 6.741 15.4 6.941 15 6.941ZM18.4 9.84102L20.4 8.84102C20.9 8.64102 21.1 8.04097 20.8 7.54097C20.6 7.04097 20 6.84095 19.5 7.14095L17.5 8.14095C17 8.34095 16.8 8.941 17.1 9.441C17.3 9.841 17.6 10.041 18 10.041C18.2 9.94097 18.3 9.94102 18.4 9.84102ZM7.10001 10.941C7.10001 10.341 6.70001 9.941 6.10001 9.941H4C3.4 9.941 3 10.341 3 10.941C3 11.541 3.4 11.941 4 11.941H6.10001C6.70001 11.941 7.10001 11.541 7.10001 10.941ZM4.89999 17.1409L6.89999 16.1409C7.39999 15.9409 7.59999 15.341 7.29999 14.841C7.09999 14.341 6.5 14.141 6 14.441L4 15.441C3.5 15.641 3.30001 16.241 3.60001 16.741C3.80001 17.141 4.1 17.341 4.5 17.341C4.6 17.241 4.79999 17.2409 4.89999 17.1409Z" fill="currentColor"/>'+
                    '</svg>'+
                    '</span> ';
           let content = document.getElementById('kt_docs_ckeditor_document').innerHTML;
           let blank = '<h3 style="margin-left:3%;">1. 프로젝트의 시작 동기</h3><p style="margin-left:5%;">' +
               '-왜 이 프로덕트를 만들고 싶은지 적어주세요</p><ul><li>(ex 국내 여행을 가려고 하는데 어떤 곳이 좋은지에 대한 경험이 없어서 어려웠습니다.' +
               '&nbsp;<br>국내도 해외만큼이나 다양한 지역의 명소가 있는데, 이것이 잘 정리되어있지 않아 잊어버리기 일쑤입니다.&nbsp;<br>전국적인 행사정보와 ' +
               '국내 유명여행지를 모아보여준다면, 사람들이 많이 사용할 것 같습니다.)</li></ul><p style="margin-left:5%;">-만들고자 하는 프로덕트에 대해 알려주세요' +
               '</p><ul><li>(ex 계절별/축제별 국내여행을 모아서 추천해주는 프로덕트를 만들고자합니다.&nbsp;<br>꽃이 피는 시기를 기준으로 , 꽃구경을 갈 수 있는 장소를, ' +
               '월별로 축제가 있는 지역을 추천합니다.&nbsp;<br>추천시에는 블로그 리뷰 등을 묶어서 해당 부분을 참고할 수 있게 하고 , 이메일이나 앱 푸시등으로 사용자에게 ' +
               '주기적으로 안내합니다.)</li></ul><h3 style="margin-left:3%;">2. 회의 진행/모임 방식</h3><p style="margin-left:5%;">-만들고자 하는 프로덕트에 대해 ' +
               '알려주세요</p><h3 style="margin-left:3%;">3. 그외 자유기재</h3><p style="margin-left:5%;">-자유로운 방법으로 프로젝트를 어필하세요</p>';

           if((content===blank)||(content==='')){
               $('#form_msg').html(svg+'프로젝트 설명을 작성하세요.');
               formModal.modal('show');
               $('#kt_docs_ckeditor_document').focus();
               return;
           }

           if (!dropImg) {
               $('#form_msg').html(svg+' 이미지를 업로드하세요.');
               formModal.modal('show');
               return;
           }

           let title = $('#title').val();
           let ref_link = $('#ref_link').val();
           let pdate1 = $('#pdate1').val();
           let pdate2 = $('#pdate2').val();

           if (title == '') {
               $('#form_msg').html(svg+' 프로젝트명을 작성하세요.');
               formModal.modal('show');
               $('#title').focus();
               return;
           };

           if (ref_link == '') {
               $('#form_msg').html(svg+' 참고 링크를 작성하세요.');
               formModal.modal('show');
               $('#ref_link').focus();
               return;
           };

           if (pdate1 == '') {
               $('#form_msg').html(svg+' 프로젝트 시작 날짜를 정하세요.');
               formModal.modal('show');
               return;
           };

           if (pdate2 == '') {
               $('#form_msg').html(svg+' 프로젝트 종료 날짜를 정하세요!');
               formModal.modal('show');
               return;
           };

           if (!$('input[type="checkbox"]').is(':checked')) {
               $('#form_msg').html(svg+' 프로젝트에 적용할 기술·언어를 선택하세요.');
               formModal.modal('show');
               return;
           };

           if (!$('input[type="radio"]').is(':checked')) {
               $('#form_msg').html(svg+' 프로젝트 분야를 선택하세요.');
               formModal.modal('show');
               return;
           };

           var formData = new FormData($('#project_register')[0]);
           formData.append('content', content);
           formData.append('imgFile', dropImg);

           let project_date = pdate1 + ' ~ ' +pdate2;
           formData.append('pdate', project_date);

           let skillArray = [];

           $('input[name="post_skilltag"]:checked').each(function() {
               skillArray.push($(this).val());
           });

           formData.append('hashtag', skillArray);

           let lastId = $("#role_apply div:last").attr('id');
           let lastNo = parseInt(lastId.substring(5));

           for (let i = 1; i <= lastNo; i++) {
               let role_name = 'role_' + i + '_name';
               let role_num = 'role_' + i + '_num';
               let roleName = $('#'+role_name).val();
               let roleNum = $('#'+role_num).val();
               if(roleName==""){
                   $('#form_msg').html(svg+' 모집 분야를 선택하세요.');
                   formModal.modal('show');
                   $('#'+role_name).focus();
                   return;
               }
               let inputName = (roleName === '프론트엔드') ? 'front' :
                   (roleName === '웹서버') ? 'server' :
                       (roleName === '마케팅') ? 'marketing' :
                           (roleName === 'UX/UI기획') ? 'plan' : 'design';

               formData.append(inputName, roleNum);
           }

           formData.forEach(function (value, key) {
               console.log('Input:', key, value);
           });

           $.ajax({
               url        : '/postaddimpl',
               method     : 'POST',
               data       : formData,
               processData: false,
               contentType: false,
               success    : function (response) {
                   window.location.href = '/post/'+response;
               },
               error      : function (error) {
                   console.error(error);
               }
           });
       });
    });
</script>

<div class="content" style="margin-left: 16.25rem;">
    <div class="row mx-n2 d-flex justify-content-center">
        <div class="position-relative" style="margin-top: 0.9rem;">
            <div class="card text-white bg-success">
                <div class="card-body">
                    <div class="card-title" style="padding: 3% 2% 0% 2%;">
                        <p class="text-white text-900" style="font-size: 1.5rem; font-weight: bolder;">프로젝트 생성
                            <br/><span style="font-size: 0.9rem; font-weight: revert;">만들고 싶은 프로젝트가 있다면 KB Maestro와 같이 하나씩 정리해봐요!</span>
                        </p>
                    </div>
                </div>
            </div>
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
</div>
<!--subject Modal-->
<div class="modal fade modal_body" tabindex="-1"id="subject_modal">
    <div class="modal-dialog border-0">
        <div class="modal-content border-0" style="padding: 5.5% 3% 3% 3%; text-align: start; background-color: #e2f4f0;">
            <div class="modal-body" style="display: flex; justify-content: space-between">
                <div class="text-start" style="width: 90%;">
                    <p id="subject_modal_text" style="font-weight:700; padding-left: 10%;"></p>
                </div>
                <div class="text-end" style="width: 10%;">
                    <img src="/assets/img/icons/close.png" style="width: 25%" data-bs-dismiss="modal" aria-label="Close">
                </div>
            </div>
        </div>
    </div>
</div>

<!--Form Modal-->
<div class="modal fade" tabindex="-1" id="form_modal">
    <div class="modal-dialog">
        <div class="modal-content" style="padding: 5.5% 3% 3% 3%; text-align: start; background-color: #e2f4f0;">
            <div class="modal-body" style="display: flex; justify-content: space-between">
                <div class="text-start" style="width: 90%;">
                    <p id="form_msg" style="font-weight:700; padding-left: 10%;"></p>
                </div>
                <div class="text-end" style="width: 10%;">
                    <img src="/assets/img/icons/close.png" style="width: 25%" data-bs-dismiss="modal" aria-label="Close">
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    DecoupledEditor
        .create(document.querySelector('#kt_docs_ckeditor_document'))
        .then(editor => {
            const toolbarContainer = document.querySelector('#kt_docs_ckeditor_document_toolbar');

            toolbarContainer.appendChild(editor.ui.view.toolbar.element);
        })
        .catch(error => {
            console.error(error);
        })
</script>
<script>
    const myDropzone = new Dropzone("#kt_dropzonejs_example_1", {
        url           : "post/addimpl",
        paramName     : "file",
        maxFiles      : 1,
        maxFilesize   : 10, // MB
        addRemoveLinks: true,
        accept        : function (file, done) {
            if (file) {
                dropImg = file;
            } else {
                done();
            }
        }
    });
</script>
<script>
    let selectedSkills = [];
    let checkboxes = document.querySelectorAll('.skilltag');


    checkboxes.forEach((checkbox) => {
        checkbox.addEventListener('change', function () {
            let skillValue = this.value;
            let isSelected = this.checked;

            if (isSelected) {
                selectedSkills.push(skillValue);
            } else {
                let index = selectedSkills.indexOf(skillValue);
                if (index !== -1) {
                    selectedSkills.splice(index, 1);
                }
            }
            showSelectedSkills(selectedSkills);
        });
    });


    function showSelectedSkills(selectedSkills) {
        let selectedSkillsDiv = document.getElementById('selected-items');
        selectedSkillsDiv.innerHTML = '';

        selectedSkills.forEach((skillValue) => {
            let skillDiv = document.createElement('div');
            skillDiv.className = 'symbol symbol-50px m-1';
            let skillImage = document.createElement('img');
            skillImage.src = "/assets/img/tag/"+skillValue+".png;"
            skillDiv.appendChild(skillImage);

            selectedSkillsDiv.appendChild(skillDiv);
        });
    }

    $(document).ready(function () {
        $('.alert').hide();
        $('#min_close').click(function(e){
            e.preventDefault();
            $('#min_alert').hide();
        });
        $('#max_close').click(function(e){
            e.preventDefault();
            $('#max_alert').hide();
        });
        $('#warn_close').click(function(e){
            e.preventDefault();
            $('#warn_alert').hide();
        });
        $('#role_add').click(function () {
            let recentId = $("#role_apply div:last").attr('id');
            let recentNo = parseInt(recentId.substring(5)) + 1;
            if(recentNo>=6){
                $('#max_alert').show();
                return;
            }

            let newDiv = $('<div id="role_' + recentNo + '" name="role_'+recentNo +'"style="display:flex; margin-bottom: 0.5%;">');
            let newSelect = $('<select id="role_'+recentNo+'_name" class="form-control select2" style="width: 50%; margin-right:0.5%;" tabindex="-1" aria-hidden="true">');

            newSelect.append("<option value=''>선택하세요</option>")
            newSelect.append("<option value='프론트엔드'>프론트엔드</option>");
            newSelect.append("<option value='웹서버'>웹서버</option>");
            newSelect.append("<option value='UX/UI디자인'>UX/UI디자인</option>");
            newSelect.append("<option value='UX/UI기획'>UX/UI기획</option>");
            newSelect.append("<option value='마케팅'>마케팅</option>");

            let newInput = $("<input id='role_"+ recentNo+ "_num' type='number' min='1' class='form-control' style='width: 50%;' value='1'/>");

            newDiv.append(newSelect);
            newDiv.append(newInput);

            $("#role_apply").append(newDiv);
        });

        $('#role_del').click(function () {
            let recentId = $("#role_apply div:last").attr('id');
            if(recentId=="role_1"){
                $('#min_alert').show();
                return;
            }
            $("#" + recentId).remove();
        });

        $("input[name='subject']").change(function () {
            let subject_value = $("input[name='subject']:checked").val();
            $('#subject_modal_text').html(
                '<span class="svg-icon svg-icon-muted svg-icon-2hx"><svg width="22" height="22" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">'+
                '<path d="M12.6 7C12 7 11.6 6.6 11.6 6V3C11.6 2.4 12 2 12.6 2C13.2 2 13.6 2.4 13.6 3V6C13.6 6.6 13.2 7 12.6 7ZM10 7.59998C10.5 7.29998 10.6 6.69995 10.4 6.19995L9 3.80005C8.7 3.30005 8.10001 3.20002 7.60001 3.40002C7.10001 3.70002 7.00001 4.30005 7.20001 4.80005L8.60001 7.19995C8.80001 7.49995 9.1 7.69995 9.5 7.69995C9.7 7.69995 9.9 7.69998 10 7.59998ZM8 9.30005C8.3 8.80005 8.10001 8.20002 7.60001 7.90002L5.5 6.69995C5 6.39995 4.40001 6.59998 4.10001 7.09998C3.80001 7.59998 4 8.2 4.5 8.5L6.60001 9.69995C6.80001 9.79995 6.90001 9.80005 7.10001 9.80005C7.50001 9.80005 7.9 9.70005 8 9.30005ZM7.20001 12C7.20001 11.4 6.80001 11 6.20001 11H4C3.4 11 3 11.4 3 12C3 12.6 3.4 13 4 13H6.20001C6.70001 13 7.20001 12.6 7.20001 12Z" fill="currentColor"/>'+
                '<path opacity="0.3" d="M17.4 5.5C17.4 6.1 17 6.5 16.4 6.5C15.8 6.5 15.4 6.1 15.4 5.5C15.4 4.9 15.8 4.5 16.4 4.5C17 4.5 17.4 5 17.4 5.5ZM5.80001 17.1L7.40001 16.1C7.90001 15.8 8.00001 15.2 7.80001 14.7C7.50001 14.2 6.90001 14.1 6.40001 14.3L4.80001 15.3C4.30001 15.6 4.20001 16.2 4.40001 16.7C4.60001 17 4.90001 17.2 5.30001 17.2C5.50001 17.3 5.60001 17.2 5.80001 17.1ZM8.40001 20.2C8.20001 20.2 8.10001 20.2 7.90001 20.1C7.40001 19.8 7.3 19.2 7.5 18.7L8.30001 17.3C8.60001 16.8 9.20002 16.7 9.70002 16.9C10.2 17.2 10.3 17.8 10.1 18.3L9.30001 19.7C9.10001 20 8.70001 20.2 8.40001 20.2ZM12.6 21.2C12 21.2 11.6 20.8 11.6 20.2V18.8C11.6 18.2 12 17.8 12.6 17.8C13.2 17.8 13.6 18.2 13.6 18.8V20.2C13.6 20.7 13.2 21.2 12.6 21.2ZM16.7 19.9C16.4 19.9 16 19.7 15.8 19.4L15.2 18.5C14.9 18 15.1 17.4 15.6 17.1C16.1 16.8 16.7 17 17 17.5L17.6 18.4C17.9 18.9 17.7 19.5 17.2 19.8C17 19.9 16.8 19.9 16.7 19.9ZM19.4 17C19.2 17 19.1 17 18.9 16.9L18.2 16.5C17.7 16.2 17.6 15.6 17.8 15.1C18.1 14.6 18.7 14.5 19.2 14.7L19.9 15.1C20.4 15.4 20.5 16 20.3 16.5C20.1 16.8 19.8 17 19.4 17ZM20.4 13H19.9C19.3 13 18.9 12.6 18.9 12C18.9 11.4 19.3 11 19.9 11H20.4C21 11 21.4 11.4 21.4 12C21.4 12.6 20.9 13 20.4 13ZM18.9 9.30005C18.6 9.30005 18.2 9.10005 18 8.80005C17.7 8.30005 17.9 7.70002 18.4 7.40002L18.6 7.30005C19.1 7.00005 19.7 7.19995 20 7.69995C20.3 8.19995 20.1 8.79998 19.6 9.09998L19.4 9.19995C19.3 9.19995 19.1 9.30005 18.9 9.30005Z" fill="currentColor"/>'+
                '</svg>'+
                '</span> '+subject_value + " 기본 이미지로 섬네일이 변경됩니다.");
            $('#subject_modal').modal('show');
        });
    });

    let selectedRoleArray = [];
    $(document).on('change', 'select', function(){
        let selectRole = $(this).val();
        if (selectedRoleArray.includes(selectRole)) {
            let roleIndex = selectedRoleArray.indexOf(selectRole);
            if(roleIndex !== -1){
                selectedRoleArray.splice(roleIndex, 1);
            }
            $(this).val('');
            $('#warn_alert').show();
        } else {
            selectedRoleArray.push(selectRole);
        }
    });
</script>