<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <!-- linking favicons  -->

    <!-- linking stylesheets  -->
    <link rel="stylesheet" href="/assets/stylesheets/main.css" />
    <link rel="stylesheet" href="/assets/stylesheets/filter-popup.css" />
    <link rel="stylesheet" href="/assets/stylesheets/filter-popup-new.css" />
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
    //문서가 준비되면 제일 먼저 실행
    $(document).ready(function(){
        $('#iamportPayment').click(function(){
            payment(); //버튼 클릭하면 호출
        });

// '포인트 사용' 토글 상태 변경 시 실행되는 함수
        function handleToggleChange() {
            var toggleCheckbox = document.getElementById("toggle-3");
            var totalPayment = 4000; // 기본 총 결제금액

            console.log(toggleCheckbox)
            if (toggleCheckbox.checked) {
                // 토글이 켜진 경우
                totalPayment = totalPayment - ${loginmember.point}
                var formattedTotalPayment = totalPayment.toLocaleString();
            }

            console.log(totalPayment);

            // 총 결제금액을 업데이트
            var totalPaymentElement = document.querySelector(".filter-footer h3");
            totalPaymentElement.textContent = "총 결제금액 : " + formattedTotalPayment + "원";
            $('#pointh3').text("포인트 : 0원")
        }

        // '포인트 사용' 토글 변경 이벤트 리스너 등록
        var toggleCheckbox = document.getElementById("toggle-3");
        toggleCheckbox.addEventListener("change", handleToggleChange);

    })



    //버튼 클릭하면 실행
    function payment(data) {
        IMP.init("imp23257778");//아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
        IMP.request_pay({// param
            pg : "kcp",
            pay_method : "card",
            merchant_uid: "order_no_" + Math.floor(Math.random() * 1000000000),
            name: "도서", //결제창에 노출될 상품명
            amount: $('.filter-footer h3').text(), //금액
            buyer_email : "testiamport@naver.com",
            buyer_name : "홍길동",
            buyer_tel : "01012341234"
        }, function (rsp) { // callback
            if (rsp.success) {
                Swal.fire({
                    title : "결제 성공",
                    text : '선택하신 스터디룸 예약이 완료되었어요!',
                    backdrop: false, // 팝업 주변의 투명한 배경 비활성화
                    showConfirmButton: true, // 확인 버튼 표시
                    confirmButtonText: "홈으로 가기", // 확인 버튼 텍스트 설정
                }).then((result) => {
                    if (result.isConfirmed) {
                        // 확인 버튼이 클릭되면 이동할 URL을 설정하고 이동합니다.
                        window.location.href = "/";
                    }
                });

            } else {
                alert("실패 : 코드("+rsp.error_code+") / 메세지(" + rsp.error_msg + ")");
            }
        });
    }
</script>
<!-- general container item  -->
<div class="container">
    <!-- main part of the page  -->
    <div>
        <!-- grid container for all listings  -->

        <main class="grid-container" style="margin-top: 10%;">

            <!-- individual listings  -->
            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study1.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 종로구</h5>
                            <div class="rating">

                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.99</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">사직로 161</p>
                            <p style="font-size: 15px;">1시간당 4,000원</p>
                        </div>
                    </div></a
                >
            </div>
            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study2.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 마포구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.76</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">와우산로 160-4</p>
                            <p style="font-size: 15px;">1시간 3,000원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study3.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 중구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.05</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">을지로 281</p>
                            <p style="font-size: 15px;">1시간 5,000원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study4.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 종로구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.22</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">자하문로 9길 28</p>
                            <p style="font-size: 15px;">1시간 5,000원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study5.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 용산구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.35</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">남산공원길 105</p>
                            <p style="font-size: 15px;">1시간 8,000원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study6.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 송파구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.99</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">올림픽로 300</p>
                            <p style="font-size: 15px;">1시간 3,500원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study7.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 용산구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.40</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">이태원로 177</p>
                            <p style="font-size: 15px;">1시간 5,000원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study8.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 종로구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.30</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">삼청로 137</p>
                            <p style="font-size: 15px;">1시간 2,000원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study9.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 강남구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.19</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">봉은사로 531</p>
                            <p style="font-size: 15px;">1시간 4,500원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study10.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 중구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.10</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">소월로 4길</p>
                            <p style="font-size: 15px;">1시간 3,000원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study11.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 강남구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.70</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">도산대로 562</p>
                            <p style="font-size: 15px;">1시간 2,500원</p>
                        </div>
                    </div></a
                >
            </div>

            <div class="listing">
                <img
                        class="listing-icon"
                        tabindex="0"
                        src="/assets/icons/heart2.png"
                        alt="heart-icon"
                />
                <a href="#filter-popup">
                    <div class="picture-container">
                        <img
                                class="picture"
                                src="/assets/images/study12.jpeg"
                                alt="listing-photo"
                        />
                    </div>
                    <div class="listing-text">
                        <div class="listing-summary">
                            <h5 class="location" style="font-size: 15px;">서울 종로구</h5>
                            <div class="rating">
                                <img
                                        class="star-icon"
                                        src="/assets/icons/star.svg"
                                        alt="star-icon"
                                /><span style="font-size: 15px;">4.12</span>
                            </div>
                        </div>
                        <div class="listing-details">
                            <p style="font-size: 15px;">계동길</p>
                            <p style="font-size: 15px;">1시간 5,000원</p>
                        </div>
                    </div></a
                >
            </div>
        </main>
    </div>
