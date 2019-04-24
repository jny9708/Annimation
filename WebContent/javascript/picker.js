!function(a) {
    a.fn.datepicker.dates.kr = {
      days : [ "일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일" ],
      daysShort : [ "일", "월", "화", "수", "목", "금", "토" ],
      daysMin : [ "일", "월", "화", "수", "목", "금", "토" ],
      months : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월",
          "11월", "12월" ],
      monthsShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월",
          "10월", "11월", "12월" ],
      titleFormat : "yyyy년 MM", /* Leverages same syntax as 'format' */
    }
  }(jQuery);
   
  $(document).ready(function() {        
      $('#datepicker1').datepicker({
        format : "yyyy-mm-dd",
        language : "kr",
        autoclose : true,
        todayHighlight : true
      }).on('hide', function(e) {
        e.stopPropagation(); // 모달 팝업도 같이 닫히는걸 막아준다.
      });
      
      var sdate1 = new Date();
      sdate1.setDate(sdate1.getDate() - 7); /*7일 간격*/
      $("#sdate1").datepicker('setDate', sdate1);
      $("#edate1").datepicker('setDate', new Date());
      $('#datepicker1').datepicker('updateDates');
  })
  
  