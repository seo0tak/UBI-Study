<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@font-face{
		font-family: 'NIXGONFONTS';
		src: url("<%=request.getContextPath()%>/resources/font/NIXGONFONTS M 2.0.ttf") format('truetype');
	}
	body{
		font-family: NIXGONFONTS;
		 margin: 0;
    	padding: 0;
	}
	input{
		font-family: NIXGONFONTS;
	}
	#divTop{
		min-width: 100%;
		
		height: 50px;
		background-color: rgba(0,0,0,1);
		/* border-bottom: 1px solid rgba(133,119,105,1); */
		box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.2);
	}
	#divTop_in{
		min-width: 100%;
	}
	#top_mid span{
		color: rgba(217,217,217,1);		
	}
	#top_top{
		position: absolute;
		left: 50px;
		top: 0px;
	}
	#top_mid{
		text-align: center;
		padding: 14px;
	}
	#top_bot{
		position: absolute;
		right:10px;
		top: 7px;
	}
	.topBut1{
		font-size: 18px;
		cursor:pointer;		
	}
	.button1{
		cursor:pointer;		 
		border-radius: 3px 3px 3px 3px;
		border: 1px solid rgb(150,150,150);
		background-color: black;
		font-size:18px;
		color: rgb(170,170,170);
		padding:6px;
		padding-left: 30px;
		padding-right: 30px;
	}
	#gotoTop{
		cursor: pointer;
	}
	.eft2{
		position:absolute;
		z-index: 15;
		min-width: 100%;
		min-height: 100%;
		background-color: rgba(0,0,0,0.5);
		left: 0px;
		top: 0px;
		position: fixed;
	}
	.err{
		font-size: 20px;
		color: red;
		font-weight: bold;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%
	String[] util={"스터디 그룹","동영상 강의","자유 게시판","공지"};
	String[] ubi={"","","freeboard_list.ubi",""};
%>
<script type="text/javascript">

	$(function(){
		var animationSpeed=300;
		$('.topBut1').mouseover(function(){
			$(this).stop().animate({
				color:'rgb(255,217,102)'
			},animationSpeed);
		}).mouseout(function(){
			$(this).stop().animate({
				color:'rgb(217,217,217)'
			},animationSpeed);
		});
		$('.button1').mouseover(function(){
			$(this).stop().animate({
				backgroundColor:'rgb(255,255,255)',
				color:'black'
			},animationSpeed);
		}).mouseout(function(){
			$(this).stop().animate({
				backgroundColor:'rgb(0,0,0)',
				color:'rgb(170,170,170)'
			},animationSpeed);
		});

		$('#gotoTop').mouseover(function(){
			$(this).stop().animate({
				color:'rgba(255,192,0,1)'
			},animationSpeed);
		}).mouseout(function(){
			$(this).stop().animate({
				color:'rgba(0,0,0,0.2)'
			},animationSpeed);
		}).click(function(){
			$('html, body').animate({
				 scrollTop : 0
			}, 400);
		});
		
		$('.topBut1').click(function(){
			var topId=$(this).attr("id");
			location.href=topId;
		});
		
		$('.closeX').click(function(){
	         $('.eft2').hide("fade",1,function(){
	            location.reload();               
	         });
	      });
		
		$('#join').click(function () {
			location.href="register.ubi";
		});
		
		$('.eft2').hide();
	});

</script>
</head>
<body>
<div id="divTop">

	<div id="divTop_in">
	<div id="top_top">
		<a href="main.ubi">
		<img src="<%=request.getContextPath()%>/resources/images/logo1.png" width="250px" height="50px" style="cursor: pointer;">
		</a>
	</div>
	<div id="top_mid"><!--top메뉴의 중간 기능선택부분-->
		<span class="topBut1" id="<%=ubi[0]%>"><%=util[0]%></span>
		<%for(int i=1;i<util.length;i++){%>	
		<span>　│　</span>
		<span class="topBut1" id="<%=ubi[i]%>"><%=util[i]%></span>
		<%}%>
	</div>	
	<div id="top_bot">
		<input type="button" value="로그인" id="login" class="button1">
		<input type="button" value="회원가입" id="join" class="button1">
	</div>
	</div>
	
</div>

<div style="width: 100px;height: 130px; background-color: rgba(255,255,255,0.0);position: absolute; right: 50px; bottom: 0px; position: fixed;text-align: center;">
	<span id="gotoTop" style="font-size: 40px;color: rgba(0,0,0,0.2);">▲
	<br>TOP
	</span>
	
</div>

<%-- <div class="eft2" id="register">
   <div style="width:50%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 100px;padding: 50px;padding-top: 10px;font-size: 20px;color: black;">
      <p style="text-align: right;font-size: 30px;cursor: pointer;">
         <span class="closeX">X</span> 
      </p>
      <span style="font-size: 30px;">회원가입</span>
      <hr>
      <form:form commandName="member" method="post" action="register.ubi">
      <table border="1" width="100%" height="500px">
      	<tr>
      		<th width="20%">아이디</th>
      		<td>
      			<input type="text" name="id" id="userid" style="width: 50%;line-height: 100%">
      			<button class="button1" id="idck">중복확인</button>
      			<form:errors cssClass="err" path="id" />
      		</td>
      	</tr>
      	<tr>
      		<th width="20%">비밀번호</th>
      		<td>
      			<input type="text" name="pw" id="userpwd">
      			<form:errors cssClass="err" path="pw" />
      		</td>
      	</tr>
      	<tr>
      		<th width="20%">비밀번호확인</th>
      		<td>
      			<input type="text" name="pw_check">
      			<form:errors cssClass="err" path="pw_check" />
      		</td>
      	</tr>
      	<tr>
      		<th width="20%">이름</th>
      		<td>
      			<input type="text" name="name">
      			<form:errors cssClass="err" path="name" />
      		</td>
      	</tr>
      	<tr>
      		<th width="20%">이메일</th>
      		<td>
      			<input type="text" name="email">
      			<form:errors cssClass="err" path="email" />
      		</td>
      	</tr>
      	<tr>
      		<th width="20%">핸드폰</th>
      		<td>
      			<input type="text" name="pnum">
      			<form:errors cssClass="err" path="pnum" />
      		</td>
      	</tr>
      	<tr>
      		<th width="20%">닉네임</th>
      		<td>
      			<input type="text" name="nick">
      			<form:errors cssClass="err" path="nick" />
      			
      		</td>
      	</tr>
      </table> 
      </form:form>
      
   </div>
</div> --%>

</body>
</html>