 <script type='text/javascript'>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                googleCalendarApiKey: 'AIzaSyDjk_46V4EV_AHXb7MmJdON3zkiNt3WCQs',
                eventSources: [
                    {
                        googleCalendarId: 'kbdavid890414@gmail.com',
                        className: '여의도나들이',
                        color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
                        //textColor: 'black'
                    },
                    {
                        googleCalendarId: 'kbdavid890414@gmail.com',
                        className: '테스트',
                        color: '#204051',
                        //textColor: 'black'
                    },
                    {
                        googleCalendarId: 'kbdavid890414@gmail.com',
                        className: 'Tasks',
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
<div id='calendar'></div>
