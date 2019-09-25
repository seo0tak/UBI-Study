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
					description : "<%=list.get(i).getMemo()%>",
					backgroundColor: '<%=list.get(i).getColor()%>',
					textColor: '#ffffff'
				}
			 <%if(i!=list.size()-1){%>,<%}}%>
      ],    
      eventClick: function(info) {
    		var start_day = moment(info.event.start).format('YYYY-MM-DD HH:mm');
    		var end_day = moment(info.event.end).format('YYYY-MM-DD HH:mm');
    		$.ajax({
    			url :"description.ubi",
    			data:{
    				start : start_day,
    				end : end_day
    			},
    			success:function(result){
    				$('#memo').html(result);
    			}
    		});
    		$('#start').html(start_day);
    		$('#end').html(end_day);
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
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		loginId=localStorage.getItem("loginId");
		if(loginId==null){
			location.href="main.ubi";
		}
		
		<%int k=0;%>
		$(".leftContent").hide();
		$('#cal').show();
		$('input[id=myPageButton]').click(function(){
			//alert("버튼클릭");
			var tit=$(this).attr("title");
			$(".leftContent").hide(0,function(){
				if(tit=="오늘일정"){
					$('#cal').show();
				}else if(tit=="찜한영상"){
					$('#facVideo').show();
				}else if(tit=="참여한그룹"){
					$('#joinGroup').show();
				}else if(tit=="만든그룹"){
					$('#myGroup').show();
				}
			});
		});
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
		
		<div style="text-align: center;padding-top: 50px;padding-bottom: 50px;">
		<input type="button" value="오늘 일정" class="button1" style="width: 95%;" id="myPageButton" title="오늘일정">
		<input type="button" value="찜한 영상" class="button1" style="width: 95%;" id="myPageButton" title="찜한영상">
		<input type="button" value="참여한 스터디 그룹" class="button1" style="width: 95%;" id="myPageButton" title="참여한그룹">
		<input type="button" value="내가만든 스터디 그룹" class="button1" style="width: 95%;" id="myPageButton" title="만든그룹">
		</div>
		
		
		
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


	<div style="width: 83%;float: none;margin-left: 100px;padding: 100px;" class="leftContent" id="cal">
		<div id='loading'>loading...</div>
	 	<div id='calendar' style="background-color: white;box-shadow:0px 0px 5px 5px white;"></div>
	 	
	 	
	 	<div class="eft2" id="planDiv" style="opacity: 0;">
			<div style="width:40%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 100px;padding: 50px;padding-top: 10px;font-size: 20px;color: black;">
				<p style="text-align: right;font-size: 30px;cursor: pointer;">
					<span class="closeX">X</span>
				</p>
				기간 : <span id="start"></span> ~ <span id="end"></span> <br><br>
				<div id="memo"></div>
			</div>
		</div>
	</div>
    
    
    
    <!-- 찜한 영상 -->
    <div class="leftContent" id="facVideo" style="text-align: center;width: 83%;float: none;margin-left: 100px;padding: 100px;">
    
    	<div style="width: 80%;text-align: center;margin: auto;">
<table style="background-color: rgba(255,255,255,1);box-shadow: 0px 0px 10px 10px white;margin: auto;">

<c:forEach items="${fav }" var="list">
<%k+=1; %>

<tr id="a<%=k%>" class="hiddenContents">
<td style="text-align: left;">
<!-- 
 	<iframe width="320" height="180" src="${list.url }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
 -->
 <img src="<%=request.getContextPath()%>/resources/images/default2.png" width="320" height="180" style="opacity: 0.2;" id="${list.url }" class="vidClick" alt="${list.title }">
</td>
<td style="text-align: left;width: 80%;vertical-align: top;">
<br>
<span style="font-size: 35px;margin-left: 10px;">${list.title }<span id="${list.num }" class="favSpan" style="color:rgba();"></span>
</span><br>
<span style="font-size: 20px;color: rgba(0,0,0,0.3);margin-left: 10px;">${list.day }</span><br><br>
<span style="margin-left: 10px;">${list.content }</span>
</td>
</tr>
<tr><td colspan="2"  id="b<%=k%>" class="hiddenContents"><br><hr><br></td></tr>

</c:forEach>
</table>
</div>
    </div>
    
    <div class="leftContent" id="joinGroup" style="text-align: center;width: 83%;float: none;margin-left: 100px;padding: 100px;">
    	joinGroup
    	
    	
    	
    </div>
    
    <div class="leftContent" id="myGroup" style="text-align: center;width: 83%;float: none;margin-left: 100px;padding: 100px;">
    <table style="text-align: left;margin: auto;background-color: rgba(255,255,255,1);box-shadow: 0px 0px 10px 10px white;">
    
    	<c:forEach items="${stdBean }" var="std">
    	<tr><td style="padding: 50px;">
    		<span style="font-size: 40px;">${std.title }</span>
    		<br>
			<span style="font-size: 20px;color: rgba(0,0,0,0.3);">시작 : ${std.start_day } ~ 종료 : ${std.end_day }</span>
			<br>
			<span style="font-size: 24px;color: rgba(0,0,0,0.8);">${std.nick }님의 모임</span>
			<hr color="#fa1">
			<span style="font-size: 24px;color: rgba(0,0,0,0.5);">언어 : </span><span style="font-size: 24px;color: rgba(0,0,0,1);">${std.lang }</span>
			<br>
			<span style="font-size: 20px;">${std.memo }</span>
    	</td></tr>
    	<tr height="50"><td style="text-align: center;">
    	<span style="font-size: 50px; color: rgba(0,0,0,0.2);">◇◇◇◇◇</span>
    	</td></tr>
    	</c:forEach>
    </table>
    	
 <!--nick
title
memo

start_day
end_day
day
lang -->
    </div>
    
</div>    
</body>
</html>