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
                        <option selected>스터디 장소 선택</option>
                        <option value="1">서울</option>
                        <option value="2">경기</option>
                        <option value="3">인천</option>
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
                    <input type="datetime" placeholder="회의 날짜" readonly id="calendar">
                </a>
            </div>
            <div>
                <a href="#">
                    <div>인원</div>
                    <input type="number" placeholder="회의 참여 인원">
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
    <div><b class="font32">KB금융그룹 이용 가능 회의실</b></div>
    <ul class="items quarter img70 cities">
        <a href="#">
            <li><img src="https://wimg.mk.co.kr/meet/neds/2021/11/image_readtop_2021_1042511_16359180324837406.jpg" style="width:90px; height: 90px"
                     alt="">
                <span><span class="font_bold">KB국민은행 신관</span><span>서울특별시 영등포구 국제금융로8길 26</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://assets.website-files.com/600568bc9a3057a175f0ae01/605446dbe6e16f420ba78cf4_3.%20%EB%A6%AC%ED%94%84%ED%8A%B8%20%EB%AA%A8%EB%8B%88%ED%84%B0%20%EC%84%A4%EC%B9%98%20%EC%82%AC%EB%A1%80%20%EA%B5%AD%EB%AF%BC%EC%9D%80%ED%96%89.png"
                     alt="" style="width:90px; height: 90px">
                <span><span class="font_bold">KB국민은행 본관</span><span>서울특별시 영등포구 국제금융로8길 30</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://t1.daumcdn.net/cfile/tistory/99A7C73F5A66C71026" style="width:90px; height: 90px"
                     alt="">
                <span><span class="font_bold">KB손해보험 본점</span><span>서울특별시 강남구 테헤란로 117 </span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://tower.fki.or.kr/assets/images/main/11-tower-3F-Bamboo.png" style="width:90px; height: 90px"
                     alt="">
                <span><span class="font_bold">한국경제인연합회</span><span>서울 특별시 영등포구 여의대로 24 FKI타워</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://scsgozneamae10236445.cdn.ntruss.com/data2/content/image/2018/11/20/.cache/512/201811200804211.jpg" style="width:90px; height: 90px" alt="">
                <span><span class="font_bold">KB국민카드 본점</span><span>서울특별시 종로구 새문안로3길 30 대우빌딩</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fi.pinimg.com%2F736x%2Fca%2F84%2F47%2Fca8447b2dcc66c306626fb26344c342d.jpg&type=sc960_832"
                     alt="" style="width:90px; height: 90px">
                <span><span class="font_bold">KB저축은행 본점</span><span>서울특별시 송파구 송파대로 260</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA0MjFfMjgw%2FMDAxNjgyMDYyNzY0NjYw.NFc5GIlb16z890z8juXxne-9xUsvBoBDYJYWGE9Sq9Mg.Jd36SK5YC-vYo8mIzGCqXWe3GENQyXBdaZTL0HhwxMEg.JPEG.odaroom%2F02%2529_10F_PT%25B7%25EB_%25281%2529_%25BB%25E8%25C1%25A6re.jpg&type=sc960_832" style="width:90px; height: 90px"
                     alt="">
                <span><span class="font_bold">KB자산운용 본점</span><span>서울특별시 영등포구 국제금융로 10 Three IFC</span></span>
            </li>
        </a>
        <a href="#">
            <li><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzEwMThfMjg4%2FMDAxNjk3NTkzMjUzMDg1.8TJVu1shHERV-tXPSaRW3N6VLIRUKm4D1o0jIsObfNQg.uCCXB1o9LgjUnXfiu1hGfC6f74y_d7-Ij3yM-ZZTjxcg.JPEG.5880404%2F20231016_165441.jpg&type=sc960_832" style="width:90px; height: 90px"
                     alt="">
                <span><span class="font_bold">KB증권 본점</span><span>서울 영등포구 여의나루로</span></span>
            </li>
        </a>
    </ul>
</section>

<section class="padding80 margin50">
    <div><b class="font32">근처 스터디 카페</b></div>
    <ul class="items quarter">

            <li><p class="font18">초심</p><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA1MDNfNDMg%2FMDAxNjgzMTIwNjg4Nzgz.OIY8WDG4w_4tG7n9VgAjUg82F67vFQeo2Rj41B9qirEg.dDhg48s5lwdjwU-Hlj5S5UQBmA8fn97JAmxam6z6pb8g.JPEG.top_ki%2F2-9.jpg&type=sc960_832"
                     style="width: 260.75px; height: 260.75px;"></li>

        <li><p class="font18">르하임</p><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzAzMDhfMTI3%2FMDAxNjc4MjE0NjMzMzYx.rOa0leNINWLzUmcUK-39xSxs43WLJFFQmGtWUdeX9X8g.9PrvxnncsxC51qBJ_IZCZhOitgoTVqr_Xmtmz3w2_jAg.JPEG.jy780486%2F%25B8%25A3%25C7%25CF%25C0%25D3%25BD%25BA%25C5%25CD%25B5%25F0%25C4%25AB%25C6%25E4_%25C1%25C2%25B5%25BF%25C1%25A115.jpg&type=sc960_832"
                 style="width: 260.75px; height: 260.75px;"></li>

        <li><p class="font18">멘토즈</p><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA1MTRfMTk4%2FMDAxNjgzOTk5OTg5MTEx.4_YvMPqGQP3h8vDjNlEEmhZ2uXok1xHG3i8A-2Fiiqog.37aEZey7U1CreNfnl4ij-Po4Jt3r7A0KpLvwXzyZVnwg.JPEG.assist5723%2FKakaoTalk_20230512_125322966_07.jpg&type=sc960_832"
                 style="width: 260.75px; height: 260.75px;"></li>

        <li><p class="font18">화이트펜슬</p><img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzA2MDFfMjc4%2FMDAxNjg1NjAxMzYwNDIx.hf1my2Yg1Gv7bPzmofj9lMFAeYow8lTWhPvqxDJGAp0g.FngYhsVX0Sr6wmBkxYzwV4nFxXYldqKv8ZB0D6AYYsIg.PNG.tobesmart111%2Fimage.png&type=sc960_832"
                 style="width: 260.75px; height: 260.75px;"></li>

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
