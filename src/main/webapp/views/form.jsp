<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="content">
    <div class="row mx-n2 d-flex justify-content-center">
        <div class="position-relative ">
            <ul class="nav nav-pills " id="pill-myTab" role="tablist" style="margin-top: 5rem;">
                <li class="nav-item"><a class="nav-link active" id="home-tab" data-toggle="tab" href="#tab-home" role="tab" aria-controls="tab-home" aria-selected="true">모집글 작성</a></li>
            </ul>
            <div class="tab-content border p-3 mt-3" id="pill-myTabContent">
                <div class="tab-pane fade show active" id="tab-home" role="tabpanel" aria-labelledby="home-tab">
                    <form id="study_update">
                        <input name="memberId" type="hidden" value="${loginmember.memberId}"/>
                        <div class="mt-3 mb-5">
                            <h3><label class="form-label text-700" for="basic-default-title">프로젝트명</label></h3>
                            <div class="mb-1">
                                <span class='uil uil-smile-beam'></span>
                                <small class="text-muted float-end">직관적인 프로젝트명을 사용하시면 클릭률이 올라갑니다.</small>
                            </div>
                            <input
                                    id="basic-default-title"
                                    class="form-control"
                                    name="title"
                                    placeholder="프로젝트 상세 내용을 작성해주세요"
                            ></input>
                        </div>
                        <div class="mb-5">
                            <h3><label class="form-label text-700" for="subject_checkbox">프로젝트 분야</label></h3>
                            <div class="mb-1">
                                <span class='uil uil-smile-beam'></span>
                                <small class="text-muted float-end">아래 분야 중에 한가지를 선택해주세요.</small>
                            </div>
                            <div class="form-group form-check" id="subject_checkbox">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="O2O" type="checkbox" name=""/>
                                            <label class="form-check-label" for="O2O">O2O</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="share_service" type="checkbox" name=""/>
                                            <label class="form-check-label" for="share_service">공유서비스</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="dating_service" type="checkbox" name=""/>
                                            <label class="form-check-label" for="dating_service">데이팅서비스</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="travel" type="checkbox" name=""/>
                                            <label class="form-check-label" for="travel">여행</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="social_network" type="checkbox" name=""/>
                                            <label class="form-check-label" for="social_network">소셜네트워크</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="beauty_fashion" type="checkbox" name=""/>
                                            <label class="form-check-label" for="beauty_fashion">뷰티/패션</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="ecommerce" type="checkbox" name=""/>
                                            <label class="form-check-label" for="ecommerce">이커머스</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="entertainment" type="checkbox" name=""/>
                                            <label class="form-check-label" for="entertainment">엔터테인먼트</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="game" type="checkbox" name=""/>
                                            <label class="form-check-label" for="game">게임</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="health_sports" type="checkbox" name=""/>
                                            <label class="form-check-label" for="health_sports">헬스/스포츠</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="news_information" type="checkbox" name=""/>
                                            <label class="form-check-label" for="news_information">뉴스/정보</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="utility" type="checkbox" name=""/>
                                            <label class="form-check-label" for="utility">유틸</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="finance" type="checkbox" name=""/>
                                            <label class="form-check-label" for="finance">금융</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="realestate_interior" type="checkbox" name=""/>
                                            <label class="form-check-label" for="realestate_interior">부동산/인테리어</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="religion" type="checkbox" name=""/>
                                            <label class="form-check-label" for="religion">종교</label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="education_hr" type="checkbox" name=""/>
                                            <label class="form-check-label" for="education_hr">교육/HR</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="medi_hospital" type="checkbox" name=""/>
                                            <label class="form-check-label" for="medi_hospital">의료/병원</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="mobility" type="checkbox" name=""/>
                                            <label class="form-check-label" for="mobility">모빌리티(교통)</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="childcare_delivery" type="checkbox" name=""/>
                                            <label class="form-check-label" for="childcare_delivery">육아/출산</label>
                                        </td>
                                        <td style="width:20%;">
                                            <input class="form-check-input" id="universe" type="checkbox" name=""/>
                                            <label class="form-check-label" for="universe">우주</label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="mb-5">
                            <h3><label class="form-label text-700" for="kt_docs_ckeditor_document_toolbar">프로젝트 설명</label></h3>
                            <div class="mb-1">
                                <span class='uil uil-smile-beam'></span>
                                <small class="text-muted float-end">설명이 풍부한 프로젝트는, 아닌 프로젝트에 비해 지원율이 50% 높습니다.</small>
                            </div>
                            <div class="rounded-soft border-secondary" id="kt_docs_ckeditor_document_toolbar">

                            </div>
                            <div class="rounded-soft bg-200 border-0 my-3" id="kt_docs_ckeditor_document" contenteditable="true">
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
                        <div class="mb-5">
                            <h3><label class="form-label text-700" for="role_apply">모집 인원</label></h3>
                            <div class="mb-1">
                                <span class='uil uil-smile-beam'></span>
                                <small class="text-muted float-end">각 분야 별 인원을 설정하세요! (추후 변경 가능)</small>
                            </div>
                            <div id="role_apply">
                                <div id="role_1" style="display:flex; margin-bottom: 0.5%;">
                                    <select class="form-control select2"
                                            style="width: 50%; margin-right:0.5%;" tabindex="-1" aria-hidden="true">
                                        <option value="">선택하세요</option>
                                        <option value="프론트엔드">프론트엔드</option>
                                        <option value="백엔드">백엔드</option>
                                        <option value="웹서버">웹서버</option>
                                        <option value='UX/UI디자인'>UX/UI디자인</option>
                                        <option value="기획">기획</option>
                                        <option value="마케팅">마케팅</option>
                                    </select>
                                    <input type='number' class='form-control' style='width: 50%;' value='1'/>
                                </div>
                            </div>
                            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                                최소한 <strong>한 명</strong> 이상의 구성원을 모집하세요!
                                <button class="close" id="modal_close"><span class="font-weight-light" aria-hidden="true">×</span></button>
                            </div>
                            <div class="mb-3" style="text-align: right;">
                                <button class="btn btn-warning rounded-capsule mr-1 mb-1 pt-1" id="role_add" type="button">
                                    <span class="uil uil-plus" data-fa-transform="shrink-3"></span>추가
                                </button>
                                <button class="btn btn-secondary rounded-capsule mr-1 mb-1 pt-1" id="role_del" type="button">
                                    <span class="uil uil-trash-alt" data-fa-transform="shrink-3"></span>삭제
                                </button>
                            </div>
                        </div>
                        <div class="mb-5">
                            <h3><label class="form-label text-700" for="imgname">이미지</label></h3>
                            <c:choose>
                                <c:when test="${post.img == null || post.img == ''}">
                                    <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none"
                                           id="imgname">
                                    <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                        <img src="/assets/img/group/pic-1.png" width="100px"
                                             alt="Generic placeholder image" class="img-fluid img-thumbnail mb-3"
                                             style="width: 100%; z-index: 1; height:30%" id="preview">
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <input class="d-none mt-5 ml-5" type="file" name="imgName" style="display: none"
                                           id="imgname">
                                    <a href="javascript:void(0);" onclick="$('#imgname').trigger('click')">
                                        <img src="/uimg/${post.img}" id="preview"
                                             alt="Generic placeholder image" class="img-fluid img-thumbnail mb-3"
                                             style="width: 100%; z-index: 1; height:20%">
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="d-flex float-end">
                            <a href="javascript:void(0)" id="study_register_btn" class="btn btn-primary">등록</a>
                        </div>
                    </form>
                </div>
            </div>
