// // カレンダー表示
// $(function () {
    $(document).on('turbolinks:load', function () {
        function eventCalendar() {
            return $('#calendar').fullCalendar({});
        };
        function clearCalendar() {
            $('#calendar').html('');
        };
        $(document).on('turbolinks:load', function () {
          eventCalendar();
        });
        $(document).on('turbolinks:before-cache', clearCalendar);
        //以下を追加
        $('#event_calendar').fullCalendar({
          events: '/events.json',
          // events: '/tickets.json',

          titleFormat: 'YYYY年 M月',
          dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],

          header: {
            left: '',
            center: 'title',
            right: 'today prev,next',
          },

          defaultTimedEventDuration: '03:00:00',
          buttonText: {
            prev: '前',
            next: '次',
            prevYear: '前年',
            nextYear: '翌年',
            today: '今日',
            month: '月',
            week: '週',
            day: '日',
          },
          timeFormat: 'HH:mm',
          eventColor: '#63ceef',
          eventTextColor: '#000000',

          eventClick: function(calEvent, jsEvent, view) {
            // カレンダーに設定したイベントクリック時のイベント
            $('#modalTitle').html(calEvent.title); // モーダルのタイトルをセット
            $('#modalBody').html(calEvent.description); // モーダルの本文をセット
            $('#calendarModal').modal(); // モーダル着火
          },
        });
    });
// });