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
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
	});
</script>
</head>
<body>
<%
	String[] util={"스터디 그룹","동영상 강의","자유 게시판","공지"};
%>
<div id="divTop">

	<div id="divTop_in">
	<div id="top_top">
		<img src="<%=request.getContextPath()%>/resources/images/logo1.png" width="250px" height="50px">
	</div>
	<div id="top_mid"><!--top메뉴의 중간 기능선택부분-->
		<span class="topBut1" id="<%=util[0]%>"><%=util[0]%></span>
		<%for(int i=1;i<util.length;i++){%>	
		<span>　│　</span>
		<span class="topBut1" id="<%=util[i]%>"><%=util[i]%></span>
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

</body>
</html>