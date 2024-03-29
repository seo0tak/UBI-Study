<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menuCont{
	
		z-index: 20;
	}
	#div1_1{
		min-width: 100%;
		height: 500px;
		z-index: 1;
		cursor: pointer;
	}
	#divTop{
		z-index: 2;	
	}
	#div2{
		color: black;
	}
	#div1_obj1{
		border-bottom: 500px solid rgba(0,0,0,0.3);
		border-left: 50px solid transparent;
		height: 0px;
		width: 400px;
		float: right;
		z-index: 1;
	}
	#div1_obj2{
		width: 700px;
		height: 400px;
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img3.png");
		background-repeat:no-repeat;
		position: absolute;
		right: 120px;
		top: 70px;
		z-index: 1;
		
	}
	#div1_obj3{
		width: 200px;
		height: 200px;
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img4.png");
		background-repeat:no-repeat;
		position: absolute;
		left: 220px;
		top: 190px;
		opacity: 0.3;
	}
	.smallTitle1{
		margin-top:180px;
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img5.png"); 
		text-align: center;
		background-repeat: no-repeat;
	}
	.smallTitle2{
		width: 70%;
		border-radius:10px 10px 10px 10px;
		border-right: 1px solid rgb(166,166,166);
		border-left: 1px solid rgb(166,166,166);
		margin: auto;
	}
	.smallTitle_title{color: rgb(166,166,166);font-size: 20px;}
	.smallTitle_logo{color: rgb(217,217,217);}
	.button2{
		padding: 15px;
		border: 1px solid #ccc;
		background-color: white;
		padding-right:40px;
		padding-left:40px;
		font-size: 20px;
		cursor: pointer;
	}
	.button2:hover{
		border: 1px solid #fa0;
		color:#fa0;
	}
	#div3_img1{
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img2.png");
		background-size: cover;
		height: 588px;
	}
	#div1_obj4{
		width: 0px;
		height: 7px;
		background-color:rgba(255,255,255,0.4);
		background-repeat:no-repeat;
		position: absolute;
		left: 0px;
		top: 543px;
		opacity: 0.8;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		
		var divNum=1;
		var div="#div1_"+divNum;
		
		$('.divContents').hide(0,function(){
			$(div).show("fade",800);
		});
		
		
		$('#div1_obj1').hide(0,function(){
			$(this).show("drop", {direction:"right"},1500);
		});
		$('#div1_obj2').hide(0,function(){
			$(this).show("drop", {direction:"up"},1000);
		});
		
		$('#detail1').mouseover(function(){
			$(this).stop().animate({color:'white'},300);
		}).mouseout(function(){
			$(this).stop().animate({color:'rgb(255,230,153)'},300);			
		});
		
		$('#div1_obj3').mouseover(function(){
			$(this).stop().animate({opacity:'1'},300);
		}).mouseout(function(){
			$(this).stop().animate({opacity:'0.3'},300);			
		});
		
		var i1=0;
		var i2=0;
		var i3=0;
		var today_user=672; 
		var total_user=1568502;
		var some_number=689153;   
		var today_user_int = setInterval(function(){
			i1+=Math.floor(today_user/500);
			$('#today_user').html(i1+"명");
			if(i1>=today_user){
				clearTimeout(today_user_int);
				$('#today_user').html(today_user+"명");
			}
		},1);
		var total_user_int = setInterval(function(){
			i2+=Math.floor(total_user/600);
			$('#total_user').html(i2+"명");
			if(i2>=total_user){
				clearTimeout(total_user_int);	
				$('#total_user').html(total_user+"명");
			}
		},1);
		var some_number_int = setInterval(function(){
			i3+=Math.floor(some_number/700);
			$('#some_number').html(i3);
			if(i3>=some_number){
				clearTimeout(some_number_int);	
				$('#some_number').html(some_number);
			}
		},1);
		
		var flag=true;
		var leng=1;
		var main = setInterval(function(){
			if(flag==true){
				leng+=1;
			}
			if((leng/2)>=100){
				leng=0;
				$("#div1_"+divNum).hide("fade",700,function(){
					divNum=divNum+1;
					if(divNum>3){
						divNum=1;
					}
					$("#div1_"+divNum).show("fade",700);					
				});

			}
			$('.bar').animate({
				width:(leng/2)+"%"
			},40);
		},50);
		
		$('.divContents').mouseover(function(){
			flag=false;
		}).mouseout(function(){
			flag=true;
		});
		
	});
</script>
</head>
<body style="overflow-x:hidden">
<%@ include file="top.jsp" %>


<div id="div1_1" class="divContents" style="background-image: url('<%=request.getContextPath()%>/resources/images/project_img1(2).png');background-size: cover;">
	<div id="div1_obj1">
	</div>
	<div id="div1_obj2" align="center">
		<img src="<%=request.getContextPath()%>/resources/images/logo1.png" width="700px" height="140px">
		<p style="color: rgb(255,242,204);font-size: 30px;">언제나, 어디서나 함께 코딩 스터디 하세요!</p>
		<p style="text-align: left;margin-left: 107px;color: rgb(255,230,153);font-size: 20px;">
		몇 시에 어디에서?, 책상 넓나요?, 빔 있어요?, 스터디룸 너무 비싸요..<br>
		<br>이제 이런 걱정은 그만, UBI-STUDY에서 모이자!<br><br>
		<br>
		신개념 스터디공간 UBI-STUDY 
		</p>
		<p style="color: rgb(255,230,153);font-size: 30px;" id="detail1">▲<br>
		자세히 보기 </p>
	</div>
	<div id="div1_obj3">
	</div>
	
	<div id="div1_obj4" class="bar">
	</div>	
