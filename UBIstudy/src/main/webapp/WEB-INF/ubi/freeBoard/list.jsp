<%@page import="ubi.model.UbiDao"%>
<%@page import="ubi.model.UbiBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../../common/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	#detailCon{
		
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
	.input1[type=password]{
		font-family: initial;
	}
	input{
		outline-color: #fa1;
		outline-width: 2px;
		
	}
	#divTop{
		z-index: 10;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
	$(function(){
		var pw1="";
		var fid1="";
		
		var name1="";
		var title1="";
		var content1="";
		var ref1=0;
		var re_level1=0;
		
		$('.eft2').hide();
		
		$('.eft1').mouseover(function(){
			$(this).stop().animate({
				color:'#fa1'
			},200);
		}).mouseout(function(){
			$(this).stop().animate({
				color:'black'
			},200);
		}).click(function(){
			fid1=$(this).attr("id");
			$.ajax({
				 	type:"POST",
			        url:"read_count_update.ubi",
			        data : {id : fid1},
			        success: function(){
			            //alert("success");			            
			        },
			        error: function() {
			            //alert("error");
			        }
			    });
			
			var read_count=$('#'+fid1+' input[name=read_count]').val();
			name1=$('#'+fid1+' input[name=name]').val();
			title1=$('#'+fid1+' input[name=title]').val();
			content1=$('#'+fid1+' input[name=content]').val();
			var day=$('#'+fid1+' input[name=day]').val();
			
			pw1=$('#'+fid1+' input[name=pw]').val();
			ref1=$('#'+fid1+' input[name=ref]').val();
			re_level1=$('#'+fid1+' input[name=re_level]').val()*1;
			
			
			
			$('#detailCon #read_count').html("조회수 〔"+(read_count*1+1)+"〕");
			$('#detailCon #name').html(name1);
			$('#detailCon #title').html("◇"+title1);
			$('#detailCon #content').html(content1);
			$('#detailCon #day').html(day);
			
			$('#detailCon').animate({opacity:'1'},0);
			$('#FreeBoardInput').animate({opacity:'1'},0);
			$('#InputPassword').animate({opacity:'1'},0);
			
			
			$('#detailCon').show("fade",100);
			
		});
		
		
		
		$('.closeDetail').click(function(){
			$('.eft2').hide("fade",1,function(){
				location.reload();					
			});

		});
		
		var WhatType="input";
		$('#inputBut').click(function(){
			$('#detailCon').animate({opacity:'1'},0);
			$('#FreeBoardInput').animate({opacity:'1'},0);
			$('#InputPassword').animate({opacity:'1'},0);
			WhatType="input";
			$('#inputTitleW').html("글쓰기");
			$('#pwDiv').show();
			$('#FreeBoardInput').show("fade",100);
		});
		$('#updateBut').click(function(){
			$('.eft2').hide();
			WhatType="update";
			$('#InputPassword').show("fade",100);
		});
		$('#refBut').click(function(){
			$('.eft2').hide();
			WhatType="ref";
			$('#inputTitleW').html("답글달기");
			$('#pwDiv').show();
			$('#FreeBoardInput').show("fade",100);
		});
		$('#deleteBut').click(function(){
			$('.eft2').hide();
			WhatType="delete";
			$('#InputPassword').show("fade",100);
		});
		
		
		$('#input_pwBut').click(function(){
			var inputPw=$('#input_pw').val().trim();
			//alert(pw+" / "+inputPw);
			if(pw1!=inputPw){
				$('#spanAlert').html("　※비밀번호 불일치※　");
			}else{
				$('#spanAlert').html("");
				$('.eft2').hide();
				if(WhatType=="update"){
					$('#inputTitleW').html("수정");
					$('#pwDiv').hide();
					$('#FreeBoardInput').show("fade",100);
				}else if(WhatType=="delete"){
					$.ajax({
					 	type:"POST",
				        url:"freeboard_delete.ubi",
				        data : {id : fid1},
				        success: function(){		            
					location.reload();
				        },
				        error: function() {
					location.reload();
				        }
				    });
				}
			}
		});
		
		$('#FreeBoardInputBut').click(function(){
			
			name1=$('input[name=input_name]').val();
			title1=$('input[name=input_title]').val();
			content1=$('textarea[name=input_content]').val();
			pw1=$('input[name=input_pw]').val();
			
			
			if(WhatType=="update"){
				$.ajax({
				 	type:"POST",
			        url:"freeboard_update.ubi",
			        data : {id : fid1,f_name : name1,f_title : title1,f_content : content1},
			        success: function(){		            
				location.reload();
			        },
			        error: function() {
				location.reload();
			        }
			    });
			}else if(WhatType=="ref"){
				$.ajax({
				 	type:"POST",
			        url:"freeboard_ref.ubi",
			        data : {id : fid1,f_name : name1,f_title : title1,f_content : content1,f_ref : ref1,f_re_level : (re_level1*1+1),pw : pw1},
			        success: function(){		            
				location.reload();
			        },
			        error: function() {
				location.reload();
			        }
			    });
			}else if(WhatType=="input"){
				fid1="0";
				$.ajax({
				 	type:"POST",
			        url:"freeboard_input.ubi",
			        data : {id : fid1,f_name : name1,f_title : title1,f_content : content1,pw : pw1},
			        success: function(){
				location.reload();
			        },
			        error: function() {
				location.reload();
			        }
			    });
			}
			
		});
		
		
		
	});
