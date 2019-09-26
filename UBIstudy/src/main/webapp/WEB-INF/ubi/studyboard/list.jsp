<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../top.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<link rel=" shortcut icon" href="image/favicon.ico">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/bootstrap.min.css">
<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/moment.min.js"></script>
<script src="<%=request.getContextPath() %>/resources/FullCalendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet" href='<%=request.getContextPath() %>/resources/FullCalendar/vendor/css/bootstrap-datetimepicker.min.css' />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.listOne{
		border: 1px solid #fff;
		padding: 15px;
	}
	.eft1{
		border: 1px solid #fff;
	}
	body{
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img8-3.png");
		/* background-size: 100%;
		background-repeat: no-repeat; */
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
	.input1{
		resize: none;
		width: 500px;
		font-size: 22px;
		outline-color: #fa1;
		outline-width: 2px;
		border: 1px solid white;
		border-bottom: 1px solid gray;
		background-color: #fafafa;
	}
	.input_study{
		resize: none;
		width: 500px;
		font-size: 22px;
		outline-color: #fa1;
		outline-width: 2px;
		border: 1px solid white;
		border-bottom: 1px solid gray;
		background-color: #fafafa;
	}
	.input2{
		font-size: 22px;
		width: 120px;
		outline-color: #fa1;
		outline-width: 2px;
	}
	.input1[type=password]{
		font-family: initial;
	}
	#divTop{
		z-index: 10;
	}
</style>
<script type="text/javascript">

