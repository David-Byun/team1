<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="content">
    <div class="row mx-n2 d-flex justify-content-center">
        <div class="position-relative ">
            <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">프로젝트 모집</span> 프로젝트 모집</h4>

            <!-- Basic Layout -->

            <div class="card-header">
                <h5 class="mb-0">모집글 작성</h5>
                <small class="text-muted float-end">Default label</small>
            </div>
            <div class="card-body">
                <form id="study_update">
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
                    <input name="memberId" type="hidden" value="${loginmember.memberId}"/>

                    <div class="alert alert-warning alert-dismissible fade show" role="alert">
                        최소한 <strong>한 명</strong> 이상의 구성원을 모집하세요!
                        <button class="close" id="modal_close"><span class="font-weight-light" aria-hidden="true">×</span></button>
                    </div>
                    <div class="mb-3">
                        <button id="role_add" class="btn btn-primary">추가</button>
                        <button id="role_del" class="btn btn-secondary">삭제</button>
                    </div>

                    <div class="mb-3">
                        <label class="form-label" for="basic-default-title">제목</label>
                        <input
                                id="basic-default-title"
                                class="form-control"
                                name="title"
                                placeholder="프로젝트 상세 내용을 작성해주세요"
                        ></input>
                    </div>
                    <div class="mb-3">
                        <label class="form-label" for="basic-default-message">내용</label>
                        <textarea
                                id="basic-default-message"
                                class="form-control"
                                name="content"
                                placeholder="프로젝트 상세 내용을 작성해주세요"
                        ></textarea>
                    </div>
<%--                    <div class="mb-3">--%>
<%--                        <div id="kt_docs_ckeditor_document_toolbar"></div>--%>
<%--                        <div class="border-gray-500 my-3" id="kt_docs_ckeditor_document" contenteditable="true">--%>

<%--                        </div>--%>

<%--                        <div class="d-flex float-end mt-10 pb-10">--%>
<%--                            <a href="javascript:void(0)" id="study_register_btn" class="btn btn-primary">등록</a>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="mb-3">
                        <label class="form-label" for="imgname">이미지</label>
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
                    <button type="submit" class="btn btn-primary">프로젝트 등록</button>
                </form>
            </div>
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