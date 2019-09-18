<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>    
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<script type="text/javascript">
/* //아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
var idck = 0;

$("#idck").click(function() {
    alert("1");
    //userid 를 param.
    var id =  $("#id").val(); 
    
    $.ajax({
        async: true,
        type : 'POST',
        data : id,
        url : "idcheck.ubi",
        dataType : "json",
        contentType: "application/json; charset=UTF-8",
        success : function(data) {
            if (data.cnt > 0) {
                alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                //$("#userid").addClass("has-success")
               // $("#userid").removeClass("has-error")
                //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                $("#id").focus();
            
            } else {
                alert("사용가능한 아이디입니다.");
                //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
               // $("#userid").addClass("has-success")
               // $("#userid").removeClass("has-error")
                $("#pw").focus();
                //아이디가 중복하지 않으면  idck = 1 
                idck = 1;
            }
        },
        error : function(error) {
            
            alert("error : " + error);
        }
    });
}); */
</script>
</head>
<body>
<div style="background-color: rgba(255,255,255,0.8); padding: 40px;box-shadow: 0px 10px 8px 8px rgba(255,255,255,0.8);padding-left: 100px;">
<span style="font-size: 50px;">
회원 등록
</span><br>
<hr color="#ddd">
</div>
<div style="margin: 100px;text-align: center;">

	<form:form commandName="member" method="post" action="register.ubi">
	   <table border=1 style="margin: auto;width: 85%;background-color: rgba(255,255,255,1);box-shadow: 0px 0px 10px 10px rgba(255,255,255,1);text-align:left;border-collapse: collapse;">
	      	<tr>
	      		<th width="10%">아이디</th>
	      		<td>
	      			<input type="text" name="id" id="id" style="width: 50%;line-height:30px;font-size:20px;" value="${member.id}">
	      			<input type="button" class="button1" value="중복확인" id="idck">
	      			<form:errors cssClass="err" path="id" />
	      		</td>
	      	</tr>
	      	<tr>
	      		<th width="20%">비밀번호</th>
	      		<td>
	      			<input type="text" name="pw" id="pw" style="width: 50%;line-height:30px;font-size:20px;">
	      			<form:errors cssClass="err" path="pw" />
	      		</td>
	      	</tr>
	      	<tr>
	      		<th width="20%">비밀번호확인</th>
	      		<td>
	      			<input type="text" name="pw_check" style="width: 50%;line-height:30px;font-size:20px;">
	      			<form:errors cssClass="err" path="pw_check" />
	      		</td>
	      	</tr>
	      	<tr>
	      		<th width="20%">이름</th>
	      		<td>
	      			<input type="text" name="name" style="width: 50%;line-height:30px;font-size:20px;">
	      			<form:errors cssClass="err" path="name" />
	      		</td>
	      	</tr>
	      	<tr>
	      		<th width="20%">이메일</th>
	      		<td>
	      			<input type="text" name="email" style="width: 50%;line-height:30px;font-size:20px;">
	      			<form:errors cssClass="err" path="email" />
	      		</td>
	      	</tr>
	      	<tr>
	      		<th width="20%">핸드폰</th>
	      		<td>
	      			<input type="text" name="pnum" style="width: 50%;line-height:30px;font-size:20px;">
	      			<form:errors cssClass="err" path="pnum" />
	      		</td>
	      	</tr>
	      	<tr>
	      		<th width="20%">닉네임</th>
	      		<td>
	      			<input type="text" name="nick" style="width: 50%;line-height:30px;font-size:20px;">
	      			<form:errors cssClass="err" path="nick" />
	      			
	      		</td>
	      	</tr>
	      	<tr>
	      		<td colspan="2" align="center">
	      			<input type="submit" class="button1" value="가입하기">
	      		</td>
	      	</tr>
	      </table> 
	</form:form>
</div>	
</body>
</html>
<%@ include file="bottom.jsp" %>