</div>
<!-- filter main body  -->
<div>
    <div class="filter-popup" id="filter-popup" style="margin-top: 40px">
        <div class="filter-menu">
            <form>
                <div class="filter-heading" >
                    <h4 style="font-weight: bold">결제 상세 내용</h4>
                    <a href="#" tabindex="0">
                        <img
                                class="icon"
                                src="/assets/icons/close.svg"
                                alt="cross icon"
                        /></a>
                </div>

                <!-- price range selection  -->

                <div class="price">
                    <h3 style="font-size: 20px">결제금액</h3>
                    <p style="font-size: 20px">1시간 : 4,000원</p>
                </div>

                <!-- place type selection  -->

                <div class="place-type">
                    <h3 style="font-size: 20px">필요 장비</h3>
                    <div class="place-grid">
                        <div class="place-type-option">
                            <div class="place-text">
                                <p style="font-size: 20px">칠판</p>
                            </div>
                            <div class="checkbox-container">
                                <input
                                        class="checkbox"
                                        type="checkbox"
                                        id="entire"
                                        name="entire"
                                />
                            </div>
                        </div>

                        <div class="place-type-option">
                            <div class="place-text">
                                <p style="font-size: 20px">빔프로젝터 & TV</p>
                            </div>
                            <div class="checkbox-container">
                                <input
                                        class="checkbox"
                                        type="checkbox"
                                        id="private"
                                        name="private"
                                />
                            </div>
                        </div>
                    </div>
                </div>
                <!-- booking options  -->

                <div class="booking-options">
                    <h3 style="font-size: 20px">Booking options</h3>
                    <div class="switch">
                        <div class="switch-text">
                            <p style="font-size: 20px">즉시 예약</p>
                        </div>
                        <div class="toggle-div">
                            <input
                                    class="toggle"
                                    type="checkbox"
                                    id="toggle-1"
                                    name="toggle"
                            />
                            <label
                                    class="toggle-switch"
                                    for="toggle-1"
                            ></label>
                        </div>
                    </div>

                </div>
                <div class="booking-options">
                    <h3 style="font-size: 20px" id="pointh3">포인트 : <c:choose>
                        <c:when test="${loginmember != null}"><fmt:formatNumber value="${loginmember.point}" pattern="#,###"/>원</c:when>
                        <c:otherwise>0원</c:otherwise>
                    </c:choose></h3>
                    <div class="switch">
                        <div class="switch-text">
                            <p style="font-size: 20px">사용</p>
                        </div>
                        <div class="toggle-div">
                            <input
                                    class="toggle"
                                    type="checkbox"
                                    id="toggle-3"
                                    name="toggle"
                            />
                            <label
                                    class="toggle-switch"
                                    for="toggle-3"
                            ></label>
                        </div>
                    </div>
                </div>
                <!-- filter footer  -->

                <div class="filter-footer" id="filter-footer">
                    <div>
                        <h3 style="font-size: 30px">총 결제금액 : 4,000원</h3>
                        <button type="button" class="btn btn-primary btn-lg" id="iamportPayment">결제하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
