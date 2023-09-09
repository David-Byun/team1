<!DOCTYPE html>
<html lang='en'>
<head>
    <meta charset='utf-8' />
    <link href='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.css' rel='stylesheet' />
    <script src='${pageContext.request.contextPath}/resources/fullcalendar-5.1.0/lib/main.js'></script>
    <script type='text/javascript'>

        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                googleCalendarApiKey: '여기에 구글 API키 붙여넣기하시면 됩니다.',
                eventSources: [
                    {
                        googleCalendarId: '여기에 구글 캘린더 ID를 붙여넣기하시면 됩니다.',
                        className: '웹디자인기능사',
                        color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
                        //textColor: 'black'
                    },
                    {
                        googleCalendarId: '여기에 구글 캘린더 ID를 붙여넣기하시면 됩니다.',
                        className: '정보처리기능사',
                        color: '#204051',
                        //textColor: 'black'
                    },
                    {
                        googleCalendarId: '여기에 구글 캘린더 ID를 붙여넣기하시면 됩니다.',
                        className: '정보처리기사',
                        color: '#3b6978',
                        //textColor: 'black'
                    }
                ]
            });
            calendar.render();
        });
    </script>
    <style>
        #calendar{
            width:60%;
            margin:20px auto;
        }
    </style>
</head>
<body>
<div id='calendar'></div>
</body>
</html>