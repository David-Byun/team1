<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<link href="/assets/css/study.css" rel="stylesheet"/>
<style>
    /* 스타일링: 팝업 컨테이너 */
    .popup-container {
        display: none;
        position: fixed;
        top: 29%;
        left: 58%;
        transform: translate(-50%, -50%);
        background: white;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5);
        z-index: 999;
    }

    .Calendar {
        text-align: center;
    }

    .Calendar>thead>tr:first-child>td {
        font-family: 'Questrial', sans-serif;
        font-size: 1.1em;
        font-weight: bold;
    }

    .Calendar>thead>tr:last-child>td {
        font-family: 'Questrial', sans-serif;
        font-weight: 600;
    }

    .Calendar>tbody>tr>td>p {
        font-family: 'Montserrat', sans-serif;
        height: 45px;
        width: 45px;
        border-radius: 45px;
        transition-duration: .2s;
        line-height: 45px;
        margin: 2.5px;
        display: block;
        text-align: center;
    }

    .pastDay {
        color: lightgray;
    }

    .today {
        background-color: #F5D042;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
    }

    .futureDay {
        background-color: #FFFFFF;
        cursor: pointer;
    }
    .futureDay:hover{
        background:#eee;
    }

    .futureDay.choiceDay,
    .today.choiceDay {
        background: #0A174E;
        color: #fff;
        font-weight: 600;
        cursor: pointer;
    }

    select.form-select {
        border: none; /* 테두리 없애기 */
        outline: none; /* 포커스시 테두리 없애기 */
    }
</style>
<script>

    //window.onload = function () { buildCalendar();openPopup(); }    // 웹 페이지가 로드되면 buildCalendar 실행

    $('#link').click(function () {
        buildCalendar();
        openPopup();
    })


    let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화

    function openPopup() {
        document.getElementById("popup").style.display = "block";
    }

    function closePopup() {
        document.getElementById("popup").style.display = "none";
    }

    // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
    function buildCalendar() {

        let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
        let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

        let tbody_Calendar = document.querySelector(".Calendar > tbody");
        document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
        document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신

        while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
            tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
        }

        let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가

        for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
            let nowColumn = nowRow.insertCell();        // 열 추가
        }

        for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복

            let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


            let newDIV = document.createElement("p");
            newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
            nowColumn.appendChild(newDIV);

            if (nowDay.getDay() == 6) {                 // 토요일인 경우
                nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
            }

            if (nowDay < today) {                       // 지난날인 경우
                newDIV.className = "pastDay";
            }
            else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우
                newDIV.className = "today";
                newDIV.onclick = function () { choiceDate(this); }
            }
            else {                                      // 미래인 경우
                newDIV.className = "futureDay";
                newDIV.onclick = function () { choiceDate(this); }
            }
        }
    }

    // 날짜 선택
    function choiceDate(newDIV) {
        if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
            document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
        }
        newDIV.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
        // Set the selected date in the 'id=calendar' input
        document.getElementById("calendar").value = nowMonth.getFullYear() + "-" + leftPad(nowMonth.getMonth() + 1) + "-" + leftPad(newDIV.innerHTML);
        closePopup()
    }

    // 이전달 버튼 클릭
    function prevCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
        buildCalendar();    // 달력 다시 생성
    }
    // 다음달 버튼 클릭
    function nextCalendar() {
        nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
        buildCalendar();    // 달력 다시 생성
    }

    // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
    function leftPad(value) {
        if (value < 10) {
            value = "0" + value;
            return value;
        }
        return value;
    }

</script>
<aside id="aside">

</aside>