$(function(){
  //datetimepicker
    $("#start_day,#end_day").datetimepicker({
        format: 'YYYY-MM-DD HH:mm'
    });
	
	$('.closeDetail').click(function(){
		$('.eft2').hide("fade",1,function(){
			location.reload();					
		});
	});
	var WhatType="input";
	$('#inputBut').click(function(){
		loginId=localStorage.getItem("loginId");
		if(loginId==null){
			Swal.fire({
				  title: '회원만 글을 쓸 수 있습니다!!',
				  type: 'warning',
				  confirmButtonText: '확인',
				  width: '20%',
			});
		}else{
			$('#detailCon').animate({opacity:'1'},0);
			$('#StudyBoardInput').animate({opacity:'1'},0);
			$('#InputPassword').animate({opacity:'1'},0);
			WhatType="input";
			$('#inputTitleW').html("스터디모임");
			$('#pwDiv').show();
			$('#StudyBoardInput').show("fade",100);
		}
	});
	//글쓰기
	$('#study_input').click(function () {
		
		$('#errtitle').css('display','none');
		$('#errstart_day').css('display','none');
		$('#errend_day').css('display','none');
		$('#errlang').css('display','none');
		$('#errcolor').css('display','none');
		$('#errmemo').css('display','none');
		$('#errpw').css('display','none');
		var pwdCheck = 0;
		var inick = localStorage.getItem("nick");
		var ititle = $('#title').val();
		var istart_day = $('#start_day').val();
		var iend_day = $('#end_day').val();
		var ilang = $('#lang').val();
		var icolor = $('#color').val();
		var imemo = $('#memo').val();
		var ipw = $('#pw').val();
		var iflag = $('#flag').val();
		var query = moment(istart_day,'YYYY-MM-DD HH:mm').isBefore(iend_day,'YYYY-MM-DD HH:mm');
		
		if(ititle==""){
			$('#errtitle').html("모임명 입력은 필수입니다!!");
			$('#errtitle').show();
			return;
		}
		else if(istart_day==""){
			$('#errstart_day').html("시작일 선택은 필수입니다!!");
			$('#errstart_day').show();
			return;
		}
		else if(iend_day==""){
			$('#errend_day').html("마지막일 선택은 필수입니다!!");
			$('#errend_day').show();
			return;
		}
		else if(query==false){
			$('#errend_day').html("시작일보다 작습니다!!");
			$('#errend_day').show();
			return;
		}
		else if(ilang==""){
			$('#errlang').html("언어 선택은 필수입니다!!");
			$('#errlang').show();
			return;
		}
		else if(icolor==""){
			$('#errcolor').html("컬러 선택은 필수입니다!!");
			$('#errcolor').show();
			return;
		}
		else if(imemo==""){
			$('#errmemo').html("메모 입력은 필수입니다!!");
			$('#errmemo').show();
			return;
		} 
		else if(ipw==""){
			$('#errpw').html("비밀번호 입력은 필수입니다!!");
			$('#errpw').show();
			return;
		}
		else{
			if(pwdCheck==0){
				$.ajax({
					  url:"studyboard_pwcheck.ubi",
				      data : {id : localStorage.getItem("loginId")},
				      success: function (pw) {
				    	  if(ipw!=pw){
					    	  $('#errpw').html("비밀번호가 맞지 않습니다!!");
							  $('#errpw').show();
							  return;
				    	  }
				    	  else{
				    		  pwdCheck=1;
				    		  $.ajax({
				  				type:"POST",
				  		        url:"studyboard_insert.ubi",
				  		        data:{
				  		        	nick : inick,
				  		        	title : ititle,
				  		        	start_day : istart_day,
				  		        	end_day : iend_day,
				  		        	lang : ilang,
				  		        	color : icolor,
				  		        	memo : imemo,
				  		        	pw : ipw,
				  		        	flag : iflag
				  		        },
				  		        success: function(){
				  		        	Swal.fire({
											  title: '입력 완료!! 마이페이지에서 확인가능!!',
											  type: 'success',
											  confirmButtonText: '확인',
											  width: '20%',
									})
				  		        	location.reload();	
				  		        },
				  		        error: function () {
				  		        	location.reload();
				  				}
				  			});
				    	  }
					  },
					  error: function () {
						  return;
					  }
				})
			}
		}
	});
	
	
	
	
	
	var nowTime=new Date();
	var total=$('#total').val();
	var dbTime="";
	for(var i=1;i<=total;i++){
		dbTime=$('#time'+i).val();
		var y=dbTime.substr(0,4)*1,now_y=nowTime.getFullYear();
		var m=dbTime.substr(5,2)*1,now_m=nowTime.getMonth()+1;
		var d=dbTime.substr(8,2)*1,now_d=nowTime.getDate();
		var h=dbTime.substr(11,2)*1,now_h=nowTime.getHours();
		var mn=dbTime.substr(14,2)*1,now_mn=nowTime.getMinutes();
		
		if(now_y>y){
			$('#timeLook'+i).html((now_y-y)+"년 전");
		}else{
			if(now_m>m){$('#timeLook'+i).html(now_m-m+"달 전");}
			else{
				if(now_d>d){$('#timeLook'+i).html(now_d-d+"일 전");}
				else{
					if(now_h>h){$('#timeLook'+i).html(now_h-h+"시간 전");}
					else{
						if(now_mn>mn&&now_mn-mn>10){$('#timeLook'+i).html(now_mn-mn+"분 전");}
						else{
							$('#timeLook'+i).html("<img src=\"<%=request.getContextPath()%>/resources/images/new1.gif\" width=\"35px\">");
						}
					}
				}
			}
		}
	}
	
});

function view(num) {
	$('#study_delete').css('display','none');
	$('#study_join').css('display','none');

	var nick = localStorage.getItem("nick");
	if(localStorage.getItem("loginId")==null){
		
		Swal.fire({
				  title: '로그인 해주세요!',
				  type: 'warning',
				  confirmButtonText: '확인',
				  width: '20%',
		})
	}
	else{
		var view_num = num;
		$('#StudyBoardView').animate({opacity:'1'},0);
		$('#StudyBoardView').show("fade",100);
		$.ajax({
			url :"study_board_view.ubi",
			data:{
				num : view_num
			},
			success:function(result){
				if(result.nick==nick){
					 $('#study_delete').show();
				}
				else{
					 $('#study_join').show();
				}	
				$('#view_memo').html(result.memo);
				$('#view_start').html(result.start_day);
				$('#view_end').html(result.end_day);
			}
		});
		$('#study_join').click(function() {
			$.ajax({
				url:"study_join.ubi",
				data:{nick : localStorage.getItem("nick")},
				success: function(data) {
					Swal.fire({
						  title: '참석 완료!!! 승인을 기다려주세요~',
						  type: 'success',
						  confirmButtonText: '확인',
						  width: '20%',
					});
				}
			})
			location.reload();
		});
		
		$('#study_delete').click(function() {
			var deleteconfirm = confirm("정말삭제하시겠습니까?");
			if(deleteconfirm){
				$.ajax({
					url:"study_delete.ubi",
					data:{num : num},
					success: function(data) {
						Swal.fire({
							  title: '삭제 완료!!',
							  type: 'success',
							  confirmButtonText: '확인',
							  width: '20%',
						});
					}
				})
				location.reload();
			}
		});
	}
	
}





