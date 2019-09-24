<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ubi.member.model.PlanerBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset='utf-8' />
	<title>Insert title here</title>

<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<link href='<%=request.getContextPath() %>/resources/packages/core/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath() %>/resources/packages/daygrid/main.css' rel='stylesheet' />
<link href='<%=request.getContextPath() %>/resources/packages/list/main.css' rel='stylesheet' />
<script src='<%=request.getContextPath() %>/resources/packages/core/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/moment/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/plugins/moment/moment.min.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/interaction/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/daygrid/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/list/main.js'></script>
<script src='<%=request.getContextPath() %>/resources/packages/google-calendar/main.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='<%=request.getContextPath() %>/resources/plugins/moment/moment.min.js'></script>


</head>
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

.fc-event{
    cursor: pointer;
}

</style>
<script>
  document.addEventListener('DOMContentLoaded', function() {
	var srcCalendarEl = document.getElementById('source-calendar');
	

    <%
    	ArrayList<PlanerBean> list = (ArrayList<PlanerBean>)request.getAttribute("plan");
    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    	SimpleDateFormat sdf2 = new SimpleDateFormat("YYYY-MM-dd HH:mm");
    %>
   
 	  
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'interaction', 'dayGrid', 'list', 'googleCalendar', 'momentPlugin', 'dayGridPlugin' ],
   	  
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
    
     events:[ 
     		 <%for(int i=0;i<list.size();i++){%>
				{
					title : '<%=list.get(i).getTitle()%>',
					start : '<%=sdf2.format(sdf.parse(list.get(i).getStart_day()))%>',
					end : '<%=sdf2.format(sdf.parse(list.get(i).getEnd_day()))%>',
					description : '<%=list.get(i).getMemo()%>',
					backgroundColor: '<%=list.get(i).getColor()%>',
					textColor: '#ffffff'
				}
			 <%if(i!=list.size()-1){%>,<%}}%>
      ],    
      eventClick: function(event) {
    		
    	  $('#planDiv').animate({
				opacity:1
			},0);
			$('#planDiv').show(200);
			$('.closeX').click(function(){
				$('.eft2').hide("fade",1,function(){
					location.reload();					
				});
			});
    		
      },
      
      locale: 'ko',
      timezone: "local",
      nextDayThreshold: "09:00:00",
      displayEventTime: true,
      displayEventEnd: true,
      firstDay: 0, //월요일이 먼저 오게 하려면 1
      weekNumbers: false,
      selectable: true,
      weekNumberCalculation: "ISO",
      eventLimit: true,
      views: {
        month: {
          eventLimit: 12
        }
      },
      eventLimitClick: 'week', //popover
      navLinks: true,
      timeFormat: 'HH:mm',
      defaultTimedEventDuration: '01:00:00',
      minTime: '00:00:00',
      maxTime: '24:00:00',
      slotLabelFormat: 'HH:mm',
      weekends: true,
      nowIndicator: true,
      dayPopoverFormat: 'MM/DD dddd',
      longPressDelay: 0,
      eventLongPressDelay: 0,
      selectLongPressDelay: 0,
      
      
      loading: function(bool) {
        document.getElementById('loading').style.display =
          bool ? 'block' : 'none';
      }
      
    });
    
    calendar.render();
    
  });
</script>
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
	 	
	 	
	 	<div class="eft2" id="planDiv" style="opacity: 0;">
			<div style="width:40%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 100px;padding: 50px;padding-top: 10px;font-size: 20px;color: black;">
				<p style="text-align: right;font-size: 30px;cursor: pointer;">
					<span class="closeX">X</span>
				</p>
			</div>
		</div>
	 	
		
	</div>
    
</div>    
</body>
</html>