<header class="padding80 font_weight600" style="height: 180px">
    <div id="logo">

    </div>
    <div class="search_input_box">
        <div class="search_input rooms_box">
            <div>
                <a href="#">
                    <div>위치</div>
                    <select class="form-select" aria-label="Default select example">
                        <option selected>스터디실을 선택해주세요</option>
                        <option value="1">마포구 합정</option>
                        <option value="2">성동구 성수</option>
                        <option value="3">영등포구 여의도</option>
                    </select>
                </a>
            </div>
            <div class="search_input__start_date">
                <a href="#">
                    <div>예약자</div>
                    <input type="name" placeholder="이름">
                </a>
            </div>
            <div class="search_input__end_date">
                <a href="#" onclick="buildCalendar(); openPopup()">
                    <div>날짜</div>
                    <input type="datetime" placeholder="날짜 추가" readonly id="calendar">
                </a>
            </div>
            <div>
                <a href="#">
                    <div>인원</div>
                    <input type="number" placeholder="게스트 추가">
                </a>
            </div>
            <div>
                <button class="search_button" style="text-align: center; background-color: #30A599" onClick="location.href='/study1'">
                    <img src="/assets/images/magnifying-glass-svgrepo-com.svg" class="magnifying_glass" >
                </button>
            </div>
        </div>
        <div class="search_input experience_box display_none">
            <div style="width:52%"><a href="#">
                <div style="margin:0 39px">위치</div> <input type="text" placeholder="어디로 여행가세요?" style="width:80.5%">
            </a></div>
            <div class="search_input__full_date" style="width:52%"><a href="#">
                <div style="margin:0 39px">날짜</div> <input type="datetime" placeholder="원하는 날짜를 입력하세요." style="width:80.5%"
                                                           readonly>
            </a></div>

        </div>
    </div>
    <div id="preface">
      <span>
        스터디실 예약
      </span>
    </div>
</header>

<section class="padding80 margin50">
    <ul class="items quarter img70 cities">
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/71e23854-a3c7-491c-b715-6e86233a293f.jpg?im_q=medq&im_w=720"
                     alt="">
                <span><span class="font_bold">KB국민은행 신관</span><span>차로 30분 거리</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/8b318783-723f-4584-9b9b-0eb2c8b6078e.jpg?im_q=medq&im_w=240"
                     alt="">
                <span><span class="font_bold">KB국민은행 본관</span><span>차로 1시간 거리</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/76e5f1c6-a788-418c-a28b-f0ee29cffd41.jpg?im_q=medq&im_w=240"
                     alt="">
                <span><span class="font_bold">KB손해보험 본점</span><span>차로 3.5시간 거리</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/ac2086c9-df0d-4085-94c0-94fe3fb94862.jpg?im_q=medq&im_w=240"
                     alt="">
                <span><span class="font_bold">한국경제인연합회</span><span>차로 30분 거리</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/8340bd19-ee32-4669-8b10-a8ac7e7735d4.jpg?im_q=medq&im_w=240"
                     alt="">
                <span><span class="font_bold">KB손해보험</span><span>차로 2시간 거리</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/7c424b7e-0f02-4282-93cf-c5fc5e5e157d.jpg?im_q=medq&im_w=240"
                     alt="">
                <span><span class="font_bold">KB국민카드 본사</span><span>차로 45분 거리</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/560c06e1-a396-4414-9e38-4fbe8e9f04c4.jpg?im_q=medq&im_w=240"
                     alt="">
                <span><span class="font_bold">KB국민카드 IT센터</span><span>차로 45분 거리</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/847cfb7f-788d-42dc-9148-f375348dde76.jpg?im_q=medq&im_w=240"
                     alt="">
                <span><span class="font_bold">KB저축은행</span><span>차로 1시간 거리</span></span>
            </li>
        </a>
    </ul>
</section>

<section class="padding80 margin50">
    <div><b class="font32">검색 시간 이용가능 스터디룸</b></div>
    <ul class="items quarter">
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/a0316ecb-e49b-4b3a-b6b6-c2876b820e8c.jpg?im_w=480"
                     width="100%"><b class="font18">스타벅스</b></li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/ff69ac49-64e7-4f4a-ae2b-ee01163d0790.jpg?im_w=480"
                     width="100%"><b class="font18">알렌시아 스터디룸</b></li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/ce6814ba-ed53-4d6e-b8f8-c0bbcf821011.jpg?im_w=480"
                     width="100%"><b class="font18">룸카페</b></li>
        </a>
        <a href="#">
            <li><img src="https://a0.muscache.com/im/pictures/34b9d53a-8952-47f8-876d-bb927ea487b2.jpg?im_w=480"
                     width="100%"><b class="font18">스터디카페</b></li>
        </a>
    </ul>
</section>

<div id="popup" class="popup-container">
    <table class="Calendar">
        <thead>
        <tr>
            <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
            <td colspan="5">
                <span id="calYear"></span>년
                <span id="calMonth"></span>월
            </td>
            <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
        </tr>
        <tr>
            <td>일</td>
            <td>월</td>
            <td>화</td>
            <td>수</td>
            <td>목</td>
            <td>금</td>
            <td>토</td>
        </tr>
        </thead>

        <tbody>
        </tbody>
    </table>
</div>