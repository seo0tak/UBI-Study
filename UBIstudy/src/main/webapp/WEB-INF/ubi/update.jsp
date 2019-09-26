<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./../common/common.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
		background-image: url("<%=request.getContextPath()%>/resources/images/project_img8-3.png");
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(function(){
	loginId=localStorage.getItem("loginId");
	if(loginId==null){
		location.href="main.ubi";
	}
	
	$('#btn-upload').on('click', function () {
		alert("btn-upload click됨");
		console.log('btn-upload');
		var form = new FormData(document.getElementById('uploadForm'));
		$.ajax({
			url: "upload.ubi",
			data: form,
			dataType: 'text',
			processData: false,
			contentType: false,
			type: 'POST',
			success: function (response) {
				alert("성공");
				console.log('success');
				console.log(response);
			},
			error: function (jqXHR) {
				alert("실패");
				console.log('error');
			}
		});
	});

});
</script>
</head>
<body>
<%@ include file="top.jsp" %>
<div style="background-color: rgba(255,255,255,0.8); padding: 40px;box-shadow: 0px 10px 8px 8px rgba(255,255,255,0.8);padding-left: 100px;">
<span style="font-size: 50px;">
회원정보 수정
</span><br>
<hr color="#ddd">
<span style="font-size: 15px;">
아이디나 패스워드, 프로필 사진 등을 수정하고 저장합니다.
</span>
</div>

<br>
아이디 : ${bean.id }<br>
패스워드 : ${bean.pw }<br>
이름 : ${bean.name }<br>
비밀번호 : ${bean.pnum }<br>
닉네임 : ${bean.nick }<br>
이미지 : ${bean.image }<br>

<div style="text-align: center;">
	<form id="uploadForm" enctype="multipart/form-data">
		<input type="file" class="button1" id="fileId" name="file-data"/>
	</form>
	<button id="btn-upload" class="button1">업로드</button>

</div>


<%@ include file="bottom.jsp" %>
</body>
</html>