</script>

</head>
<body>
<%@ include file="../top.jsp" %>
<div style="background-color: rgba(255,255,255,0.8); padding: 40px;box-shadow: 0px 10px 8px 8px rgba(255,255,255,0.8);padding-left: 100px;">
<span style="font-size: 50px;">
자유 게시판
</span><br>
<hr color="#ddd">
<span style="font-size: 15px;">
조회된 게시물 수 : ${totalCount }
</span>
</div>

<div style="position: absolute;left: 10px; bottom: 10px; position: fixed;"> 
	<input id="inputBut" type="button" value="글쓰기" style="font-size: 25px; background-color: rgba(255,255,255,1); border: 1px solid #ccc; padding: 10px;padding-right: 50px;padding-left: 50px;">
</div>

<div style="margin: 100px;text-align: center;">

<table style="margin: auto;width: 85%;background-color: rgba(255,255,255,1);box-shadow: 0px 0px 10px 10px rgba(255,255,255,1);text-align:left;border-collapse: collapse;">

<tr>
	<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">조회수</td>
	<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: left;padding: 5px;">제목</td>
	<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">작성자</td>
	<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;padding: 5px;">작성일</td>
</tr>

<c:forEach items="${lists }" var="list">

	<tr>
		<td style="border: 1px solid #ddd; background-color: #fafafa;color: rgba(0,0,0,0.5);text-align: center;">${list.read_count}</td>
	
	<%-- <td class="eft1" id="${list.num}"> --%>
	<td class="eft1" id="${list.num}" style="border: 1px solid #ddd;background-color: white;">
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
			<input type="hidden" value="${list.name}" name="name">
			<input type="hidden" value="${list.title}" name="title">
			<input type="hidden" value="${list.content}" name="content">
			<input type="hidden" value="${list.day}" name="day">
			
			<input type="hidden" value="${list.num}" name="num">
			<input type="hidden" value="${list.ref}" name="ref">
			<input type="hidden" value="${list.re_level}" name="re_level">
			<input type="hidden" value="${list.pw}" name="pw">
	</div>
	</td>
	<td style="border: 1px solid #ddd; text-align: center;background-color: #fafafa;">
		<span style="color: rgba(0,0,0,0.4);">${list.name }</span>
	</td>
	<td style="border: 1px solid #ddd; text-align: center;background-color: white;">
		<span style="color: rgba(0,0,0,0.3);">${list.day }</span>
	</td>
	</tr>
</c:forEach>
</table>
</div>


<div id="detailCon" style="opacity: 0;" class="eft2">

	<div id="movement" style="width:60%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 200px;padding: 50px;padding-top: 10px;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
		<span class="closeDetail">X</span> 
		</p>
		
		<span id="title" style="font-size: 40px;">
			◇title
		</span><br><br>
		<span id="name" style="font-size: 20px;color: rgba(0,0,0,0.5);">
			작성자아아아ㅏㅏ아ㅏ
		</span>
		<span id="day" style="font-size: 20px;color: rgba(0,0,0,0.2);">
			작성이잉링ㄹ닌ㅁㅇㄹ
		</span><br><br>
		<span id="read_count" style="font-size: 20px;color: rgba(0,0,0,0.7);">
			조회수 : ?
		</span>
		<hr>
		<br>
		<span id="content" style="font-size: 25px;">
			내요오오오옹
		</span>
		<p style="text-align: right;">
			<input type="button" value="답글" class="button1" id="refBut">
			<input type="button" value="수정" class="button1" id="updateBut">
			<input type="button" value="삭제" class="button1" id="deleteBut">
		</p>
	</div>

</div>

<div class="eft2" id="FreeBoardInput" style="opacity: 0;">
	<div style="width:60%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 40px;padding: 50px;padding-top: 10px;font-size: 20px;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
			<span class="closeDetail">X</span> 
		</p>
		<span style="font-size: 40px;" id="inputTitleW">글쓰기</span>
		<hr>
		<div style="text-align: center;" >
		<span style="">제목</span>
		<br>
		<input type="text" value="" name="input_title" class="input1"><br><br>
		<span>작성자</span>
		<br>
		<input type="text" value="" name="input_name" class="input1"><br><br>
		<div id="pwDiv"><span>패스워드</span>
		<br>
		<input type="password" value="" name="input_pw" class="input1"></div><br><br>
		<span>내용</span>
		<br>
		<textarea rows="5" cols="100" name="input_content" class="input1"></textarea><br><br>
		
		<input type="button" value="확인" class="button1" id="FreeBoardInputBut">
		</div>
	</div>
</div>


<div class="eft2" id="InputPassword" style="opacity: 0;">
	<div style="width:60%;margin: auto;background-color: rgba(255,255,255,1);margin-top: 210px;padding: 50px;padding-top: 10px;font-size: 20px;color: black;">
		<p style="text-align: right;font-size: 30px;cursor: pointer;">
			<span class="closeDetail">X</span> 
		</p>
		<span style="font-size: 40px;">비밀번호 입력</span><span style="font-size: 20px;color: red;" id="spanAlert"></span>
		<hr>
		<input type="password" value="" name="input_pw" class="input1" id="input_pw"><input type="button" class="button1" value="확인" style="margin-left: 100px;" id="input_pwBut">
		<br>
	</div>
</div>




<%@ include file="../bottom.jsp" %>
</body>
</html>