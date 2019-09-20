<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html >
<html>
<head profile="http://www.w3.org/2005/10/profile">
<meta charset='utf-8' />
<title>Insert title here</title>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<%-- <link href='<%=request.getContextPath() %>/resources/css/main_daygrid.css' rel='stylesheet' />
<link href='<%=request.getContextPath() %>/resources/css/main_list.css' rel='stylesheet' />
<link href='<%=request.getContextPath() %>/resources/css/main.css' rel='stylesheet' />
<script src='<%=request.getContextPath() %>/resources/js/main_daygrid.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/main_g_cal.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/main_int.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/main_list.js'></script>
<script src='<%=request.getContextPath() %>/resources/js/main.js'></script> --%>
<link href='<%=request.getContextPath() %>/resources/packages/core/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath() %>/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath() %>/resources/packages/list/main.css' rel='stylesheet' />
<script src='<%=request.getContextPath() %>/resources/packages/core/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/interaction/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/daygrid/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/list/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/google-calendar/main.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {

      plugins: [ 'interaction', 'dayGrid', 'list', 'googleCalendar' ],

      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,listYear'
      },

      displayEventTime: false, // don't show the time column in list view

      // THIS KEY WON'T WORK IN PRODUCTION!!!
      // To make your own Google API key, follow the directions here:
      // http://fullcalendar.io/docs/google_calendar/
      googleCalendarApiKey: 'AIzaSyDcnW6WejpTOCffshGDDb4neIrXVUA1EAE',

      // US Holidays
      
     /* $.ajax({
				contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        url:"login.ubi",
		        data : {id : input_id},
		        dataType:"json",
		        success: function(plan){
		        	
		        }
     }); */
      
      events: [
    	    {
    	        title  : 'title',
    	        start  : '2019-09-20',
    	        end    : '2019-09-21'
    	    },
    	    {
    	        title  : 'event2',
    	        start  : '2019-09-10',
    	        end    : '2019-09-15'
    	    },
    	    {
    	        title  : 'event3',
    	        start  : '2019-09-10',
    	        end    : '2019-09-15'
    	    }
    	],

      eventClick: function(arg) {
        // opens events in a popup window
        window.open(arg.event.url, 'google-calendar-event', 'width=700,height=600');

        arg.jsEvent.preventDefault() // don't navigate in main tab
      },

      loading: function(bool) {
        document.getElementById('loading').style.display =
          bool ? 'block' : 'none';
      }

    });

    calendar.render();
  });
  $(function(){
	  $('.fc-view-container').animate({
		  backgroundColor:'white'
	  },10);
	  $('.fc-toolbar fc-header-toolbar').animate({
		  backgroundColor:'white'
	  },10);
	  
	  
	  
  });
</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-size: 14px;
    background-image: url("<%=request.getContextPath()%>/resources/images/project_img8-3.png");
  }

  #loading {
    display: none;
    position: absolute;
    top: 10px;
    right: 10px;
  }

  #calendar {
    max-width: 70%;
    margin: 0 auto;
  }

</style>

</head>
<body style="overflow-x:hidden" >
<%@ include file="top.jsp" %>
<div style="float: none;width: 100%;">
<div style="float: left;padding: 20px;background-color: rgba(0,0,0,1);width: 17%;color: white;">
	<img src="<%=request.getContextPath()%>/resources/images/default1.png" width="100%" height="100%">
	<br>
	<br>
	<span style="color: #aaa;">${bean.id }</span><br><br>
	<span style="font-size: 30px;">${bean.nick }</span>
	<hr>
	<br><br>
	<span style="font-size: 15px;color: #aaa;">${bean.nick }님의 포인트는?</span><br><br>
	<span style="font-size: 30px;">〔${bean.point } P〕</span>
	<hr>
	<br><br>
	<span style="font-size: 15px;color: #aaa;">${bean.nick }님의 등급은?</span><br><br>
	<span style="font-size: 30px;">〔${bean.grade }〕</span>
	<hr>
	<br><br>
	<span style="font-size: 15px;color: #aaa;">${bean.nick }님이 선호하시는 언어</span><br><br>
	<span style="font-size: 30px;">〔${bean.fav }〕</span>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<span style="font-size: 15px;color: #777">UBI STUDY<br><br>▶</span>
	<br>
</div>

	<div style="width: 83%;float: none;margin-left: 100px;padding: 100px;">
	<div id='loading'>loading...</div>

 	 <div id='calendar' style="background-color: white;box-shadow:0px 0px 5px 5px white;"></div>
 	 
	</div>

</div>
</body>
</html>