</script>
</head>
<body>
<input type="hidden" value="${serverTime}" id="serverTime">
<input type="hidden" value="${totalCount}" id="total">
<div style="background-color: rgba(255,255,255,0.8); padding: 40px;box-shadow: 0px 10px 8px 8px rgba(255,255,255,0.8);padding-left: 100px;">
<span style="font-size: 50px;">
스터디 모임
</span><br>
<hr color="#ddd">
<span style="font-size: 15px;">
스터디 모임 수 : ${totalCount }
</span>
</div>

<div style="position: absolute;left: 10px; bottom: 10px; position: fixed;"> 
	<input id="inputBut" type="button" value="모임만들기" style="font-size: 25px; background-color: rgba(255,255,255,1); border: 1px solid #ccc; padding: 10px;padding-right: 50px;padding-left: 50px;">
</div>
<div align="center">
	<form action="studyboard_list.ubi" method="get"> 
			<select name="whatColumn" class="input2">
				<option value="all">전체 검색
				<option value="title">모임명
				<option value="lang">언어
			</select>
			<input type="text" class="input1" name="keyword" value="">
			<input type="submit" class="button1" value="검색">
	</form>
</div>
<div style="margin: 100px;text-align: center;">
<!-- 모임 추가 -->
<div class="eft2" id="StudyBoardInput" style="opacity: 0;">
	<div style="width:60%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 40px;padding: 50px;padding-top: 10px;font-size: 20px;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
			<span class="closeDetail">X</span> 
		</p>
		<span style="font-size: 40px;" id="inputTitleW">모임만들기</span>
		<hr>
		<input type="hidden" name="flag" id="flag" value="125125125"/>
		<table style="border:1px;width: 100%">
			<tr>
				<th>모임명</th>
				<td align="left">
					<input class="input_study" type="text" name="title" id="title" value="">
				</td>
				<td align="left">
					<span id="errtitle" style="color:red;display:none;"></span>
				</td>
			</tr>
			<tr>
				<th>시작</th>
				<td align="left">
					<input class="input_study" type="text" name="start_day" id="start_day" value="">
				</td>
				<td align="left" width="40%">
					<span id="errstart_day" style="color: red;display:none;"></span>
				</td>
			</tr>
			<tr>
				<th>마지막</th>
				<td align="left">
					<input class="input_study" type="text" name="end_day" id="end_day" value="">
				</td>
				<td align="left" width="40%">
					<span id="errend_day" style="color: red;display:none;"></span>
				</td>
			</tr>
			<tr>
				<th>언어</th>
				<td align="left">
				  <select name="lang" id="lang" style="width:30%">
	                  <option value="">선택</option>
	                  <option value="JAVA">JAVA</option>
	                  <option value="C">C</option>
	                  <option value="C++">C++</option>
	                  <option value="Python">Python</option>
                  </select>
                </td>
				<td align="left" width="40%">
                  <span id="errlang" style="color: red;display:none;"></span>
				</td>
			</tr>
			<tr>
				<th>색상</th>
				<td align="left">
					<select name="color" id="color" style="width: 45%">
						<option value="">선택</option>
		                <option value="#D25565" style="color:#D25565;">빨간색</option>
		                <option value="#9775fa" style="color:#9775fa;">보라색</option>
		                <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
		                <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
		                <option value="#f06595" style="color:#f06595;">핑크색</option>
		                <option value="#63e6be" style="color:#63e6be;">연두색</option>
		                <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
		                <option value="#4d638c" style="color:#4d638c;">남색</option>
		                <option value="#495057" style="color:#495057;">검정색</option>
	                </select>
	                <span style="font-size: 15px;color:#fa1;"> &nbsp;*마이페이지에 등록될 색상입니다.*</span>
	            </td>
				<td align="left" width="40%">
	                <span id="errcolor" style="color: red;display:none;"></span>
				</td>
			</tr>
			<tr>
				<th>메모</th>
				<td align="left">
					<textarea rows="4" cols="50" class="input_study" name="memo" id="memo"></textarea>
				</td>
				<td align="left" width="40%">	
					<span id="errmemo" style="color: red;display:none;"></span>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td align="left">
					<input class="input_study" type="password" name="pw" id="pw" value="">
				</td>
				<td align="left" width="40%">	
					<span id="errpw" style="color: red;display:none;"></span>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<input type="button" value="만들기" class="button1" id="study_input">
				</td>
			</tr>
		</table>
	</div>              