<%--            <div class="card-body">--%>

<%--            </div>--%>
        </div>
    </div>
</div>

<!--CKEditor Build Bundles:: Only include the relevant bundles accordingly-->
<script src="/assets/plugins/custom/ckeditor/ckeditor-document.bundle.js"></script>

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
        url           : "study/addimpl",
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
    $(function () {
        $('.alert').hide();
        $('#modal_close').click(function(e){
            e.preventDefault();
            $('.alert').hide();
        });
        $('#role_add').click(function (e) {
            e.preventDefault();
            alert('추가할거임');
            let recentId = $("#role_apply div:last").attr('id');


            alert(recentId);
            let recentNo = parseInt(recentId.substring(5)) + 1;
            alert(recentNo);

            // 새로운 add Div 생성
            let newDiv = $('<div id="role_' + recentNo + '"style="display:flex; margin-bottom: 0.5%;">');
            // 새로운 select 요소 생성
            let newSelect = $('<select class="form-control select2" style="width: 50%; margin-right:0.5%;" tabindex="-1" aria-hidden="true">');

            // select 요소에 옵션 추가
            newSelect.append("<option value=''>선택하세요</option>")
            newSelect.append("<option value='프론트엔드'>프론트엔드</option>");
            newSelect.append("<option value='백엔드'>백엔드</option>");
            newSelect.append("<option value='웹서버'>웹서버</option>");
            newSelect.append("<option value='UX/UI디자인'>UX/UI디자인</option>");
            newSelect.append("<option value='기획'>기획</option>");
            newSelect.append("<option value='마케팅'>마케팅</option>");

            // 새로운 input 생성
            let newInput = $("<input type='number' class='form-control' style='width: 50%;' value='1'/>");

            newDiv.append(newSelect);
            newDiv.append(newInput);

            // 생성한 select 요소를 컨테이너에 추가
            $("#role_apply").append(newDiv);
        });

        $('#role_del').click(function (e) {
            e.preventDefault();
            let recentId = $("#role_apply div:last").attr('id');
            if(recentId=="role_1"){
                $('.alert').show();
                // alert('최소한 한 명 이상의 구성원을 모집하세요!');
                return;
            }
            $("#" + recentId).remove();
        });
        $('#imgname').on("change", e => {
            readImage(e.target)
        })
    });
</script>