</div> 

<div id="div1_2" class="divContents" style="min-width: 100%;height: 500px;z-index: 1;cursor: pointer;
background-image: url('<%=request.getContextPath()%>/resources/images/project_img6.png');background-size: cover;">

	<%-- <div>
		<img src="<%=request.getContextPath()%>/resources/images/project_img6.png" style="min-width: 100%; width: 100%;">
	</div>
 --%>
	<div id="div1_obj4" class="bar">
	</div>	
</div>
<div id="div1_3" class="divContents" style="min-width: 100%;height: 500px;z-index: 1;cursor: pointer;
background-image: url('<%=request.getContextPath()%>/resources/images/project_img7.png');background-size: cover;">



	<div id="div1_obj4" class="bar">
	</div>
</div>





<div style="background-color: black;height: 810px;box-shadow: 0px 0px 5px 5px rgba(0,0,0,0.2);padding-top: 70px;">

	<div style="color: white;text-align: center;font-size: 40px;">
	
	<span style="color:rgba(207,175,100,1);">
	│ 언제나, 어디서나 서로 얼굴보며, 대화하며 스터디! │<br>
	<br>
	│ 실시간 코드공유, 컴파일, 채팅까지 │<br>
	<br>
	│ 비싼 스터디룸 비용, 예약전쟁, 교통지옥은 이제 그만! │<br>
	<br><br>
	</span>	
	</div>
</div>



<!-- 오늘 개설된 스터디 그룹의 항목 -->
<div id="div2" class="smallTitle1" style="margin-top: 60px;">
	<div class="smallTitle2">
		<p class="smallTitle_title">오늘 개설된 스터디 그룹</p>
		<p class="smallTitle_logo">UBI STUDY<br>
		▼</p>
	</div>
<c:forEach items="${study_list }" var="lists" varStatus="status">
	<c:if test="${status.count<4}">
	<form action="">
	<input type="hidden" name="num">
	<div style="margin: auto;border-bottom:1px solid black;width: 1000px;height: 200px;margin-top: 50px;text-align: left;">
		<img src="<%=request.getContextPath()%>/resources/images/default1.png" style="float: left;margin-right: 20px;" width="190px" height="190px;">
		<span style="font-size:30px;">${lists.title }</span>
		<br>
		<br>
		<span style="font-size: 20px;">${lists.memo }</span><br>
		<p style="text-align: right;"><input type="button" value="참여" class="button2"></p>
	</div>
	</form>
	</c:if>
</c:forEach>
<br>
<input type="button" class="button1" value="더보기" onclick="location.href='studyboard_list.ubi'">
</div>

<!-- 조회수나 접속자 수를 나타내는 항목 -->
<div id="div3" class="smallTitle1">
	<div class="smallTitle2">
		<p class="smallTitle_title">UBI의 회원들</p>
		<p class="smallTitle_logo">UBI STUDY<br>
		▼</p>
	</div>
	<br><br><br><br><br>
	<div id="div3_img1">
		<div style="position: relative;top:233px;left: 210px;float: left;">
			<span style="color: rgb(197,90,17);font-size: 37px;border-bottom: 2px solid rgb(236,145,24);padding-bottom: 20px;">
			오늘 방문자 수
			</span><br><br><br><br> 
			<span id="today_user" style="color: rgb(132,60,12);font-size: 35px;"></span>
		</div>
		<div style="position: relative;top:233px;left: 430px;float: left;">
			<span style="color: rgb(236,137,28);font-size: 37px;border-bottom: 2px solid rgb(236,145,24);padding-bottom: 20px;">
			누적 방문자 수
			</span><br><br><br><br> 
			<span id="total_user" style="color: rgb(132,60,12);font-size: 35px;"></span>
		</div>
		<div style="position: relative;top:233px;left: 640px;float: left;">
			<span style="color: rgb(197,90,17);font-size: 37px;border-bottom: 2px solid rgb(236,145,24);padding-bottom: 20px;">
			그냥 뭔가 숫자
			</span><br><br><br><br> 
			<span id="some_number" style="color: rgb(132,60,12);font-size: 35px;"></span>
		</div>
	</div>

</div>

<!-- 대충 환영한다는 내용의 항목 -->
<div id="divLast" class="smallTitle1" style="height: 500px;">
<br><br><br>
<br><br><br>
<br>
	<div class="smallTitle2" style="width: 500px;">
		<p class="smallTitle_title" style="font-size: 30px;">대충 환영한다는 내용</p>
		<p class="smallTitle_logo">UBI STUDY<br>
		▼</p>
	</div>
</div>



<%@ include file="bottom.jsp" %>
</body>
</html>