</div>


<!-- 제목 -->
<div class="eft2" id="StudyBoardView" style="opacity: 0;">
	<div style="width:60%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 40px;padding: 50px;padding-top: 10px;font-size: 20px;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
			<span class="closeDetail">X</span> 
		</p>
		기간 : <span id="view_start"></span>&nbsp; ~ 
		      &nbsp;<span id="view_end"></span> <br><br>
			 <div id="view_memo"></div><br>
			 <button id="study_join" class="button1" style="margin: auto;display:none;" onClick="">참여</button>
			 <button id="study_delete" class="button1" style="margin: auto;display:none;" onClick="">삭제</button>
	</div>
</div>		



	<table style="margin: auto;width: 85%;background-color: rgba(255,255,255,1);box-shadow: 0px 0px 10px 10px rgba(255,255,255,1);text-align:left;border-collapse: collapse;">
		<tr>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: left;padding: 5px;">제목</td>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: left;padding: 5px;">언어</td>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">작성자</td>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">작성일</td>
			<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">조회수</td>
		</tr>
	<%int i=0; %>
<c:forEach items="${lists }" var="list">
	<%i+=1; %>
	<tr>
	<td class="eft1" id="${list.num}" style="border: 1px solid #ddd;background-color: white;" onclick="view('${list.num}')" 
	onmouseover="this.style.background='rgba(255,217,102,0.5)'" onmouseout="this.style.background='#fff'" >
	<input type="hidden" value="${list.num}" name="num">
	<div class="listOne" style="cursor: pointer;">
		<c:if test="${list.re_level==0}">
			
		</c:if>
		<c:if test="${list.re_level>0}">
			<img src="<%=request.getContextPath()%>/resources/images/eft1.png" width="${(list.re_level-1)*25}px" height="5px">
			<img src="<%=request.getContextPath()%>/resources/images/ref2.png" width="20px">
		</c:if>
		<span style="font-size: 20px;">${list.title}</span>
		<c:if test="${list.read_count>=10}">
			<img src="<%=request.getContextPath()%>/resources/images/hot2.gif" width="100px">
		</c:if>
			<input type="hidden" value="${list.read_count}" name="read_count">
			<input type="hidden" value="${list.title}" name="title">
			<input type="hidden" value="${list.memo}" name="memo">
			<input type="hidden" value="${list.day}" name="day">
			<input type="hidden" value="${list.ref}" name="ref">
			<input type="hidden" value="${list.re_level}" name="re_level">
			<input type="hidden" value="${list.pw}" name="pw">
	</div>
	</td>
	<td style="border: 1px solid #ddd; text-align: center;background-color: #fafafa;">
		<span style="color: rgba(0,0,0,0.3);">${list.lang }</span>
	</td>
	<td style="border: 1px solid #ddd; text-align: center;background-color: white;">
		<span style="color: rgba(0,0,0,0.5);">${list.nick }</span>
	</td>
	<td style="border: 1px solid #ddd; text-align: center;background-color: #fafafa;">
		<span style="color: rgba(0,0,0,0.3);" id="timeLook<%=i%>"></span>
		<input class="time" id="time<%=i%>" value="${list.day }" type="hidden">
	</td>
	<td style="border: 1px solid #ddd; background-color: white;color: rgba(0,0,0,0.3);text-align: center;">${list.read_count}</td>
	</tr>
</c:forEach>
</table>
</div>
<div align="center" style="font-size: 30px;">
		${pageInfo.pagingHtml}
</div>
</body>
</html>
<%@ include file="../bottom.jsp" %>